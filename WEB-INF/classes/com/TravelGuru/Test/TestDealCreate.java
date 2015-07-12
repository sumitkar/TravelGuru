package com.TravelGuru.Test;

import com.TravelGuru.beans.Deal;

import com.TravelGuru.utils.SalespersonUtils;
import com.TravelGuru.utils.SalespersonUtilsImp;

public class TestDealCreate {
	public static void main(String[] args) {

		Deal d = new Deal();
		d.set_d_name("Buzy Bee Bombay");
		d.set_d_desc("2N/3D Bombay tour ");
		d.set_d_price(6000);
		d.set_emp_id(2002);
		d.set_m_id(6009);
		d.set_d_avail(true);
		SalespersonUtils su = new SalespersonUtilsImp();

		if (su.createDeal(d))
			System.out.println("Added");
		else
			System.out.println("Error");

	}

}
