package com.TravelGuru.Test;

import com.TravelGuru.beans.Customer;
import com.TravelGuru.utils.CustomerUtils;
import com.TravelGuru.utils.CustomerUtilsImp;

public class TestReg {
	public static void main(String[] args) {

		Customer c = new Customer();
		c.set_c_name("Sumit Kar");
		c.set_c_email("sumit@gmail.com");
		c.set_c_mobile("9038901219");
		c.set_c_address("P-30, CIT Scheme 114-A Lake Gardens Kolkata - 700045");
		c.set_c_password("12345");
		CustomerUtils cu = new CustomerUtilsImp();
		if (cu.signupCustomer(c))
			System.out.println("Added");
		else
			System.out.println("Error");

	}

}
