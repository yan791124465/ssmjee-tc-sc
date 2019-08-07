package com.jee.ssm.common.config;

import org.apache.log4j.LogManager;

public class Logger{

	private static org.apache.log4j.Logger logger = LogManager.getLogger("ssmjee");

	public static void test(Object message){
		logger.info(message);
	}

	public static void shiro(Object message){
		//logger.info(message);
	}

	public static void socket(String message) {
		logger.info(message);
	}

	public static void exception(Object message){
		logger.info(message);
	}

	public static void info(Object message) {
		logger.info(message);
	}

	public static void error(Object message){
		logger.error(message);
	}

	public static void error(Object message,Throwable t){
		logger.error(message,t);
	}

	public static void debug(Object message){
		logger.debug(message);
	}


}