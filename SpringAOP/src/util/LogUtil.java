package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LogUtil {
	public void log(String type,int num){
		System.out.println("��־��"+currentTime()+type+"�ֻ�"+num+"��");
	}
	public String currentTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = sdf.format(new Date());
		return time;
	}
}
