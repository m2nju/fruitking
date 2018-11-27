package kr.ac.hongik.fruitking.notify.dao;

import static kr.ac.hongik.fruitking.notify.dao.NotifyDaoSqls.*;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import kr.ac.hongik.fruitking.notify.dto.Notify;
//DAO는 Data Access Object로서, Database에 접근하기 위한 추상 인터페이스를 제공하는 객체이다. 
@Repository
public class NotifyDao {
	private NamedParameterJdbcTemplate jdbc;
	private SimpleJdbcInsert insertAction;
	private RowMapper<Notify> rowMapper = BeanPropertyRowMapper.newInstance(Notify.class);
	// DTO인 Notify class의 프로퍼티들을 DB의 컬럼들과 match시켜 자동적으로 값을 넣어주는 RowMapper 객체 생성, 파라미터로는 Notify DTO class를 넣어준다.

	public NotifyDao(DataSource dataSource) {	// 생성자에는 Datasource Class의 object를 넘겨줌.(Datasource 객체는 생성시 DBConfig의 설정대로 생성된다.)
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);	// 기본적인 query는 모두 이 객체로 수행한다. (Insert, Update 제외)
		this.insertAction = new SimpleJdbcInsert(dataSource).withTableName("notify").usingGeneratedKeyColumns("id");
		// insert query는 NamedParameterJdbcTemplate Class로 가능하지 않기 때문에, SimpleJdbcInsert Class를 따로 만들어 수행할 수 있도록 한다.
	}

	public List<Notify> selectAll(Integer start, Integer limit) {
		Map<String, Integer> params = new HashMap<>();
		params.put("start", start);
		params.put("limit", limit);
		return jdbc.query(SELECT_PAGING, params, rowMapper);
	}
	
	public Notify selectNextNotify(Long id) {
		int count = jdbc.queryForObject(NEXT_COUNT, Collections.singletonMap("id", id), Integer.class);
		if(count > 0) {
			return jdbc.queryForObject(SELECT_NEXT_NOTIFY, Collections.singletonMap("id", id), rowMapper);
		} else {
			return jdbc.queryForObject(SELECT_NOTIFY, Collections.singletonMap("id", id), rowMapper);
		}
	}
	
	public Notify selectPriorNotify(Long id) {
		int count = jdbc.queryForObject(PRIOR_COUNT, Collections.singletonMap("id", id), Integer.class);
		if(count > 0) {
			return jdbc.queryForObject(SELECT_PRIOR_NOTIFY, Collections.singletonMap("id", id), rowMapper);
		} else {
			return jdbc.queryForObject(SELECT_NOTIFY, Collections.singletonMap("id", id), rowMapper);
		}
	}
	
	public Notify selectNotify(Long id) {
		Notify notify = jdbc.queryForObject(SELECT_NOTIFY, Collections.singletonMap("id", id), rowMapper);
		return notify;
	}
	
	public int update(Notify notify) {
		Map<String, String> params = new HashMap<>();
		params.put("id", String.valueOf(notify.getId()));
		params.put("writer", notify.getWriter());
		params.put("title", notify.getTitle());
		params.put("content", notify.getContent());
		return jdbc.update(UPDATE_BY_ID, params);
	}
	
	public Long insert(Notify notify) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(notify);
		return insertAction.executeAndReturnKey(params).longValue();
	}

	public int deleteById(Long id) {
		Map<String, ?> params = Collections.singletonMap("id", id);
		return jdbc.update(DELETE_BY_ID, params);
	}

	public int selectCount() {
		return jdbc.queryForObject(SELECT_COUNT, Collections.emptyMap(), Integer.class);
	}
}