--
-- Customer Validation
--

SELECT * FROM `customer` WHERE `c_email` = ? and `c_password` = ?;

--
-- List all Available Deals 
--

SELECT * FROM `deal` WHERE `d_avail`=1;

--
-- View Customer Bookings
--

SELECT `booking.b_id`, `deal.d_name`, `booking.b_date`, `booking.b_qty`, `booking.b_status` 
FROM `booking`,`deal` 
WHERE c_id=? and booking.d_id=deal.d_id;

--
-- View Deal 
--

SELECT * FROM `deal` WHERE `d_id`=?;

--
-- Create Booking
--

INSERT INTO `booking`( `d_id`, `c_id`, `b_date`, `b_qty`, `b_status`) VALUES (?,?,?,?,0);

--
-- Cancel booking
--

DELETE FROM `booking` WHERE `b_id`= ?

--
-- Check Booking Status
--

SELECT `deal.d_name`,`booking.b_date`,`booking.b_qty`, `booking.b_status` 
FROM `deal`,`booking` 
WHERE `booking.b_id`=? and `deal.d_id`=`booking.d_id`;

--
-- View All Bookings by Customer Email
--

SELECT `booking.b_id`, `deal.d_name`,`booking.b_date`, `booking.b_qty`, `booking.b_status` 
FROM `booking`,`customer`,`deal` 
WHERE `booking.c_id` = `customer.c_id` and `booking.d_id`=`deal.d_id` and `customer.c_email`=?;

--
-- Employee Login validation
--

SELECT * FROM `employee` WHERE `emp_id`=? and `emp_password`=?;

--
-- Merchant Login validation
--

SELECT * FROM `merchant` WHERE m_id=? and m_password=?;

--
-- Show Pending Booking for Merchant
--

SELECT `booking.b_id`,`deal.d_name`,`booking.b_date`,`booking.b_qty`, `booking.b_status` 
FROM `deal`,`booking` 
WHERE `deal.m_id`=? and `deal.d_id`=`booking.d_id` and `b_status`='0';

--
-- Confirm Booking
--

UPDATE `booking` SET `b_status`=1 WHERE `b_id`=?;

--
-- Create Deal
--
		
INSERT INTO `deal` ( `emp_id`, `m_id`, `d_name`, `d_desc`, `d_price`, `d_avail`) VALUES ( ?, ?, ?, ?, ?, ?);

--
-- UpdateDeal
--

UPDATE `deal` SET `m_id`=?,`d_name`=?,`d_desc`=?,`d_price`=?,`d_avail`=? WHERE `d_id`=?;

--
-- View All Merchants
--

SELECT * FROM `merchant`;

--
-- View All Deals by Employee
--

SELECT * FROM `deal` WHERE `emp_id`=?;