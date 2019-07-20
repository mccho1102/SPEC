package member.model.dao;

import static common.JDBCTemplate.*;

import java.io.*;
import java.sql.*;
import java.util.*;
import member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() { 
		String filename = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch ( Exception e ) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, Member member) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if ( rset.next() ) {
				loginUser = new Member(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getString(7), rset.getString(8), rset.getDate(9), rset.getDate(10), rset.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}
	
	
}
