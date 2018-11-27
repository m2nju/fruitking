package kr.ac.hongik.fruitking.user.service;
//Service Class는 Controller에서 중복되는 부분을 계속 DAO를 통해 직접 호출하지 않고, 해당 기능을 interface만으로도 사용할 수 있게 제공함으로서 코드의 직관성과 가독성을 높임.
import java.util.List;

import kr.ac.hongik.fruitking.user.dto.User;

public interface UserService {
	public List<User> getUsers();
	public int deleteUser(Long userId);
	public User registUser(User user);
	public int getCount();
	public int isUser(User user);
	public User getUser(Long userId);
}
