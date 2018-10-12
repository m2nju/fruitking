package kr.ac.hongik.fruitking.user.service;

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
