--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`b_id`, `d_id`, `c_id`, `b_date`, `b_qty`, `b_status`) VALUES
(5002, 4002, 3006, '2015-07-10', 1, 1),
(5003, 4002, 3007, '2015-08-08', 4, 1),
(5004, 4003, 3007, '2015-07-30', 4, 0);

-- --------------------------------------------------------

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`c_id`, `c_name`, `c_email`, `c_mobile`, `c_address`, `c_password`) VALUES
(3001, 'Barnali Das', 'barnalidas367@gmail.com', 8981483158, 'Mukundapur, Kolkata - 700099', 'b123'),
(3002, 'Swagata Banerjee', 'swagata@gmail.com', 8274834481, 'Extreme Baruipur, Kolkata - 700145', 'sayan123'),
(3003, 'Sayandeep Majumdar', 'sayandeep@gmail.com', 8961889595, 'Krishna Glass, Jadavpur, Kolkata - 700033', 'swag123'),
(3004, 'Parth Kumar Jha', 'pkj@gmail.com', 9864321212, 'Kudghat, Kolkata - 700045', 'pkj123'),
(3005, 'Protyush Dutta', 'protyush@gmail.com', 9038734420, 'Sulekha, Jadavpur, Kolkata-700081', 'pro123'),
(3006, 'Muskaan Gupta', 'musk@gmail.com', 9900554828, 'Behala, Kolkata- 700061', 'mu123'),
(3007, 'Sumit Kar', 'sumit@gmail.com', 9038901219, 'Lake Gardens Kolkata-700045', 'sk123');

-- --------------------------------------------------------

--
-- Dumping data for table `deal`
--

INSERT INTO `deal` (`d_id`, `emp_id`, `m_id`, `d_name`, `d_desc`, `d_price`, `d_avail`) VALUES
(4001, 1001, 2001, 'Spices Of Kerala Tours', '2N/3D in Temple Hotel in Kerala for Rs.40000/- per couple', 40000, 0),
(4002, 1001, 2007, 'Chennai Weekend Tours', '2N/3D in Express Hotel in Chennai for Rs.45000/- per couple', 45000, 1),
(4003, 1002, 2002, 'Best of Rajasthan Tours', '3N/4D in Radisson Blew in Rajasthan for Rs.34000/- per couple', 34000, 1),
(4004, 1002, 2003, 'Jewelles of Kashmir Travels', '2N/3D in Dalma Hotel in Kashmir for Rs.20000/- per couple', 20000, 1),
(4005, 1002, 2005, 'Exotic Goa Beaches Tours', '1N/2D in Pacific Rim Hotel in Goa for Rs.22000/- per person', 22000, 1);

-- --------------------------------------------------------

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_email`, `emp_role`, `emp_password`) VALUES
(1001, 'Kuheli Chowdhury', 'kuheli@gmail.com', 'sales', 'ku123'),
(1002, 'Megha Priya', 'megha@gmail.com', 'sales', 'me123'),
(1003, 'Gaurav Kr. Jha', 'gauri@gmail.com', 'cs', 'ga123'),
(1004, 'Rukhsar Aziz', 'rukhsar@gmail.com', 'cs', 'ru123'),
(1005, 'Sumit Kar', 'sumit@gmail.com', 'admin', 'su123');

-- --------------------------------------------------------

--
-- Dumping data for table `merchant`
--

INSERT INTO `merchant` (`m_id`, `m_name`, `m_service`, `m_price`, `m_password`) VALUES
(2001, 'Kerala Tours', 'Fooding, lodging, transport', 15000, 'ke123'),
(2002, 'Rajasthan Tours & Travels', 'Fooding, lodging, transport', 12000, 'ra123'),
(2003, 'Kashmir Jewels', 'Fooding, lodging, transport', 9000, 'ka123'),
(2004, 'Dark Sikkim', 'Fooding, lodging, transport', 20000, 'si123'),
(2005, 'Watery Goa Travels', 'Fooding, lodging, transport', 8000, 'go123'),
(2006, 'Tripura Trips', 'Fooding, lodging, transport', 12000, 'tr123'),
(2007, 'Chennai Express Travels', 'Fooding, lodging, transport', 20000, 'ch123');

-- --------------------------------------------------------