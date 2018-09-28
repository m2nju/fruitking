package kr.ac.hongik.fruitking.notify.service;

import java.util.List;

import kr.ac.hongik.fruitking.notify.dto.Notify;

public interface NotifyService {
	public static final Integer LIMIT = 5;
	public List<Notify> getNotifies(Integer start);
	public Notify getNotify(Long id);
	public int deleteNotify(Long id, String ip);
	public Notify addNotify(Notify notify, String ip);
	public int getCount();
}