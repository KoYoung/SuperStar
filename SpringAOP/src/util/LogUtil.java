package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LogUtil {
	public void log(String type,int num){
		System.out.println("日志："+currentTime()+type+"手机"+num+"部");
	}
	public String currentTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = sdf.format(new Date());
		return time;
	}
}
