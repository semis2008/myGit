package com.chatBear.comet;

public class MsgFactory {
	private static MsgFactory factory;

	private MsgFactory() {
	}

	public static MsgFactory getInstance() {
		if (factory == null) {
			factory = new MsgFactory();
		}
		return factory;

	}

}
