package ean.spring.dto;

public class joadb_usersDTO {
	
	int user_no;
	String id;
	String password;
	String name;
	String phone;
	String email;
	
	public joadb_usersDTO() {
		// TODO Auto-generated constructor stub
	}

	public joadb_usersDTO(int user_no, String id, String password, String name, String phone, String email) {
		super();
		this.user_no = user_no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
	
	
	

}
