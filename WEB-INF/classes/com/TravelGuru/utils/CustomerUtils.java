package com.TravelGuru.utils;

import java.util.List;

import com.TravelGuru.beans.*;

public interface CustomerUtils {

	public boolean signupCustomer(Customer customer);

	public Customer validate(String email, String password);

	public List<Deal> viewAllDeals();

	public Deal viewDeal(int d_id);

	public List<Booking> viewBooking(int c_id);
}
