package kr.ac.hongik.fruitking.config;
// Dispatcher Servlet이 참조하는 Context의 정보를 담고 있는 Class. 
// Spring MVC 구조에서, Dispatcher Servlet은 Handler mapping을 통해 요청을 처리할 Controller를 선택하고, Handler Adapter로부터 전달  받은 View의 이름을 View Resolver에게 넘겨준다.
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import kr.ac.hongik.fruitking.interceptor.LogInterceptor;


@Configuration
@EnableWebMvc
@ComponentScan(basePackages= {"kr.ac.hongik.fruitking.controller"})	// Controller들을 참조할 Package의 경로.
public class WebMvcContextConfiguration extends WebMvcConfigurerAdapter {
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {	// css, img, js, txt 등의 확장자들은 resource 하위의 디렉토리에서 찾도록 한다.
        registry.addResourceHandler("/css/**").addResourceLocations("/resources/css/").setCachePeriod(31556926);
        registry.addResourceHandler("/img/**").addResourceLocations("/resources/img/").setCachePeriod(31556926);
        registry.addResourceHandler("/js/**").addResourceLocations("/resources/js/").setCachePeriod(31556926);
        registry.addResourceHandler("/txt/**").addResourceLocations("/resources/txt/").setCachePeriod(31556926);
    }
	
    // 별다른 요구가 없는 경우 default servlet handler를 사용.
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
   
    @Override	// default Controller를 설정.
    public void addViewControllers(final ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("index");
    }
    
    @Bean	// 기본 경로는 src/main/webapp/WEB-INF/views 디렉토리이다.
    public InternalResourceViewResolver getInternalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    } 
    
    @Override	// 매 페이지 요청시 console에 log를 남겨 Debug를 수월하게 하기 위한 Interceptor를 등록하는 method.
	public void addInterceptors(InterceptorRegistry registry) {
    		registry.addInterceptor(new LogInterceptor());
	}
}
