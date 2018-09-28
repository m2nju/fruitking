package kr.ac.hongik.fruitking.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hongik.fruitking.notify.dto.Notify;
import kr.ac.hongik.fruitking.notify.service.NotifyService;
import kr.ac.hongik.fruitking.user.dto.User;
import kr.ac.hongik.fruitking.user.service.UserService;

@Controller
public class MainController {
	@Autowired
	NotifyService notifyService;
	
	@Autowired
	UserService userService;

	@GetMapping(path = "/notify") // 프로젝트명 fruitking 뒤에 들어오는 경로 ex: http://localhost:8080/fruitking/notify 배포시
									// ROOT로 만들면 http://fruitking.cf/notify
	public String list(@RequestParam(name = "start", required = false, defaultValue = "0") int start, ModelMap model) {
		// start로 시작하는 방명록 목록 구하기
		List<Notify> list = notifyService.getNotifies(start);

		// 전체 페이지수 구하기
		int count = notifyService.getCount();
		int pageCount = count / NotifyService.LIMIT;
		if (count % NotifyService.LIMIT > 0)
			pageCount++;

		// 페이지 수만큼 start의 값을 리스트로 저장
		// 예를 들면 페이지수가 3이면
		// 0, 5, 10 이렇게 저장된다.
		// list?start=0 , list?start=5, list?start=10 으로 링크가 걸린다.
		List<Integer> pageStartList = new ArrayList<>();
		for (int i = 0; i < pageCount; i++) {
			pageStartList.add(i * NotifyService.LIMIT);
		}

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pageStartList", pageStartList);

		return "tab/notify"; // views 디렉토리 밑의 jsp 파일의 파일명, 여기선 main/webapp/WEB-INF/views/tab/notify.jsp가 열린다.
	}
	
	@RequestMapping(value = "/writeNotify")
	public String view(HttpServletRequest request) {
		return "tab/notify/writeNotify";
	}

	@PostMapping(path = "/write")
	public String write(@ModelAttribute Notify notify, HttpServletRequest request) {
		String clientIp = request.getRemoteAddr();
		System.out.println("clientIp : " + clientIp);
		notifyService.addNotify(notify, clientIp);
		return "redirect:/notify"; // 해당 path로 리다이렉트 한다.
	}
	
	@RequestMapping(path = "/registUser")
	public String write(@ModelAttribute User user, HttpServletRequest request) {
		String clientIp = request.getRemoteAddr();
		System.out.println("clientIp : " + clientIp);
		userService.registUser(user);
		
		return "redirect:/"; // 해당 path로 리다이렉트 한다.
	}

//	@GetMapping(path = "/happy") // 일반적인 GET메소드 리다이렉션
//	public String happy() {
//		return "happy"; // views 디렉토리 밑의 jsp 파일의 파일명, 여기선 main/webapp/WEB-INF/views/happy.jsp가 열린다. (지워도 똑같음 default가 ~~/views/*.jsp 이기 때문임)
//	}	
	
	@RequestMapping(value = "/news")
	public String news(HttpSession session) {
		return "tab/news";
	}
	
	@RequestMapping(value = "/naverLogin")
	public String naverLogin(HttpSession session) {
		return "naver/naverlogin";
	}

	@RequestMapping(value = "/callBack")
	public String callBack(HttpServletRequest request) throws Exception {
		return "naver/callback";
	}
	
	@RequestMapping(value = "/userinfo")
	public String userInformation(HttpServletRequest request) throws Exception {
		return "naver/userinfo";
	}

	@RequestMapping(value = "/qna")
	public String qeustionAndAnswer() {
		return "tab/qna";
	}
	
	@RequestMapping(value = "/info")
	public String information() {
		return "tab/info";
	}

	
}
