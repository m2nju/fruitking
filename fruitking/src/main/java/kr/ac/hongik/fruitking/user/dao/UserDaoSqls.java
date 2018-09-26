package kr.ac.hongik.fruitking.user.dao;

public class UserDaoSqls {
	public static final String SELECT_ALL = "SELECT * FROM user ORDER BY user_id";
	public static final String DELETE_BY_ID = "DELETE FROM user WHERE user_id = :user_id";
	public static final String SELECT_COUNT = "SELECT count(*) FROM user";
}
