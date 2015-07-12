package com.TravelGuru.Test;

import com.TravelGuru.beans.Deal;

import com.TravelGuru.utils.SalespersonUtils;
import com.TravelGuru.utils.SalespersonUtilsImp;

public class TeatDealUpdate {
	public static void main(String[] args) {

		Deal d = new Deal();
		d.set_d_id(1);
		d.set_d_name("Digha Tour from Kolkata");
		d.set_d_desc("2D/3N Bla Bla Bla ");
		d.set_d_price(3500);
		d.set_m_id(2002);
		d.set_d_avail(true);
		SalespersonUtils su = new SalespersonUtilsImp();

		if (su.updateDeal(d))
			System.out.println("Updated");
		else
			System.out.println("Error");

	}

}
