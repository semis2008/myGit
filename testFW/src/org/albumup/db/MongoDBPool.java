package org.albumup.db;

import java.net.UnknownHostException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.DB;

public class MongoDBPool {
	public static final String HOST = "localhost";
	public static final int	   PORT = 27017;
	public static final String DB   = "db";
	public static final String USER = "";
	public static final String PWD  = "";
	private static MongoClient mongo;
	private static MongoDBPool mongoPool;
	
	private static final Log log = LogFactory.getLog(MongoDBPool.class);
	
	private MongoDBPool(){
		try {
			mongo = new MongoClient(HOST, PORT);
			log.info("mongo db connection success");
		} catch (UnknownHostException e) {
			log.error("mongo db connection error");
			e.printStackTrace();
		}
	}
	
	public static MongoDBPool getInstance(){
		if(mongoPool == null){
			synchronized(MongoDBPool.class){
				if(mongoPool == null){
					mongoPool = new MongoDBPool();
					log.info("MongoDBPool init completed");
				}
			}
		}
		return mongoPool;
	}
	/*
	 * 关闭mongo连接池
	 */
	public static void close(){
		if(mongo != null){
			mongo.close();
			mongo = null;
		}
		
	}
	
	public DB getDB(){
		DB db =	mongo.getDB(DB);
		if(USER != null && USER.length() != 0){
			if(db.authenticate(USER, PWD.toCharArray())){
				return db;
			}
		}
		return db;
	}
	
	public DBCollection getCollection(String coll){
		DB db =	getDB();
		return db.getCollection(coll);
		
	}
}
