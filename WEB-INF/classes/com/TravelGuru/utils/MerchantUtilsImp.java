package com.TravelGuru.utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.TravelGuru.beans.*;

public class MerchantUtilsImp implements MerchantUtils {
	Connection con = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int success;

	@Override
	public Merchant validateMerchant(String m_id, String m_password) {
		Merchant m = null;
		con = DButils.getConnected();
		st = DButils.getStatement();
		String sql = "Select * from merchant where m_id=? and m_password=?;";

		pst = DButils.getPreparedStatement(sql);

		try {
			pst.setString(1, m_id);
			pst.setString(2, m_password);
			rs = pst.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					m = new Merchant();
					m.set_m_id(rs.getInt(1));
					m.set_m_name(rs.getString(2));
					m.set_m_service(rs.getString(3));
					m.set_m_price(rs.getInt(4));
					m.set_m_password(rs.getString(5));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error");
		} finally {
			DButils.releaseResources();
		}
		return m;
	}

	@Override
	public List<Booking> viewBooking(int m_id) {
		Booking b = null;
		List<Booking> b_list = new ArrayList<Booking>();
		con = DButils.getConnected();
		String sql = "SELECT booking.b_id,deal.d_name,booking.b_date,booking.b_qty, booking.b_status FROM deal,booking WHERE deal.m_id=? and deal.d_id=booking.d_id and b_status='0';";
		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setInt(1, m_id);
			rs = pst.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					b = new Booking();
					b.set_b_id(rs.getInt(1));
					b.set_d_name(rs.getString(2));
					b.set_b_date(rs.getString(3));
					b.set_b_qty(rs.getInt(4));
					b.set_b_status(rs.getBoolean(5));
					b_list.add(b);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			DButils.releaseResources();
		}

		return b_list;

	}

	@Override
	public boolean confirmBooking(int b_id) {
		boolean confirm = false;
		con = DButils.getConnected();
		String sql = "UPDATE `booking` SET `b_status`=1 WHERE `b_id`=?;";
		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setInt(1, b_id);
			success = pst.executeUpdate();
			if (success > 0)
				confirm = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			DButils.releaseResources();
		}

		return confirm;
	}

}
