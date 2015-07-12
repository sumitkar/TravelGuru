package com.TravelGuru.utils;

import java.util.*;

import com.TravelGuru.beans.Booking;
import com.TravelGuru.beans.Customer;
import com.TravelGuru.beans.Deal;

import java.sql.*;

public class CustomerUtilsImp implements CustomerUtils {
	Connection con = null;
	PreparedStatement pst = null;
	Statement st = null;
	ResultSet rs = null;
	int result = 0;

	@Override
	public boolean signupCustomer(Customer customer) {
		boolean added = false;
		int res = 0;
		con = DButils.getConnected();
		String sql = "INSERT INTO customer ( c_name, c_email, c_mobile, c_address, c_password) VALUES ( ?, ?, ?, ?, ?);";

		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setString(1, customer.get_c_name());
			pst.setString(2, customer.get_c_email());
			pst.setString(3, customer.get_c_mobile());
			pst.setString(4, customer.get_c_address());
			pst.setString(5, customer.get_c_password());

			res = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			DButils.releaseResources();
		}

		if (res > 0)
			added = true;

		return added;
	}

	@Override
	public Customer validate(String email, String password) {
		Customer c = null;
		con = DButils.getConnected();
		String sql = "Select * from customer where c_email=? and c_password=?;";

		pst = DButils.getPreparedStatement(sql);

		try {
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					c = new Customer();
					c.set_c_id(rs.getInt(1));
					c.set_c_name(rs.getString(2));
					c.set_c_email(rs.getString(3));
					c.set_c_mobile(rs.getString(4));
					c.set_c_address(rs.getString(5));
					c.set_c_password(rs.getString(6));

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error");
		} finally {
			DButils.releaseResources();
		}

		return c;
	}

	@Override
	public List<Deal> viewAllDeals() {
		Deal d = null;
		List<Deal> dealList = new ArrayList<Deal>();
		con = DButils.getConnected();
		String sql = "SELECT * FROM `deal` WHERE d_avail=1;";
		pst = DButils.getPreparedStatement(sql);
		try {
			rs = pst.executeQuery();
			if (rs != null)
				while (rs.next()) {
					d = new Deal();
					d.set_d_id(rs.getInt(1));
					d.set_emp_id(rs.getInt(2));
					d.set_m_id(rs.getInt(3));
					d.set_d_name(rs.getString(4));
					d.set_d_desc(rs.getString(5));
					d.set_d_price(rs.getInt(6));
					dealList.add(d);
				}
		} catch (SQLException e) {
			System.out.println("Error");
		} finally {
			DButils.releaseResources();
		}

		return dealList;
	}

	@Override
	public List<Booking> viewBooking(int c_id) {
		Booking b = null;
		List<Booking> bookingList = new ArrayList<Booking>();
		con = DButils.getConnected();
		String sql = "SELECT booking.b_id, deal.d_name, booking.b_date, booking.b_qty, booking.b_status FROM `booking`,`deal` WHERE c_id=? and booking.d_id=deal.d_id;";
		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setInt(1, c_id);
			rs = pst.executeQuery();
			if (rs != null)
				while (rs.next()) {
					b = new Booking();
					b.set_b_id(rs.getInt(1));
					b.set_d_name(rs.getString(2));
					b.set_b_date(rs.getString(3));
					b.set_b_qty(rs.getInt(4));
					b.set_b_status(rs.getBoolean(5));
					bookingList.add(b);
				}
		} catch (SQLException e) {
			System.out.println("Error");
		} finally {
			DButils.releaseResources();
		}
		return bookingList;
	}

	@Override
	public Deal viewDeal(int d_id) {
		Deal d = null;
		con = DButils.getConnected();
		String sql = "SELECT * FROM `deal` WHERE d_id=?;";
		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setInt(1, d_id);
			rs = pst.executeQuery();
			if (rs != null)
				while (rs.next()) {
					d = new Deal();
					d.set_d_id(rs.getInt(1));
					d.set_emp_id(rs.getInt(2));
					d.set_m_id(rs.getInt(3));
					d.set_d_name(rs.getString(4));
					d.set_d_desc(rs.getString(5));
					d.set_d_price(rs.getInt(6));
				}
		} catch (SQLException e) {
			System.out.println("Error");
		} finally {
			DButils.releaseResources();
		}
		return d;
	}

}
