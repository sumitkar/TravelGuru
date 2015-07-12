package com.TravelGuru.utils;

import java.util.List;

import com.TravelGuru.beans.Booking;
import com.TravelGuru.beans.Merchant;

public interface MerchantUtils {
	public Merchant validateMerchant(String m_id, String m_password);

	public List<Booking> viewBooking(int m_id);

	public boolean confirmBooking(int b_id);
}
