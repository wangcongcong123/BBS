package com.bbs.api;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.TreeMap;

public class Signature {
	/*
	 * 此方法为静态方法，通过类名.方法名调用。
	 * 需要参数为TreeMap类型，存放需要签名的字段及其值。
	 * 验证签名的方式可在 https://mp.weixin.qq.com/debug/cgi-bin/sandbox?t=jsapisign 查询到。
	 * 测试时随意传入参数即可。
	 */
	public static String signMD5(TreeMap<String, String> map){
		String originalText = "";
		Iterator<String> iterator = map.keySet().iterator();
		String temp;
		String key = null;
		while (iterator.hasNext()) {
			temp = iterator.next();
			if (temp.equals("key")) {
				key = temp;
				continue;
			}
			originalText+=temp;
			originalText+="=";
			originalText+=map.get(temp);
			originalText+="&";
		}
		if (key!=null) {
			originalText+=key;
			originalText+="=";
			originalText+=map.get(key);
		}
		else{
			originalText = originalText.substring(0, originalText.length()-1);
		}
		MessageDigest messageDigest=null;
		try {
			messageDigest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		messageDigest.update(originalText.getBytes());
		byte b[] = messageDigest.digest();
		int i;
		StringBuffer buf = new StringBuffer("");
		for (int offset = 0; offset < b.length; offset++) {
			i = b[offset];
			if (i < 0)
				i += 256;
			if (i < 16)
				buf.append("0");
			buf.append(Integer.toHexString(i));
		}
		String result = buf.toString();
		return result;
	}
	public static String signSHA(TreeMap<String, String> map){
		String originalText = "";
		Iterator<String> iterator = map.keySet().iterator();
		String temp;
		String key = null;
		while (iterator.hasNext()) {
			temp = iterator.next();
			if (temp.equals("key")) {
				key = temp;
				continue;
			}
			originalText+=temp;
			originalText+="=";
			originalText+=map.get(temp);
			originalText+="&";
		}
		if (key!=null) {
			originalText+=key;
			originalText+="=";
			originalText+=map.get(key);
		}
		else{
			originalText = originalText.substring(0, originalText.length()-1);
		}
		MessageDigest messageDigest=null;
		try {
			messageDigest = MessageDigest.getInstance("SHA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		messageDigest.update(originalText.getBytes());
		byte b[] = messageDigest.digest();
		int i;
		StringBuffer buf = new StringBuffer("");
		for (int offset = 0; offset < b.length; offset++) {
			i = b[offset];
			if (i < 0)
				i += 256;
			if (i < 16)
				buf.append("0");
			buf.append(Integer.toHexString(i));
		}
		String result = buf.toString();
		return result;
	}
//	public static void main(String[] args) {
//		TreeMap<String, String> map = new TreeMap<>();
//		map.put("", "");
//		System.out.println(signSHA(map));
//	}
}
