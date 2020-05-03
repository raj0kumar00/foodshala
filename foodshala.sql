-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2020 at 06:46 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodshala`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_customer_profile`
--

CREATE TABLE `accounts_customer_profile` (
  `id` int(11) NOT NULL,
  `mob` int(11) DEFAULT NULL,
  `preference` longtext DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_customer_profile`
--

INSERT INTO `accounts_customer_profile` (`id`, `mob`, `preference`, `user_id`) VALUES
(1, 2147483647, 'veg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_restaurant_profile`
--

CREATE TABLE `accounts_restaurant_profile` (
  `id` int(11) NOT NULL,
  `mob` int(11) DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `restaurantname` longtext DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_restaurant_profile`
--

INSERT INTO `accounts_restaurant_profile` (`id`, `mob`, `location`, `restaurantname`, `user_id`) VALUES
(1, 1234567890, 'gorakhpur', 'happy resto', 2);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user`
--

CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_customer` tinyint(1) NOT NULL,
  `is_restaurant` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_user`
--

INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_customer`, `is_restaurant`) VALUES
(1, 'pbkdf2_sha256$180000$ppvz8sKJeeRv$RVKHVRnWqLFkt/ylbLWZRY5n3pH31QVlU8zTMmg29n8=', '2020-04-17 16:28:17.928350', 0, 'customer_demo', '', '', 'demoaccount2@gmail.com', 0, 1, '2020-04-17 16:23:39.624210', 1, 0),
(2, 'pbkdf2_sha256$180000$rBDMH8vMz1tT$eKyjwUCoH80gSsgJEQzPfwRhz+0QYVjgeyekAkFeCWs=', '2020-04-17 16:29:05.274958', 0, 'restaurant_demo', '', '', 'demoaccount@gmail.com', 0, 1, '2020-04-17 16:24:39.312703', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_groups`
--

CREATE TABLE `accounts_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_user_permissions`
--

CREATE TABLE `accounts_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add active_orders_details', 6, 'add_active_orders_details'),
(22, 'Can change active_orders_details', 6, 'change_active_orders_details'),
(23, 'Can delete active_orders_details', 6, 'delete_active_orders_details'),
(24, 'Can view active_orders_details', 6, 'view_active_orders_details'),
(25, 'Can add item_details', 7, 'add_item_details'),
(26, 'Can change item_details', 7, 'change_item_details'),
(27, 'Can delete item_details', 7, 'delete_item_details'),
(28, 'Can view item_details', 7, 'view_item_details'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add restaurant_ profile', 9, 'add_restaurant_profile'),
(34, 'Can change restaurant_ profile', 9, 'change_restaurant_profile'),
(35, 'Can delete restaurant_ profile', 9, 'delete_restaurant_profile'),
(36, 'Can view restaurant_ profile', 9, 'view_restaurant_profile'),
(37, 'Can add customer_ profile', 10, 'add_customer_profile'),
(38, 'Can change customer_ profile', 10, 'change_customer_profile'),
(39, 'Can delete customer_ profile', 10, 'delete_customer_profile'),
(40, 'Can view customer_ profile', 10, 'view_customer_profile');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(10, 'accounts', 'customer_profile'),
(9, 'accounts', 'restaurant_profile'),
(8, 'accounts', 'user'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(6, 'FoodShala', 'active_orders_details'),
(7, 'FoodShala', 'item_details'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-04-17 16:05:43.492403'),
(2, 'contenttypes', '0002_remove_content_type_name', '2020-04-17 16:05:44.479210'),
(3, 'auth', '0001_initial', '2020-04-17 16:05:45.382765'),
(4, 'auth', '0002_alter_permission_name_max_length', '2020-04-17 16:05:50.259847'),
(5, 'auth', '0003_alter_user_email_max_length', '2020-04-17 16:05:50.596856'),
(6, 'auth', '0004_alter_user_username_opts', '2020-04-17 16:05:50.845679'),
(7, 'auth', '0005_alter_user_last_login_null', '2020-04-17 16:05:51.012366'),
(8, 'auth', '0006_require_contenttypes_0002', '2020-04-17 16:05:51.164936'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2020-04-17 16:05:51.267237'),
(10, 'auth', '0008_alter_user_username_max_length', '2020-04-17 16:05:51.350548'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2020-04-17 16:05:51.408320'),
(12, 'auth', '0010_alter_group_name_max_length', '2020-04-17 16:05:51.534845'),
(13, 'auth', '0011_update_proxy_permissions', '2020-04-17 16:05:51.592625'),
(14, 'accounts', '0001_initial', '2020-04-17 16:05:53.081254'),
(15, 'FoodShala', '0001_initial', '2020-04-17 16:06:02.891674'),
(16, 'admin', '0001_initial', '2020-04-17 16:06:04.684190'),
(17, 'admin', '0002_logentry_remove_auto_add', '2020-04-17 16:06:06.534117'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2020-04-17 16:06:06.596840'),
(19, 'sessions', '0001_initial', '2020-04-17 16:06:06.835515');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `foodshala_active_orders_details`
--

CREATE TABLE `foodshala_active_orders_details` (
  `id` int(11) NOT NULL,
  `order_by_id` int(11) NOT NULL,
  `order_by_name` varchar(50) NOT NULL,
  `food_id` int(11) NOT NULL,
  `address` longtext NOT NULL,
  `resturent` varchar(20) DEFAULT NULL,
  `food_name` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodshala_active_orders_details`
--

INSERT INTO `foodshala_active_orders_details` (`id`, `order_by_id`, `order_by_name`, `food_id`, `address`, `resturent`, `food_name`, `price`, `created_date`) VALUES
(1, 1, 'customer_demo', 1, 'hello world', 'restaurant_demo', 'chicken', 50, '2020-04-17 16:28:45.939483');

-- --------------------------------------------------------

--
-- Table structure for table `foodshala_item_details`
--

CREATE TABLE `foodshala_item_details` (
  `id` int(11) NOT NULL,
  `resto_name` varchar(50) NOT NULL,
  `name` varchar(40) NOT NULL,
  `category` varchar(40) NOT NULL,
  `tag` varchar(40) NOT NULL,
  `item_type` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodshala_item_details`
--

INSERT INTO `foodshala_item_details` (`id`, `resto_name`, `name`, `category`, `tag`, `item_type`, `image`, `price`, `created_date`, `user_id`) VALUES
(1, 'happy resto', 'chicken', 'food', 'food', 'non-veg', 'uploads/itemsimg/chicken.jpeg', 50, '2020-04-17 16:25:54.557324', 2),
(2, 'happy resto', 'pizza', 'food', 'food', 'veg', 'uploads/itemsimg/pizza.jpeg', 200, '2020-04-17 16:26:19.911264', 2),
(3, 'happy resto', 'egg roll', 'food', 'food', 'veg', 'uploads/itemsimg/aggrole.jpeg', 20, '2020-04-17 16:26:58.641600', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_customer_profile`
--
ALTER TABLE `accounts_customer_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `accounts_restaurant_profile`
--
ALTER TABLE `accounts_restaurant_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  ADD KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  ADD KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `foodshala_active_orders_details`
--
ALTER TABLE `foodshala_active_orders_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodshala_item_details`
--
ALTER TABLE `foodshala_item_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FoodShala_item_details_user_id_3ca4a576_fk_accounts_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_customer_profile`
--
ALTER TABLE `accounts_customer_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accounts_restaurant_profile`
--
ALTER TABLE `accounts_restaurant_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `foodshala_active_orders_details`
--
ALTER TABLE `foodshala_active_orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `foodshala_item_details`
--
ALTER TABLE `foodshala_item_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_customer_profile`
--
ALTER TABLE `accounts_customer_profile`
  ADD CONSTRAINT `accounts_customer_profile_user_id_68394dbc_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_restaurant_profile`
--
ALTER TABLE `accounts_restaurant_profile`
  ADD CONSTRAINT `accounts_restaurant_profile_user_id_f6869b64_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `foodshala_item_details`
--
ALTER TABLE `foodshala_item_details`
  ADD CONSTRAINT `FoodShala_item_details_user_id_3ca4a576_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
