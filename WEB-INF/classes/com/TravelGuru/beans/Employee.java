package com.TravelGuru.beans;

public class Employee {
	private int _emp_id;
	private String _emp_name;
	private String _emp_email;
	private String _emp_role;
	private String _emp_password;
	
	public Employee() {}

	public Employee(int _emp_id, String _emp_name, String _emp_email,
			String _emp_role, String _emp_password) {
		super();
		this._emp_id = _emp_id;
		this._emp_name = _emp_name;
		this._emp_email = _emp_email;
		this._emp_role = _emp_role;
		this._emp_password = _emp_password;
	}

	public int get_emp_id() {
		return _emp_id;
	}

	public void set_emp_id(int _emp_id) {
		this._emp_id = _emp_id;
	}

	public String get_emp_name() {
		return _emp_name;
	}

	public void set_emp_name(String _emp_name) {
		this._emp_name = _emp_name;
	}

	public String get_emp_email() {
		return _emp_email;
	}

	public void set_emp_email(String _emp_email) {
		this._emp_email = _emp_email;
	}

	public String get_emp_role() {
		return _emp_role;
	}

	public void set_emp_role(String _emp_role) {
		this._emp_role = _emp_role;
	}

	public String get_emp_password() {
		return _emp_password;
	}

	public void set_emp_password(String _emp_password) {
		this._emp_password = _emp_password;
	}
	
}
