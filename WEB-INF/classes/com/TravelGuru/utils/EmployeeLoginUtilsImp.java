package com.TravelGuru.utils;

import java.sql.*;

import com.TravelGuru.beans.Employee;

public class EmployeeLoginUtilsImp implements EmployeeLoginUtils {
	Connection con = null;
	PreparedStatement pst = null;
	Statement st = null;
	ResultSet rs = null;
	int result = 0;

	public Employee validate(String emp_id, String password) {
		Employee emp = null;
		con = DButils.getConnected();
		st = DButils.getStatement();
		String sql = "Select * from employee where emp_id=? and emp_password=?;";

		pst = DButils.getPreparedStatement(sql);

		try {
			pst.setString(1, emp_id);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					emp = new Employee();
					emp.set_emp_id(rs.getInt(1));
					emp.set_emp_name(rs.getString(2));
					emp.set_emp_email(rs.getString(3));
					emp.set_emp_role(rs.getString(4));
					emp.set_emp_password(rs.getString(5));

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error");
		} finally {
			DButils.releaseResources();
		}
		return emp;
	}

}
