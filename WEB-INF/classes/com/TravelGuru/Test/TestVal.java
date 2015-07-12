package com.TravelGuru.Test;

import com.TravelGuru.beans.Customer;
import com.TravelGuru.utils.CustomerUtils;
import com.TravelGuru.utils.CustomerUtilsImp;

public class TestVal {
	public static void main(String[] args) {

		Customer c = null;
		String email = "sumit@gmail.com";
		String password = "12345";
		CustomerUtils cu = new CustomerUtilsImp();
		c = cu.validate(email, password);
		System.out.println(c);

	}

}
