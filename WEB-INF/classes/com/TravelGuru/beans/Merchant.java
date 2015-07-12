package com.TravelGuru.beans;

public class Merchant {
	private int _m_id;
	private String _m_name;
	private String _m_service;
	private int _m_price;
	private String _m_password;

	public String get_m_password() {
		return _m_password;
	}

	public void set_m_password(String _m_password) {
		this._m_password = _m_password;
	}

	public Merchant() {
	}

	public Merchant(int _m_id, String _m_name, String _m_service, int _m_price,
			String _m_password) {
		super();
		this._m_id = _m_id;
		this._m_name = _m_name;
		this._m_service = _m_service;
		this._m_price = _m_price;
		this._m_password = _m_password;
	}

	public int get_m_id() {
		return _m_id;
	}

	public void set_m_id(int _m_id) {
		this._m_id = _m_id;
	}

	public String get_m_name() {
		return _m_name;
	}

	public void set_m_name(String _m_name) {
		this._m_name = _m_name;
	}

	public String get_m_service() {
		return _m_service;
	}

	public void set_m_service(String _m_service) {
		this._m_service = _m_service;
	}

	public int get_m_price() {
		return _m_price;
	}

	public void set_m_price(int _m_price) {
		this._m_price = _m_price;
	}

}
