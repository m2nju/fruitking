package kr.ac.hongik.fruitking.notify.dao;

public class NotifyDaoSqls {
	public static final String SELECT_PAGING = "SELECT * FROM notify ORDER BY id DESC limit :start, :limit";
	public static final String SELECT_NOTIFY = "SELECT * FROM notify WHERE id = :id";
	public static final String SELECT_NEXT_NOTIFY = "SELECT * FROM notify WHERE id > :id ORDER BY id ASC limit 1";
	public static final String NEXT_COUNT = "SELECT count(*) FROM notify WHERE id > :id";
	public static final String SELECT_PRIOR_NOTIFY = "SELECT * FROM notify WHERE id < :id ORDER BY id DESC limit 1";
	public static final String PRIOR_COUNT = "SELECT count(*) FROM notify WHERE id < :id";
	public static final String UPDATE_BY_ID = "UPDATE notify SET title = :title, writer = :writer, content = :content WHERE id = :id";
	public static final String DELETE_BY_ID = "DELETE FROM notify WHERE id = :id";
	public static final String SELECT_COUNT = "SELECT count(*) FROM notify";
}	