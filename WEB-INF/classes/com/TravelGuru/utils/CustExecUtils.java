package com.TravelGuru.utils;

import java.util.List;

import com.TravelGuru.beans.Booking;
import com.TravelGuru.beans.Customer;

public interface CustExecUtils {
	public List<Booking> viewBooking(String c_email);
	public Customer viewCust(String c_email);
}
