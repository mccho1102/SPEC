package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.HSHMemberDao;
import member.model.vo.Member;

public class HSHMemberService {
	 public HSHMemberService() { }

	public Member loginMember(Member member) {
		Connection conn = getConnection();
		Member loginMem = new HSHMemberDao().loginMember(conn, member);
		return loginMem;
	}
	 
	 
}
