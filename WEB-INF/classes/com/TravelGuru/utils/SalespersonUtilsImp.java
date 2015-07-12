package com.TravelGuru.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.TravelGuru.beans.Deal;
import com.TravelGuru.beans.Merchant;

public class SalespersonUtilsImp implements SalespersonUtils {
	Connection con = null;
	PreparedStatement pst = null;
	Statement st = null;
	ResultSet rs = null;
	int result = 0;

	@Override
	public boolean createDeal(Deal deal) {

		boolean added = false;
		int res = 0;
		con = DButils.getConnected();
		String sql = "INSERT INTO deal ( emp_id, m_id, d_name, d_desc, d_price, d_avail) VALUES ( ?, ?, ?, ?, ?, ?);";

		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setInt(1, deal.get_emp_id());
			pst.setInt(2, deal.get_m_id());
			pst.setString(3, deal.get_d_name());
			pst.setString(4, deal.get_d_desc());
			pst.setInt(5, deal.get_d_price());
			pst.setBoolean(6, deal.is_d_avail());
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
	public boolean updateDeal(Deal deal) {
		boolean added = false;
		int res = 0;
		con = DButils.getConnected();
		String sql = "UPDATE deal SET m_id=?,d_name=?,d_desc=?,d_price=?,d_avail=? WHERE d_id=?;";

		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setInt(1, deal.get_m_id());
			pst.setString(2, deal.get_d_name());
			pst.setString(3, deal.get_d_desc());
			pst.setInt(4, deal.get_d_price());
			pst.setBoolean(5, deal.is_d_avail());
			pst.setInt(6, deal.get_d_id());
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
	public List<Merchant> viewAllMerchant() {
		Merchant m = null;
		List<Merchant> MerchantList = new ArrayList<Merchant>();
		con = DButils.getConnected();
		String sql = "select * from merchant;";
		pst = DButils.getPreparedStatement(sql);
		try {
			rs = pst.executeQuery();
			if (rs != null)
				while (rs.next()) {
					m = new Merchant();
					m.set_m_id(rs.getInt(1));
					m.set_m_name(rs.getString(2));
					m.set_m_service(rs.getString(3));
					m.set_m_price(rs.getInt(4));
					MerchantList.add(m);
				}
		} catch (SQLException e) {
			System.out.println("Error");
		} finally {
			DButils.releaseResources();
		}
		return MerchantList;

	}

	@Override
	public List<Deal> getDeals(int emp_id) {
		Deal d = null;
		List<Deal> dealList = new ArrayList<Deal>();
		con = DButils.getConnected();
		String sql = "SELECT * FROM `deal` WHERE emp_id=?;";
		pst = DButils.getPreparedStatement(sql);
		try {
			pst.setInt(1, emp_id);
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

}
