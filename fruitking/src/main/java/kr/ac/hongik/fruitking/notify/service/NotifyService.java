package kr.ac.hongik.fruitking.notify.service;
// Service Class는 Controller에서 중복되는 부분을 계속 DAO를 통해 직접 호출하지 않고, 해당 기능을 interface만으로도 사용할 수 있게 제공함으로서 코드의 직관성과 가독성을 높임.
import java.util.List;

import kr.ac.hongik.fruitking.notify.dto.Notify;

public interface NotifyService {
	public static final Integer LIMIT = 5;
	public List<Notify> getNotifies(Integer start);
	public Notify getNextNotify(Long id);
	public Notify getPriorNotify(Long id);
	public Notify getNotify(Long id);
	public int deleteNotify(Long id, String ip);
	public Notify addNotify(Notify notify, String ip);
	public int updateNotify(Notify notify, String ip);
	public int getCount();
}