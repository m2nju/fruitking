package kr.ac.hongik.fruitking.notify.dao;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import kr.ac.hongik.fruitking.config.ApplicationConfig;
import kr.ac.hongik.fruitking.notify.dto.Log;
import kr.ac.hongik.fruitking.notify.dto.Notify;

public class NotifyDaoTest {

	public static void main(String[] args) {
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class); 
		NotifyDao notifyDao = ac.getBean(NotifyDao.class);
		
		Notify notify = new Notify();
		notify.setWriter("이민주 2");
		notify.setTitle("제목 테스트 2입니다.");
		notify.setContent("반갑습니다. 여러분.");
		notify.setRegdate(new Date());
		Long id = notifyDao.insert(notify);
		System.out.println("id : " + id);
		
		LogDao logDao = ac.getBean(LogDao.class);
		Log log = new Log();
		log.setIp("127.0.0.1");
		log.setMethod("insert");
		log.setRegdate(new Date());
		logDao.insert(log);
	}

}