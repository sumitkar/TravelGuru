package com.TravelGuru.utils;

import com.TravelGuru.beans.Employee;

public interface EmployeeLoginUtils {
	public Employee validate(String emp_id, String password);
}
