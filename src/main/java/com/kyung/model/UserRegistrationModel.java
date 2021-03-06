package com.kyung.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.kyung.dto.User;

public class UserRegistrationModel 
{
	@NotEmpty(message="학번을 입력하세요.")
	@Size(min=9, max=10, message="9~10자리만 가능합니다.")
	@Pattern(regexp="20[0-9]{7,8}", message="올바른 학번을 입력하세요.")
	String studentNumber;

	@NotEmpty(message="비밀번호를 입력하세요.")
	@Size(min=8, max=15)
	@Pattern(regexp="^(?=.*\\d)(?=.*[#$@!%&*?])[A-Za-z\\d#$@!%&*?]{8,}$",
				message="하나 이상의 특수문자를 포함해야합니다.")
	String password1;
	String password2;
	
	@NotEmpty(message="이름을 입력하세요.")
	@Pattern(regexp="^[가-힇]*$", message="한글만 입력 가능합니다.")
	@Size(min=2, max=20)
	String name;
	
	// @Size(min=2, max=20)
	// 입력할 때만 출력되어야 함 
	String nickname;
	
	int gender;
	
	Integer departmentId;
	
	//@NotEmpty
	String question;
	
	@NotEmpty
	String answer;
	
	public int getGender() 
	{
		return gender;
	}

	public void setGender(int gender) 
	{
		this.gender = gender;
	}

	public User toUser() //UserRegistrationModel to User Object 
	{ 
		User user = new User();
		user.setStudentNumber(this.studentNumber);
		user.setPassword(this.password1);
		user.setName(this.name);
		user.setNickname(this.nickname);
		user.setGender(this.gender);
		user.setDepartmentId(this.departmentId);
		user.setQuestion(this.question);
		user.setAnswer(this.answer);
		return user;
	}

	public String getStudentNumber() 
	{
		return studentNumber;
	}

	public void setStudentNumber(String studentNumber) 
	{
		this.studentNumber = studentNumber;
	}

	public String getName() 
	{
		return name;
	}

	public void setName(String name) 
	{
		this.name = name;
	}

	public String getNickname() 
	{
		return nickname;
	}

	public void setNickname(String nickname) 
	{
		this.nickname = nickname;
	}

	
	
	public String getPassword1() 
	{
		return password1;
	}

	public void setPassword1(String password1) 
	{
		this.password1 = password1;
	}

	public String getPassword2() 
	{
		return password2;
	}

	public void setPassword2(String password2) 
	{
		this.password2 = password2;
	}

	public Integer getDepartmentId() 
	{
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) 
	{
		this.departmentId = departmentId;
	}

	public String getQuestion() 
	{
		return question;
	}

	public void setQuestion(String question) 
	{
		this.question = question;
	}

	public String getAnswer() 
	{
		return answer;
	}

	public void setAnswer(String answer) 
	{
		this.answer = answer;
	}
	
}
