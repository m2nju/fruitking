package kr.ac.hongik.fruitking.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogInterceptor extends HandlerInterceptorAdapter{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println(handler.toString() + " 가 종료되었습니다.  " + modelAndView.getViewName() + "을 view로 사용합니다.");
	}	// 이벤트를 처리한 후, 매핑된 Handler의 정보와, 호출되는 view의 정보를 console에 출력하는 메소드

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		System.out.println(handler.toString() + " 를 호출했습니다.");
		return true;
	}	// 이벤트를 처리하기 전, 매핑된 handler의 정보를 console에 출력하는 메소드
}