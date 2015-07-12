CREATE database travelguru;
USE travelguru;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+05:30";


--
-- Database: `travelguru`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `b_id` int(10) NOT NULL AUTO_INCREMENT,
  `d_id` int(10) NOT NULL,
  `c_id` int(10) NOT NULL,
  `b_date` date NOT NULL,
  `b_qty` int(5) NOT NULL,
  `b_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8038 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`b_id`, `d_id`, `c_id`, `b_date`, `b_qty`, `b_status`) VALUES
(?, ?, ?, ?, ?, ?);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(100) NOT NULL,
  `c_email` varchar(100) NOT NULL,
  `c_mobile` bigint(16) NOT NULL,
  `c_address` varchar(200) NOT NULL,
  `c_password` varchar(20) NOT NULL,
  PRIMARY KEY (`c_id`)
) AUTO_INCREMENT=3001 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`c_id`, `c_name`, `c_email`, `c_mobile`, `c_address`, `c_password`) VALUES
( ?, ?, ?, ?, ?, ?);

-- --------------------------------------------------------

--
-- Table structure for table `deal`
--

CREATE TABLE IF NOT EXISTS `deal` (
  `d_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) NOT NULL,
  `m_id` int(11) NOT NULL,
  `d_name` varchar(200) NOT NULL,
  `d_desc` varchar(1000) NOT NULL,
  `d_price` int(10) NOT NULL,
  `d_avail` tinyint(1) NOT NULL,
  PRIMARY KEY (`d_id`)
) AUTO_INCREMENT=1001 ;

--
-- Dumping data for table `deal`
--

INSERT INTO `deal` (`d_id`, `emp_id`, `m_id`, `d_name`, `d_desc`, `d_price`, `d_avail`) VALUES
(?, ?, ?, ?, ?, ?, ?);


-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(100) NOT NULL,
  `emp_email` varchar(100) NOT NULL,
  `emp_role` varchar(50) NOT NULL,
  `emp_password` varchar(20) NOT NULL,
  PRIMARY KEY (`emp_id`)
) AUTO_INCREMENT=2001 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_email`, `emp_role`, `emp_password`) VALUES
(?, ?, ?, ?, ?);

-- --------------------------------------------------------

--
-- Table structure for table `merchant`
--

CREATE TABLE IF NOT EXISTS `merchant` (
  `m_id` int(10) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(100) NOT NULL,
  `m_service` varchar(100) NOT NULL,
  `m_price` int(10) NOT NULL,
  `m_password` varchar(100) NOT NULL,
  PRIMARY KEY (`m_id`)
) AUTO_INCREMENT=6001 ;

--
-- Dumping data for table `merchant`
--

INSERT INTO `merchant` (`m_id`, `m_name`, `m_service`, `m_price`, `m_password`) VALUES
(?, ?, ?, ?, ?);

-- --------------------------------------------------------

--
-- Customer Registration
--

INSERT INTO `customer` ( `c_name`, `c_email`, `c_mobile`, `c_address`, `c_password`) VALUES 
( ?, ?, ?, ?, ?);

