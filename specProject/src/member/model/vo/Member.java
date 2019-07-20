package member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private static final long serialVersionUID = 5124010325777687681L;
	private int userNo;
	private String userId;
	private String userPwd;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String interest;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	
	public Member() {}
	
	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}

	public Member(String userId, String name, String phone, String email, String address, String interest) {
		super();
		this.userId = userId;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.interest = interest;
	}

	public Member(String userId, String userPwd, String name, String phone, String email, String address,
			String interest) {
		this(userId, userPwd);
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.interest = interest;
	}

	public Member(int userNo, String userId, String userPwd, String name, String phone, String email, String address,
			String interest, Date enrollDate, Date modifyDate, String status) {
		this(userId, userPwd, name, phone, email, address, interest);
		this.userNo = userNo;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return userNo + " / " + userId + " / " + userPwd + " / " + name + " / " + phone + " / " + email + " / "
				+ address + " / " + interest + " / " + enrollDate + " / " + modifyDate + " / " + status;
	}
	
}
