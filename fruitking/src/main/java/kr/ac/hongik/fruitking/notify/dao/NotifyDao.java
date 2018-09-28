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

	public Notify selectNotify(Long id) {
		Map<String, ?> params = Collections.singletonMap("id", id);
		System.out.println(id + "select Notify");

		Notify notify = new Notify();
		notify.setId(((Integer) 27).longValue());
		notify.setWriter("민주");
		notify.setTitle("제목");
		notify.setContent("내용");
		notify.setRegdate(new Date());
		// 이렇게 직접 넣어서 하면 되는데 jdbc로 읽어오는 거만 하면 될 거 같음

		/*
		 * Notify notify = jdbc.queryForObject(SELECT_NOTIFY, new Object[] { 1212L },
		 * new RowMapper<Notify>() { public Notify mapRow(ResultSet rs, int rowNum)
		 * throws SQLException { Notify notify = new Notify();
		 * notify.setId(rs.getLong("id")); notify.setWriter(rs.getString("writer"));
		 * notify.setTitle(rs.getString("title"));
		 * notify.setContent(rs.getString("content"));
		 * notify.setRegdate(rs.getDate("regdate")); return notify; } }
		 */

		return notify;
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