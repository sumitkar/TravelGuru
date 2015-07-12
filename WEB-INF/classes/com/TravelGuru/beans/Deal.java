package com.TravelGuru.beans;

public class Deal {
	private int _d_id;
	private int _emp_id;
	private int _m_id;
	private String _d_name;
	private String _d_desc;
	private int _d_price;
	private boolean _d_avail;
	public Deal(){}
	public Deal(int _d_id, int _emp_id, int _m_id, String _d_name, String _d_desc,
			int _d_price, boolean _d_avail) {
		super();
		this._d_id = _d_id;
		this._emp_id = _emp_id;
		this._m_id=_m_id;
		this._d_name = _d_name;
		this._d_desc = _d_desc;
		this._d_price = _d_price;
		this._d_avail= _d_avail;
	}
	public int get_m_id() {
		return _m_id;
	}
	public void set_m_id(int _m_id) {
		this._m_id = _m_id;
	}
	public int get_d_id() {
		return _d_id;
	}
	public void set_d_id(int _d_id) {
		this._d_id = _d_id;
	}
	public int get_emp_id() {
		return _emp_id;
	}
	public void set_emp_id(int _emp_id) {
		this._emp_id = _emp_id;
	}
	
	public void set_d_name(String _d_name) {
		this._d_name = _d_name;
	}
	public String get_d_name() {
		return _d_name;
	}
	public String get_d_desc() {
		return _d_desc;
	}
	public void set_d_desc(String _d_desc) {
		this._d_desc = _d_desc;
	}
	public int get_d_price() {
		return _d_price;
	}
	public void set_d_price(int _d_price) {
		this._d_price = _d_price;
	}
	public boolean is_d_avail() {
		return _d_avail;
	}
	public void set_d_avail(boolean _d_avail) {
		this._d_avail = _d_avail;
	}	

}
