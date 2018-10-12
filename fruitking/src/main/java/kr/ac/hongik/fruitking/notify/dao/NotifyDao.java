package kr.ac.hongik.fruitking.notify.dao;

import static kr.ac.hongik.fruitking.notify.dao.NotifyDaoSqls.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import kr.ac.hongik.fruitking.notify.dto.Notify;

@Repository
public class NotifyDao {
	private NamedParameterJdbcTemplate jdbc;
	private SimpleJdbcInsert insertAction;
	private RowMapper<Notify> rowMapper = BeanPropertyRowMapper.newInstance(Notify.class);

	public NotifyDao(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		this.insertAction = new SimpleJdbcInsert(dataSource).withTableName("notify").usingGeneratedKeyColumns("id");
	}

	public List<Notify> selectAll(Integer start, Integer limit) {
		Map<String, Integer> params = new HashMap<>();
		params.put("start", start);
		params.put("limit", limit);
		return jdbc.query(SELECT_PAGING, params, rowMapper);
	}

	public class NotifyRowMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {

			Notify notify = new Notify();
			notify.setId(rs.getLong("id"));
			notify.setWriter(rs.getString("writer"));
			notify.setTitle(rs.getString("title"));
			notify.setContent(rs.getString("content"));
			notify.setRegdate(rs.getDate("regdate"));
			return notify;
		}
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