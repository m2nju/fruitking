package kr.ac.hongik.fruitking.notify.service.impl;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import kr.ac.hongik.fruitking.config.ApplicationConfig;
import kr.ac.hongik.fruitking.notify.dto.Notify;
import kr.ac.hongik.fruitking.notify.service.NotifyService;

public class NotifyServiceTest {

	public static void main(String[] args) {
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class); 
		NotifyService notifyService = ac.getBean(NotifyService.class);
		
		Notify notify = new Notify();
		notify.setWriter("kang kyungmi22323242");
		notify.setTitle("제목입니다.");
		notify.setContent("반갑습니다. 여러분. 여러분이 재미있게 공부하고 계셨음 정말 좋겠네요^^2223233");
		notify.setRegdate(new Date());
		Notify result = notifyService.addNotify(notify, "127.0.0.1");
		System.out.println(result);
		
		
		((ConfigurableApplicationContext)ac).close();
	}

}