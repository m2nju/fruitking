package kr.ac.hongik.fruitking.config;
// DB 연결에 관한 configuration을 담고 있는 Class
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

@Configuration
@EnableTransactionManagement
public class DBConfig implements TransactionManagementConfigurer {
	private String driverClassName = "com.mysql.jdbc.Driver";	// JDBC class
	
	private String url = "jdbc:mysql://fruitking.czirbxernaor.ap-northeast-2.rds.amazonaws.com/fruitking?useUnicode=true&characterEncoding=utf8&autoReconnect=true&verifyServerCertificate=false&useSSL=false";
	private String username = "master";
	private String password = "password";	// Fruitking의 Database에 연결하기 위한 기본적인 정보들.

	@Bean
	public DataSource dataSource() {		// Datasource 라이브러리를 import하여 연결하고 Spring의 Bean으로 등록함으로써 필요에 따라 자동으로 생성되도록 한다.
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(driverClassName);
		dataSource.setUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);	
		// connection pool을 활용하여 connect 요청시에 소요되는 시간을 절약할 수 있다.	
		// 초기에 생성되는 커넥션의 개수 설정
		dataSource.setInitialSize(5);

		// 커넥션 최소 개수 설정, 사용되지 않고 풀에 저장될 수 있는 최소 커넥션 개수
		dataSource.setMinIdle(5);
		
		// 커넥션 최대 개수 설정, 사용되지 않고 풀에 저장될 수 있는 최대 커넥션 개수
		dataSource.setMaxIdle(20);
		
		// 유휴 커넥션 검사 주기, 사용되지 않은 커넥션을 추출하는 쓰레드의 실행주기를 지정한다.
		dataSource.setTimeBetweenEvictionRunsMillis(1000L * 60L * 1L);
		
		// 풀에 있는 커넥션이 유효한지 검사 유무 설정, true 일 경우 비활성화 커넥션을 추출할 때 커넥션이 유효한지의 여부를 검사해서 유효하지 않은 커넥션은 풀에서 제거
		dataSource.setTestWhileIdle(true);
		
		// true 일 경우 커넥션 풀에서 커넥션을 가져올 때 커넥션이 유효한지의 여부 검사
		dataSource.setTestOnBorrow(false);
		
		// true 일 경우 비활성화 커넥션을 추출할 때 커넥션이 유효한지의 여부를 검사해서 유효하지 않은 커넥션은 풀에서 제거
		dataSource.setTestWhileIdle(true);
		
		// 사용되지 않는 커넥션을 몇 개 검사할 지 지정
		dataSource.setNumTestsPerEvictionRun(3);
		
		// PreparedStatements를 풀링 할 것인지 결정한다.
		/*PreparedStatement란 이처럼 바인드 변수의 사용을 가능케 하기 위해 사용됩니다. 
		따라서 동일한 문장(값만 바뀐다거나 할때)이 여러 번 연속으로 실행되거나 비교적 연속적
		(라이브러리 캐쉬에 있는 실행계획이 LRU에 의해 메모리에서 삭제되기 직전에 다시 실행되기만 한다면)
		으로 실행된다면 월등한 성능향상을 얻을 수 있습니다.
		그러므로 꼭 사용하도록 설정합니다.( true로 설정해준다.)*/
		dataSource.setPoolPreparedStatements(true);
		
		return dataSource;
	}

	@Override
	public PlatformTransactionManager annotationDrivenTransactionManager() {	// 트랜잭션 처리를 위한 transaction Manager를 호출, 할당하는 메소드
		return transactionManager();
	}

	@Bean
	public PlatformTransactionManager transactionManager() {	// 트랜잭션 매니저 object를 생성, 반환하는 메소드
		return new DataSourceTransactionManager(dataSource());
	}
}