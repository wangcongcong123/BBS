package com.bbs.api;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;

import javax.net.ssl.HttpsURLConnection;

import com.bbs.converters.JsonConverter;

public class JSAPIInitial {
	private String getTicket(){
		String ticket="";
		String accessToken = AccessTokenManager.getAccessToken();
		URL url;
		HttpsURLConnection httpsURLConnection;
		InputStreamReader inputStreamReader;
		try {
			url = new URL("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+accessToken+"&type=jsapi");
			httpsURLConnection = (HttpsURLConnection) url.openConnection();
			inputStreamReader = new InputStreamReader(httpsURLConnection.getInputStream());
			int i = inputStreamReader.read();
			String temp = "";
			while(i!=-1){
				temp+=(char)i;
				i = inputStreamReader.read();
			}
			JsonConverter converter = new JsonConverter();
			Map<String, Object> map = converter.convertTonMap(temp);
			if (map.get("errcode")!=null&&((int)map.get("errcode"))==0) {
				ticket = (String) map.get("ticket");
				System.out.println(map.get("ticket"));
			}
			else{
				System.out.println(map.get("errcode"));
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ticket;
	}
	/*
	 * 此方法为初始化微信API。
	 * 需要参数为调用微信前端JS接口的网址URL，填写全域名。
	 * 包括get参数。
	 * 返回值为前端微信接口签名所需的几个参数。
	 * 测试时随便传入URL即可。
	 */
	public Map<String, Object> initialAPI(String url){
		Date date = new Date();
		String timeStamp = date.getTime()/1000+"";
		String nonceStr = generateNoceStr();
		TreeMap<String, String> map = new TreeMap<>();
		map.put("timestamp", timeStamp);
		map.put("noncestr", nonceStr);
		map.put("jsapi_ticket", getTicket());
		map.put("url", url);
		String signature = Signature.signSHA(map);
		Map<String, Object> result = new HashMap<>();
		result.put("timeStamp", timeStamp);
		result.put("appId", BasicAccountParam.getAppId());
		result.put("nonceStr", nonceStr);
		result.put("signature", signature);
		return result;
	}
	private String generateNoceStr() {
		String result = "";
		Random random = new Random(new Date().getTime());
		for (int i = 0; i < 16; i++) {
			result += generateCharacter(random);
		}
		return result;
	}

	private char generateCharacter(Random random) {
		int c = (random.nextInt(73) + 48);
		if ((c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122)) {
			return (char) (c);
		} else {
			return generateCharacter(random);
		}
	}
}
