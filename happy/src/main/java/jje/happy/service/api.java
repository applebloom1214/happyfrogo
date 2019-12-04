package jje.happy.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import jje.happy.vo.Finedust;

public class api {


  public Finedust getFinddust() {
	  
	  Finedust fd = new Finedust();
	  
	  BufferedReader br = null;
      try{            
          String urlstr = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?stationName=오정동&dataTerm=month&pageNo=1&numOfRows=10&ServiceKey=HAHWbQC9svofCnpJsgZiBSeg4sU3LFoq5zELqy%2B2XkQUSKDU673yZd98nu99GDisXXSzXiY7cHcXjhu9IYRf2Q%3D%3D&ver=1.3";
          URL url = new URL(urlstr);
          HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
          urlconnection.setRequestMethod("GET");
          br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
          String result = "";
          String status = "";
          String line;
          while((line = br.readLine()) != null) {
        	  if(line.contains("pm10Value")) {
        		  result = line;
        		  int start = result.indexOf(">");
        		result = result.substring(start+1,start+3);
                  break;  
        	  }     
          }// 미세먼지 값 추출
        int value = Integer.parseInt(result);
        if(value <= 30) {
        	status += "좋음";
        }
        else if(value <=80) {
        	status += "보통";
        }
        else {
        	status += "나쁨";
        }
        fd.setStatus(status);
        fd.setValue(value);
      }catch(Exception e){
          System.out.println(e.getMessage());
      }

     
	  
	  return fd;
  }
  
}
