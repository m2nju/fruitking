package kr.ac.hongik.fruitking.user.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hongik.fruitking.notify.service.NotifyService;
import kr.ac.hongik.fruitking.user.dao.UserDao;
import kr.ac.hongik.fruitking.user.dto.User;
import kr.ac.hongik.fruitking.user.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;
	
	@Override
	@Transactional
	public List<User> getUsers() {
		List<User> list = userDao.selectAll();
		return list;
	}
	
	@Override
	@Transactional(readOnly=false)
	public int deleteUser(Long userId) {
		int deleteCount = userDao.deleteById(userId);
		return deleteCount;
	}

	@Override
	@Transactional(readOnly=false)
	public User registUser(User user) {
		long userId = userDao.insert(user);
		user.setUserId((int)userId);
//		if(1 == 1)
//			throw new RuntimeException("test exception");
//			
		return user;
	}

	@Override
	public int getCount() {
		return userDao.selectCount();
	}
	
}
