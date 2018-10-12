package kr.ac.hongik.fruitking.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

		return "tab/notify/notify"; // views 디렉토리 밑의 jsp 파일의 파일명, 여기선 main/webapp/WEB-INF/views/tab/notify.jsp가 열린다.
	}

	@GetMapping(path = "/notify/updateNotify") // 공지사항 수정하기
	public String updateNotify(@RequestParam(name = "id", required = false, defaultValue = "0") Long id,
			ModelMap model) {
		Notify notify = notifyService.getNotify(id);

		model.addAttribute("notify", notify);
		model.addAttribute("id", id);

		return "tab/notify/updateNotify";
	}

	@PostMapping(path = "/notify/update") // 공지사항 수정
	public String update(@ModelAttribute Notify notify, HttpServletRequest request,
			@RequestParam(name = "id", required = false, defaultValue = "0") Long id, ModelMap model) {
		String clientIp = request.getRemoteAddr();
		notifyService.updateNotify(notify, clientIp);
		model.addAttribute(id);
		return "tab/notify/viewNotify"; // 해당 path로 리다이렉트 한다.
	}

	@GetMapping(path = "/notify/deleteNotify") // 공지사항상세보기
	public String deleteNotify(@ModelAttribute Notify notify, HttpServletRequest request,
			@RequestParam(name = "id", required = false, defaultValue = "0") Long id, ModelMap model) {
		String clientIp = request.getRemoteAddr();
		notifyService.deleteNotify(id, clientIp);

		return "redirect:/notify";
	}

	@GetMapping(path = "/notify/viewNotify") // 공지사항상세보기
	public String viewNotify(@RequestParam(name = "id", required = false, defaultValue = "0") Long id, ModelMap model) {
		Notify notify = notifyService.getNotify(id);

		model.addAttribute("notify", notify);
		model.addAttribute("id", id);
		
		Notify nextNotify = notifyService.getNextNotify(id);
		model.addAttribute("nextNotify", nextNotify);
		
		Notify priorNotify = notifyService.getPriorNotify(id);
		model.addAttribute("priorNotify", priorNotify);

		return "tab/notify/viewNotify";
	}

	@RequestMapping(value = "/writeNotify") // 공지사항 작성하기
	public String write(HttpServletRequest request) {
		return "tab/notify/writeNotify";
	}

	@PostMapping(path = "/write") // 공지사항 추가
	public String write(@ModelAttribute Notify notify, HttpServletRequest request) {
		String clientIp = request.getRemoteAddr();
		notifyService.addNotify(notify, clientIp);
		return "redirect:/notify"; // 해당 path로 리다이렉트 한다.
	}

	@RequestMapping(path = "/registUser")
	public String write(@ModelAttribute User user, HttpServletRequest request) {
		String clientIp = request.getRemoteAddr();
		//System.out.println("clientIp : " + clientIp);
		userService.registUser(user);

		return "redirect:/"; // 해당 path로 리다이렉트 한다.
	}

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
		// System.out.println("Controller에서 callBack 호출");
		return "naver/callback";
	}

	@RequestMapping(value = "/userInfo")
	public String userInformation(HttpServletRequest request) throws Exception {
		return "naver/userinfo";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		session.removeAttribute("access_token");
		session.removeAttribute("refresh_token");
		session.removeAttribute("userEmail");
		session.removeAttribute("userName");
		session.removeAttribute("userAge");
		session.removeAttribute("userBirth");
		session.removeAttribute("userIsMan");
		session.removeAttribute("userGrade");

		return "naver/logout";
	}

	@RequestMapping(value = "/weather")
	public String weather(HttpSession session) {
		return "tab/weather";
	}

	@RequestMapping(value = "/price")
	public String price(HttpSession session) {
		return "tab/price";
	}

	@RequestMapping(value = "/qna")
	public String qeustionAndAnswer() {
		return "tab/qna";
	}

	@RequestMapping(value = "/info")
	public String information() {
		return "tab/info";
	}

	@RequestMapping(value = "/predict")
	public String predict() {
		return "tab/predict/inputDateForm";
	}

	@PostMapping(path = "/getPrice")
	public String getPrice(@RequestParam(name = "date", required = false, defaultValue = "0") String date,
			ModelMap model) {
		//System.out.println(date + "의 가격 예측 모델 API 호출");
		model.addAttribute("date", date); // 현재 response에 date라는 이름으로 date 값을 저장하는 spring에서 제공하는 메서드임.
		int price = 0; // API를 통해 얻어온 가격의 값을 여기에 담을 수 있도록.
		String result_str = "";
		URL url = null;
		URLConnection urlConnection = null;
		// URL 주소
		String sUrl = "http://fruitking.tk:5000/price"; // api url 경로
		// 파라미터 이름
		String paramName = "date";
		// 파라미터 이름에 대한 값
		String paramValue = date;
		try {
			// Get방식으로 전송 하기
			url = new URL(sUrl + "?" + paramName + "=" + paramValue);
			urlConnection = url.openConnection();

			if (urlConnection != null) { // api에 정상적으로 연결이 되었는지 확인
				System.out.println("연결 성공!");
			} else {
				System.out.println("연결 실패..");
			}

			int i; // StringBuffer를 통해 InputStream을 String의 형태로 변환
			InputStream is = urlConnection.getInputStream();
			StringBuffer buffer = new StringBuffer();
			byte[] b = new byte[4096];
			while ((i = is.read(b)) != -1) {
				buffer.append(new String(b, 0, i));
			}
			result_str = buffer.toString();

		} catch (Exception e) {
			e.printStackTrace();
		}
		price = Integer.parseInt(result_str); // 결과로 전달받은 String 형태의 가격 정보를 Integer 형태로 변환
		model.addAttribute("price", price); // Response에 가격을 저장 ( view에서 사용할 수 있도록 )

		return "tab/predict/getPrice";
	}

	@RequestMapping(value = "/chart")
	public String chart() {
		return "chart/chart";
	}

	@RequestMapping(value = "/chatting")
	public String chatting(HttpSession session) throws Exception {
		return "tab/chatting";
	}
	
	@RequestMapping(value = "bananaChart")
	public String chartbanana(HttpSession session) throws Exception {
		return "tab/chart/banana";
	}
}