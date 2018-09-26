package kr.ac.hongik.fruitking.user.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import kr.ac.hongik.fruitking.config.ApplicationConfig;
import kr.ac.hongik.fruitking.user.dto.User;
import  kr.ac.hongik.fruitking.user.dao.UserDao;

public class UserDaoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		UserDao userDao = ac.getBean(UserDao.class);

		User user = new User();
		
		user.setUserEmail("2mingju@naver.com");
		user.setUserName("이민주");
		user.setUserAge(27);
		user.setUserBirth("06-02");
		user.setUserGrade(1);
		user.setUserIsMan(true);
	
		Long userId = userDao.insert(user);
		System.out.println("user_id : " + userId);
	}

}
