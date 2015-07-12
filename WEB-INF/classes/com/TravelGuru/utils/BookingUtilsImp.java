package com.TravelGuru.utils;

import com.TravelGuru.beans.Booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BookingUtilsImp implements BookingUtils {
	Connection con = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int success;

	@Override
	public boolean createBooking(int c_id, int d_id, String b_date, int b_qty) {
		boolean added = false;
		int res = 0;
		con = DButils.getConnected();
		String sql = "INSERT INTO booking( d_id, c_id, b_date, b_qty, b_status) VALUES (?,?,?,?,0);";
		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setInt(1, d_id);
			pst.setInt(2, c_id);
			pst.setString(3, b_date);
			pst.setInt(4, b_qty);
			res = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButils.releaseResources();
		}
		if (res > 0)
			added = true;
		return added;
	}

	@Override
	public boolean cancelBooking(int b_id) {
		boolean canceled = false;

		con = DButils.getConnected();
		String sql = "DELETE FROM `booking` WHERE `b_id`= ?";
		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setInt(1, b_id);
			success = pst.executeUpdate();
			if (success > 0)
				canceled = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			DButils.releaseResources();
		}

		return canceled;
	}

	@Override
	public Booking checkBookingStatus(int b_id) {
		Booking b = new Booking();
		con = DButils.getConnected();
		String sql = "SELECT deal.d_name,booking.b_date,booking.b_qty, booking.b_status FROM deal,booking WHERE booking.b_id=? and deal.d_id=booking.d_id;";
		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setInt(1, b_id);
			rs = pst.executeQuery();
			if (rs != null) {
				if (rs.next()) {

					b.set_d_name(rs.getString(1));
					b.set_b_date(rs.getString(2));
					b.set_b_qty(rs.getInt(3));
					b.set_b_status(rs.getBoolean(4));
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButils.releaseResources();
		}

		return b;
	}

}
