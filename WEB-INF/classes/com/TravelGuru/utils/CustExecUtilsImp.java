package com.TravelGuru.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.TravelGuru.beans.Booking;
import com.TravelGuru.beans.Customer;

public class CustExecUtilsImp implements CustExecUtils {
	Connection con = null;
	PreparedStatement pst = null;
	Statement st = null;
	ResultSet rs = null;
	int result = 0;

	public List<Booking> viewBooking(String c_email) {
		Booking b = null;
		List<Booking> bookingList = new ArrayList<Booking>();
		con = DButils.getConnected();
		String sql = "select booking.b_id, deal.d_name,booking.b_date, booking.b_qty, booking.b_status from booking,customer,deal where booking.c_id = customer.c_id and booking.d_id=deal.d_id and customer.c_email=?;";
		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setString(1, c_email);
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
	public Customer viewCust(String c_email) {
		Customer c = null;
		con = DButils.getConnected();
		String sql = "SELECT `c_name`, `c_mobile`, `c_address` FROM `customer` WHERE `c_email`= ?;";
		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setString(1, c_email);
			rs = pst.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					c = new Customer();
					c.set_c_name(rs.getString(1));
					c.set_c_mobile(rs.getString(2));
					c.set_c_address(rs.getString(3));
				}
			}
		} catch (SQLException e) {
			System.out.println("Error");
		} finally {
			DButils.releaseResources();
		}
		return c;
	}

}
