package com.TravelGuru.utils;

import com.TravelGuru.beans.Booking;

public interface BookingUtils {

	public boolean createBooking(int c_id, int d_id, String b_date, int b_qty);

	public boolean cancelBooking(int b_id);

	public Booking checkBookingStatus(int b_id);
	

}
