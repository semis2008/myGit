package com.testFW.util;

import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类
 * @author Kalor
 * @time 2012-12-17
 */
public class DateUtil {
	/**
	 * 获取当前的时间
	 * 
	 * @return
	 */
	public static Calendar getTimeNow() {
		Calendar cal = Calendar.getInstance();
		return cal;
	}

	/**
	 * 将date对象转换为calendar
	 * 
	 * @param date
	 * @return
	 */
	public static Calendar dateToCalendar(Date date) {
		Calendar cal = Calendar.getInstance();
		if (date == null) {
			return null;
		} else {
			cal.setTime(date);
		}
		return cal;
	}

	/**
	 * 格式化指定的日期
	 * 
	 * @param date
	 *            日期
	 * @param type
	 *            1：格式：2011年11月11日 ； 2：：2011-2-2 ； 3：2011-2-2 11:45
	 * @return
	 */
	public static String formatDate(Date date, int type) {
		if (date == null)
			return "";
		Calendar cal = dateToCalendar(date);
		String res = "";
		switch (type) {
		case 1:
			res = cal.get(Calendar.YEAR) + "年" + (cal.get(Calendar.MONTH) + 1)
					+ "月" + cal.get(Calendar.DAY_OF_MONTH) + "日";
			break;
		case 2:
			res = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1)
					+ "-" + cal.get(Calendar.DAY_OF_MONTH);
			break;
		case 3:
			res = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1)
					+ "-" + cal.get(Calendar.DAY_OF_MONTH) + " "
					+ cal.get(Calendar.HOUR_OF_DAY) + ":"
					+ cal.get(Calendar.MINUTE);
			break;

		default:
			break;
		}
		return res;
	}

}
