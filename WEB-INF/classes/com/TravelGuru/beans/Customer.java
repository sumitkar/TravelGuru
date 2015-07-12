package com.TravelGuru.beans;

public class Customer {
	private int _c_id;
	private String _c_name;
	private String _c_email;
	private String _c_mobile;
	private String _c_address;
	private String _c_password;
	
	public Customer(){}

	public Customer(int _c_id, String _c_name, String _c_email, String _c_mobile,
			String _c_address, String _c_password) {
		super();
		this._c_id = _c_id;
		this._c_name = _c_name;
		this._c_email = _c_email;
		this._c_mobile = _c_mobile;
		this._c_address = _c_address;
		this._c_password = _c_password;
	}

	public int get_c_id() {
		return _c_id;
	}

	public void set_c_id(int _c_id) {
		this._c_id = _c_id;
	}

	public String get_c_name() {
		return _c_name;
	}

	public void set_c_name(String _c_name) {
		this._c_name = _c_name;
	}

	public String get_c_email() {
		return _c_email;
	}

	public void set_c_email(String _c_email) {
		this._c_email = _c_email;
	}

	public String get_c_mobile() {
		return _c_mobile;
	}

	public void set_c_mobile(String _c_mobile) {
		this._c_mobile = _c_mobile;
	}

	public String get_c_address() {
		return _c_address;
	}

	public void set_c_address(String _c_address) {
		this._c_address = _c_address;
	}

	public String get_c_password() {
		return _c_password;
	}

	public void set_c_password(String _c_password) {
		this._c_password = _c_password;
	}
	public String toString(){
		return _c_name;	
	}

}
