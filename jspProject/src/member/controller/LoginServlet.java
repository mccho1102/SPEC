package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

// @WebServlet() 어노테이션
// web.xml에 별도의 url mapping 작업을 하지 않고
// 해당 클래스를 Servlet으로 등록하고
// 매개변수로 작성된 url pattern과 mapping 시켜줌

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) POST 방식으로 전송된 데이터의 문자 인코딩 처리
		//  --> 한글이 포함 된 경우에 문자가 깨지므로 처리하는 것
		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청 시 넘겨져온 데이터를 저장하기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 3) vo.Member / DB - Member 테이블 생성
		
		// 4) id, pwd를 이용하여 Member 객체 생성
		Member member = new Member(userId, userPwd);
		
		Member loginUser = new MemberService().loginMember(member);
		
		// 조회 결과에 따라 view 연결처리
		if ( loginUser != null ) { // 로그인 성공
			// Session을 이용하여 로그인 처리
			
			// Session : JSP 내장 객체
			// 웹 브라우저에서 정보를 유지하기 위한 목적으로 주로 사용
			// 일정 시간동안 정보를 유지시키고 만료시키는 것이 가능
			// Session의 정보는 server에 저장되어 사용됨
			
			// 해당 클라이언트에 대한 Session 객체 생성
			HttpSession session = request.getSession();
			
			// Session 만료 시간 설정
			session.setMaxInactiveInterval(3600); // 3600 초 뒤 Session 만료
			
			session.setAttribute("loginUser", loginUser);
			
			// ** 아이디 저장 처리(Cookie)
			
			// 아이디 저장 체크박스 값 가져오기
			String saveId = request.getParameter("saveId");
			
			// 쿠키 객체 생성
			Cookie ck = new Cookie("saveId",userId);
			if ( saveId != null ) { // 아이디 저장이 체크된 경우
				// 쿠키를 7일간 유지될 수 있도록 유효기간 설정
				ck.setMaxAge(60*60*24*7);
			} else {
				ck.setMaxAge(0);
			}
			
			// 쿠키가 사용 될 수 있는 유효 디렉토리(경로) 설정
			ck.setPath("/"); // root --> 해당 도메인 전역 사용 가능
			
			// response 객체에 쿠키를 담아서 브라우저 전송
			// -> 이후 부터 브라우저가 쿠키를 관리
			response.addCookie(ck);
			// ***** 쿠키 생성 끝 ***** //
			
			// 세션에 정보 입력 시 브라우저가 꺼질 때 까지 유지됨
			// 별도로 request에 담아 넘겨줄 필요 없음
			//   --> forward() 필요 없음
			
			response.sendRedirect("index.jsp");
			// 응답 페이지로 이동 후 request / response 객체를 새로 생성함
			//  --> 기존 정보 유지 X
		} else { // 로그인 실패
			request.setAttribute("msg", "로그인 실패");
			// 실패 내용을 별도의 페이지에 출력하기
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
