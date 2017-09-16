package com.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import sun.misc.BASE64Decoder;

@Controller
@RequestMapping("/testDemo")
public class TestController {
	@RequestMapping("/demo01")
	public String demo01(@RequestBody String data) {
		System.out.println(data);
		data = data.substring(data.indexOf("=") + 1, data.length());
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] b;
		try {
			b = decoder.decodeBuffer(data);
			ByteArrayInputStream bais = new ByteArrayInputStream(b);
			System.out.println(bais.toString());
			BufferedImage bi1 = ImageIO.read(bais);
			System.out.println(bi1);
			String name = UUID.randomUUID().toString();
			File w2 = new File("e://" + name + ".png");

			ImageIO.write(bi1, "png", w2);
		} catch (IOException e) {
			e.printStackTrace();
		} // 转码得到图片数据
		return "success";
	}
}
