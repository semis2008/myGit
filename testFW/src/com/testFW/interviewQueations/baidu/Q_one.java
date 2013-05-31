package com.testFW.interviewQueations.baidu;

import java.util.ArrayList;
import java.util.List;

import com.testFW.interviewQueations.common.baseQuestion;
import com.testFW.interviewQueations.enums.bulbEnum;
import com.testFW.interviewQueations.model.bulb;

/**
 * 百度的面试题：一百个灯泡排成一排，第一轮将所有灯泡打开；第二轮每隔一个灯泡关掉一个。即排在偶数的灯泡被关掉，
 * 第三轮每隔两个灯泡，将开着的灯泡关掉，关掉的灯泡打开。依次类推，第n轮结束的时候，还有几盏灯泡亮着。
 * @author kalor
 */
public class Q_one extends baseQuestion{
	
	private static List<bulb> bulbs;
	private static int n;
	private int size;
	
	public Q_one(int n, int size) {
		super();
		Q_one.n = n;
		this.size = size;
		setQuestionInfo("百度的面试题：一百个灯泡排成一排，第一轮将所有灯泡打开；第二轮每隔一个灯泡关掉一个。即排" +
		"在偶数的灯泡被关掉，第三轮每隔两个灯泡，将开着的灯泡关掉，关掉的灯泡打开。依次类推，第n轮结束的时候，还有几盏灯泡亮着。");
	}

	/**
	 * main方法测试
	 * @param args
	 */
	public static void main(String args[]) {
		Q_one one = new Q_one(2, 100);
		one.initBulbList();
		for(int i=1;i<n+1;i++) {
			one.doQuestion(i);
		}
		showOnNum();
	}
	
	/**
	 * 显示灯泡亮着的个数
	 */
	private static void showOnNum() {
		int num = 0;
		for(bulb bl:bulbs) {
			if(bl.getState().equals(bulbEnum.bulb_On)) {
				num++;
			}
			System.out.println("--------灯泡id："+bl.getId()+"---状态："+bl.getState()+"----");	
		}
		System.out.print("--------亮着的灯泡数目是："+num+"个------");
	}
	
	/**
	 * 进行一轮模拟
	 * @return
	 */
	private String doQuestion(int n) {
		int temp;
		for(int i=1;i<size+1;i++) {
			temp = i*n-1;
			if(temp<size) {
				changeBlubState(bulbs.get(temp));
			}
		}
		return "";
	}

	/**
	 * 初始化灯泡list
	 * @param size 灯泡数目
	 */
	private void initBulbList() {
		bulbs = new ArrayList<bulb>();
		for(int i=0;i<size;i++) {
			bulb bl = new bulb(i, bulbEnum.bulb_Off);
			bulbs.add(bl);
		}
	}
	
	
	/**
	 * 改变灯泡的开关状态
	 * @param bl
	 */
	private void changeBlubState(bulb bl) {
		if(bulbEnum.bulb_Off.equals(bl.getState())) {
			bl.setState(bulbEnum.bulb_On);
		}else {
			if(bulbEnum.bulb_On.equals(bl.getState())) {
				bl.setState(bulbEnum.bulb_Off);
			}
		}
	}

	public List<bulb> getBulbs() {
		return bulbs;
	}

	public void setBulbs(List<bulb> bulbs) {
		Q_one.bulbs = bulbs;
	}

	public int getN() {
		return n;
	}

	public void setN(int n) {
		Q_one.n = n;
	}

	public int getSize() {
		return size;
	}
	
	
	public void setSize(int size) {
		this.size = size;
	}
	
	
}
