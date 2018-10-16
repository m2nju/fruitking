package kr.ac.hongik.fruitking.notify.dao;
// DAO는 Data Access Object로서, Database에 추상 인터페이스를 제공하는 객체이다. 
import javax.sql.DataSource;

import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import kr.ac.hongik.fruitking.notify.dto.Log;

@Repository
public class LogDao {
	private NamedParameterJdbcTemplate jdbc;
    private SimpleJdbcInsert insertAction;

    public LogDao(DataSource dataSource) {	// 생성자에는 Datasource Class의 object를 넘겨줌.(Datasource 객체는 생성시 DBConfig의 설정대로 생성된다.)
        this.jdbc = new NamedParameterJdbcTemplate(dataSource);	// 기본적인 query는 모두 이 객체로 수행한다. (Insert 제외)
        this.insertAction = new SimpleJdbcInsert(dataSource)	
                .withTableName("log")		// DB의 log라는 table을 이용할 것이고,
                .usingGeneratedKeyColumns("id");	// id라는 컬럼명으로 키를 생성한다.
        // insert query는 NamedParameterJdbcTemplate Class로 가능하지 않기 때문에, SimpleJdbcInsert Class를 따로 만들어 수행할 수 있도록 한다.
    }	

	public Long insert(Log log) {	
		SqlParameterSource params = new BeanPropertySqlParameterSource(log);
		return insertAction.executeAndReturnKey(params).longValue();
	}
	
	public Long update(Log log) {	// Log는 Notify의 입력, 수정, 삭제 등의 기록을 남기기 위한 것이므로 update가 아니라 insert로 수행.
		SqlParameterSource params = new BeanPropertySqlParameterSource(log);
		return insertAction.executeAndReturnKey(params).longValue();
	}
}