package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.HSHMemberService;
import member.model.vo.Member;

@WebServlet("/hshLogin.me")
public class HshLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HshLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("hshUserId");
		String userPw = request.getParameter("hshUserPw");
		Member member = new Member(userId, userPw);
		Member loginMem = new HSHMemberService().loginMember(member);
		
		if ( loginMem != null ) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(3600);
			session.setAttribute("loginUser", loginMem);
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("msg", "로그인 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/HSHErrorPage.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
