package dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Api {

	public static String getApiJson() throws Exception {

		StringBuilder urlBuilder = new StringBuilder("http://www.khoa.go.kr/api/oceangrid/tidalBuTemp/search.do");
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=4Eb44x4bJXQJK6zHjaV2w==");
		urlBuilder.append(
				"&" + URLEncoder.encode("ObsCode", "UTF-8") + "=" + URLEncoder.encode("TW_0062", "UTF-8")); /* 페이지번호 */

		urlBuilder.append("&" + URLEncoder.encode("Date", "UTF-8") + "="
				+ URLEncoder.encode("20230515", "UTF-8")); /* 한 페이지 결과 수 */

		urlBuilder.append("&" + URLEncoder.encode("ResultType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		// System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		return sb.toString();
	}

	public static String getWater_temp() throws Exception {
		String test = Api.getApiJson();

		JSONParser parser = new JSONParser();
		JSONObject result = (JSONObject) ((JSONObject) parser.parse(test)).get("result");
		JSONArray dataList = (JSONArray) result.get("data");

		JSONObject object = (JSONObject) dataList.get(dataList.size() - 1);

		String water_temp = (String) object.get("water_temp");
		return water_temp;
		
	}
}


