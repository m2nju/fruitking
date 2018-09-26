package kr.ac.hongik.fruitking.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan(basePackages = { "kr.ac.hongik.fruitking.notify.dao","kr.ac.hongik.fruitking.notify.service","kr.ac.hongik.fruitking.user.dao","kr.ac.hongik.fruitking.user.service" })
@Import({DBConfig.class})

public class ApplicationConfig {

}
