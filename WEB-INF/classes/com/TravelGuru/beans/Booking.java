package com.TravelGuru.beans;

public class Booking {
	private int _b_id;
	private int _d_id;
	private String _d_name;
	private int _c_id;
	private int _emp_id;
	private int _m_id;
	private String _b_date;
	private int _b_qty;
	private boolean _b_status;

	public Booking() {
	}

	public Booking(int _b_id, int _d_id, int _c_id, int _emp_id, int _m_id,
			String _b_date, int _b_qty, boolean _b_status) {
		super();
		this._b_id = _b_id;
		this._d_id = _d_id;
		this._c_id = _c_id;
		this._emp_id = _emp_id;
		this._m_id = _m_id;
		this._b_date = _b_date;
		this._b_qty = _b_qty;
		this._b_status = _b_status;
	}

	public int get_m_id() {
		return _m_id;
	}

	public void set_m_id(int _m_id) {
		this._m_id = _m_id;
	}

	public int get_b_id() {
		return _b_id;
	}

	public void set_b_id(int _b_id) {
		this._b_id = _b_id;
	}

	public int get_d_id() {
		return _d_id;
	}

	public void set_d_id(int _d_id) {
		this._d_id = _d_id;
	}

	public int get_c_id() {
		return _c_id;
	}

	public void set_c_id(int _c_id) {
		this._c_id = _c_id;
	}

	public int get_emp_id() {
		return _emp_id;
	}

	public void set_emp_id(int _emp_id) {
		this._emp_id = _emp_id;
	}

	public String get_b_date() {
		return _b_date;
	}

	public void set_b_date(String _b_date) {
		this._b_date = _b_date;
	}

	public int get_b_qty() {
		return _b_qty;
	}

	public void set_b_qty(int _b_qty) {
		this._b_qty = _b_qty;
	}

	public boolean is_b_status() {
		return _b_status;
	}

	public void set_b_status(boolean _b_status) {
		this._b_status = _b_status;
	}
	public String get_d_name() {
		return _d_name;
	}

	public void set_d_name(String _d_name) {
		this._d_name = _d_name;
	}

}
