package kr.ac.hongik.fruitking.config;
// spring 관련 configuration 파일로, fruitking에서 사용하고 있는 component package들의 경로를 명시함.
// DB관련 configuration class를 Import하여 사용할 수 있도록 함.
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan(basePackages = { 
		"kr.ac.hongik.fruitking.notify.dao",
		"kr.ac.hongik.fruitking.notify.service",
		"kr.ac.hongik.fruitking.user.dao",
		"kr.ac.hongik.fruitking.user.service" })
@Import({DBConfig.class})
public class ApplicationConfig {

}
