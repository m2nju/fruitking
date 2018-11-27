package kr.ac.hongik.fruitking.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hongik.fruitking.user.dao.UserDao;
import kr.ac.hongik.fruitking.user.dto.User;
import kr.ac.hongik.fruitking.user.service.UserService;

@Service	// 해당 class가 Service임을 명시하는 annotation
public class UserServiceImpl implements UserService{	// 해당 class는 UserService를 Implemente한다.
	@Autowired	// 등록된 Bean 중에, 적절한 Class가 있으면 자동으로 초기화하여 Singleton으로 생성해주는 Annotaion
	UserDao userDao;	// UserDao의 메소드들을 사용하기 위해 UserDao를 선언한다.
	
	@Override
	@Transactional	// 모든 메소드는 Transactional하게 처리한다.
	public List<User> getUsers() {	// getUsers()는 DB에 존재하는 모든 user의 정보를 받아와 list로 반환하는 메소드이다.
		List<User> list = userDao.selectAll();
		return list;
	}
	
	@Override
	@Transactional(readOnly=false)
	public int deleteUser(Long userId) {	// deleteUser()는 해당 userId의 User를 DB에서 삭제하고 그 user의 id를 반환하는 메소드이다.
		int deleteCount = userDao.deleteById(userId);
		return deleteCount;
	}
	
	@Override
	@Transactional(readOnly=false)
	public User getUser(Long userId) {	// getUser()는 해당 userId의 user의 정보를 받아와 User의 객체로 반환하는 메소드이다.
		//System.out.println("UserService의 getUser() 호출");
		User user = userDao.selectUserById(userId);
		return user;
	}
	
	@Override
	@Transactional(readOnly=false)
	public User registUser(User user) {	// registUser()는 User 객체를 DB에 등록해주고 해당 객체를 반환하는 메소드이다.
		long userId = userDao.insert(user);
		user.setUserId((int)userId);
		
		return user;
	}

	@Override
	public int getCount() {		// getCount()는 DB에 저장되어있는 user 데이터의 수를 반환하는 메소드이다.
		return userDao.selectCount();
	}
	
	@Override
	@Transactional(readOnly=false)
	public int isUser(User user) {	// isUser는 해당 유저의 userId를 반환하는 메소드이며, 회원이 아닐 시에 0을 반환한다.
		int userId = 0;
		try {
		userId = userDao.selectIdByEmail(user.getUserEmail());
		//System.out.println("유저 아이디는 "+userId);
		}catch(Exception e) {
			System.out.println(e);
		}
		return userId;
	}
}
