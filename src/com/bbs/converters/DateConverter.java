package com.bbs.converters;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class DateConverter extends StrutsTypeConverter {

	private DateFormat dateFormat;
	{
		dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	}
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		if (arg2==Date.class) {
			try {
				return dateFormat.parse(arg1[0]);
			} catch (ParseException e) {
				e.printStackTrace();
				return null;
			}
		}
		else{
			return null;
		}
	}

	@Override
	public String convertToString(Map arg0, Object arg1) {
		if (arg1 instanceof Date) {
			return dateFormat.format((Date)arg1);
		}
		return null;
	}
	public static void main(String[] args) {
		String[] strings = {"2017-07-24 14:00:47"};
		Map<Object, Object> map = new HashMap<Object,Object>();
		System.out.println(new DateConverter().convertToString(map, new Date()));
		System.out.println(new DateConverter().convertFromString(map, strings, Date.class));
	}
}
