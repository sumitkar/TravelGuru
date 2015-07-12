package com.TravelGuru.utils;
import com.TravelGuru.beans.*;
import java.util.*;

import com.TravelGuru.beans.Deal;

public interface SalespersonUtils {
	
	public boolean createDeal(Deal deal);
	public boolean updateDeal(Deal deal);
	public List<Merchant> viewAllMerchant();
	public List<Deal> getDeals(int emp_id);
}
