package kr.ac.hongik.fruitking.notify.service.impl;

import static kr.ac.hongik.fruitking.notify.dao.NotifyDaoSqls.SELECT_NOTIFY;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hongik.fruitking.notify.dao.LogDao;
import kr.ac.hongik.fruitking.notify.dao.NotifyDao;
import kr.ac.hongik.fruitking.notify.dto.Log;
import kr.ac.hongik.fruitking.notify.dto.Notify;
import kr.ac.hongik.fruitking.notify.service.NotifyService;

@Service
public class NotifyServiceImpl implements NotifyService{
	@Autowired
	NotifyDao notifyDao;
	
	@Autowired
	LogDao logDao;

	@Override
	@Transactional
	public List<Notify> getNotifies(Integer start) {
		List<Notify> list = notifyDao.selectAll(start, NotifyService.LIMIT);
		return list;
	}
	
	@Override
	@Transactional
	public Notify getNotify(Long id) {
		Notify notify = notifyDao.selectNotify(id);
		return notify;
	}

	@Override
	@Transactional(readOnly=false)
	public int deleteNotify(Long id, String ip) {
		int deleteCount = notifyDao.deleteById(id);
		Log log = new Log();
		log.setIp(ip);
		log.setMethod("delete");
		log.setRegdate(new Date());
		logDao.insert(log);
		return deleteCount;
	}

	@Override
	@Transactional(readOnly=false)
	public Notify addNotify(Notify notify, String ip) {
		notify.setRegdate(new Date());
		Long id = notifyDao.insert(notify);
		notify.setId(id);
		
//		if(1 == 1)
//			throw new RuntimeException("test exception");
//			
		Log log = new Log();
		log.setIp(ip);
		log.setMethod("insert");
		log.setRegdate(new Date());
		logDao.insert(log);
		 
		return notify;
	}

	@Override
	public int getCount() {
		return notifyDao.selectCount();
	}
}