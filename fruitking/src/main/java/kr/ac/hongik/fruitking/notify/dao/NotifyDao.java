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

@Repository
public class NotifyDao {
	 private NamedParameterJdbcTemplate jdbc;
	    private SimpleJdbcInsert insertAction;
	    private RowMapper<Notify> rowMapper = BeanPropertyRowMapper.newInstance(Notify.class);

	    public NotifyDao(DataSource dataSource) {
	        this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	        this.insertAction = new SimpleJdbcInsert(dataSource)
	                .withTableName("notify")
	                .usingGeneratedKeyColumns("id");
	    }
	    
	    public List<Notify> selectAll(Integer start, Integer limit) {
	    		Map<String, Integer> params = new HashMap<>();
	    		params.put("start", start);
	    		params.put("limit", limit);
	        return jdbc.query(SELECT_PAGING, params, rowMapper);
	    }
	    
	    public Notify select(Long id) {
	    	Map<String, ?> params = Collections.singletonMap("id", id);
	    	return jdbc.queryForObject(SELECT_NOTIFY, params, Notify.class);
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