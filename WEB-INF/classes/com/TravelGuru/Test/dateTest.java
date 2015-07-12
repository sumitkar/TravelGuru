package com.TravelGuru.Test;
import java.util.*;
import java.text.*;

public class dateTest {
   public static void main(String args[]) {

      Date dNow = new Date( );
      SimpleDateFormat ft = 
      new SimpleDateFormat ("yyyy-MM-dd");
      System.out.println (ft.format(dNow));
      Calendar cal = Calendar.getInstance();
      cal.setTime(dNow);
      cal.add(Calendar.DATE, 15); 
      dNow = cal.getTime();
      System.out.println (ft.format(dNow));
   }
}
