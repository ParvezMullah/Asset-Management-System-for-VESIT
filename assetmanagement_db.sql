-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2018 at 02:07 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assetmanagement_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetrequestprocessing_assetrequest`
--

CREATE TABLE `assetrequestprocessing_assetrequest` (
  `id` int(11) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `quantity_required` int(11) NOT NULL,
  `expected_date` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `role` varchar(40) NOT NULL,
  `last_updated_by_role` varchar(30) NOT NULL,
  `requesting_date` date NOT NULL,
  `last_update` date NOT NULL,
  `asset_name_id` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assetrequestprocessing_assetrequest`
--

INSERT INTO `assetrequestprocessing_assetrequest` (`id`, `email`, `quantity_required`, `expected_date`, `status`, `role`, `last_updated_by_role`, `requesting_date`, `last_update`, `asset_name_id`, `department`) VALUES
(1, 'a@a.com', 5, '2018-12-10', 'Requested', 'Student', 'Student', '2018-09-24', '2018-09-24', 'Computer', 'MCA'),
(2, 'a@a.com', 7, '2018-12-10', 'approved', 'Student', 'Principal Office', '2018-09-24', '2018-09-24', 'Chalk', 'MCA'),
(3, 'digvijay@gmail.com', 5, '2018-05-12', 'Requested', 'Student', 'Student', '2018-09-24', '2018-09-24', 'Chalk', 'IT'),
(4, 'digvijay@gmail.com', 5, '2018-05-12', 'Requested', 'Student', 'Student', '2018-09-24', '2018-09-24', 'Chalk', 'IT'),
(5, 'digvijay@gmail.com', 5, '2018-05-12', 'approved', 'Student', 'Principal Office', '2018-09-24', '2018-09-24', 'Chalk', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `assets_assetpurchase`
--

CREATE TABLE `assets_assetpurchase` (
  `id` int(11) NOT NULL,
  `asset_quantity` int(11) NOT NULL,
  `date_purchased` date NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `total_price` int(11) NOT NULL,
  `asset_name_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assets_assetpurchase`
--

INSERT INTO `assets_assetpurchase` (`id`, `asset_quantity`, `date_purchased`, `date_added`, `total_price`, `asset_name_id`) VALUES
(1, 5, '2018-09-24', '2018-09-23 22:31:08.114209', 200, 'Chalk'),
(2, 5, '2018-09-24', '2018-09-23 22:31:19.495823', 50000, 'Computer');

-- --------------------------------------------------------

--
-- Table structure for table `assets_assets`
--

CREATE TABLE `assets_assets` (
  `asset_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assets_assets`
--

INSERT INTO `assets_assets` (`asset_name`) VALUES
('Chalk'),
('Computer');

-- --------------------------------------------------------

--
-- Table structure for table `assets_assetstock`
--

CREATE TABLE `assets_assetstock` (
  `asset_name_id` varchar(30) NOT NULL,
  `asset_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assets_assetstock`
--

INSERT INTO `assets_assetstock` (`asset_name_id`, `asset_quantity`) VALUES
('Chalk', 5),
('Computer', 5);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add content type', 3, 'add_contenttype'),
(8, 'Can change content type', 3, 'change_contenttype'),
(9, 'Can delete content type', 3, 'delete_contenttype'),
(10, 'Can add user', 4, 'add_customuser'),
(11, 'Can change user', 4, 'change_customuser'),
(12, 'Can delete user', 4, 'delete_customuser'),
(13, 'Can add asset purchase', 5, 'add_assetpurchase'),
(14, 'Can change asset purchase', 5, 'change_assetpurchase'),
(15, 'Can delete asset purchase', 5, 'delete_assetpurchase'),
(16, 'Can add assets', 6, 'add_assets'),
(17, 'Can change assets', 6, 'change_assets'),
(18, 'Can delete assets', 6, 'delete_assets'),
(19, 'Can add asset stock', 7, 'add_assetstock'),
(20, 'Can change asset stock', 7, 'change_assetstock'),
(21, 'Can delete asset stock', 7, 'delete_assetstock'),
(22, 'Can add asset request', 8, 'add_assetrequest'),
(23, 'Can change asset request', 8, 'change_assetrequest'),
(24, 'Can delete asset request', 8, 'delete_assetrequest'),
(25, 'Can add log entry', 9, 'add_logentry'),
(26, 'Can change log entry', 9, 'change_logentry'),
(27, 'Can delete log entry', 9, 'delete_logentry'),
(28, 'Can add session', 10, 'add_session'),
(29, 'Can change session', 10, 'change_session'),
(30, 'Can delete session', 10, 'delete_session');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-09-23 22:30:48.491752', 'Chalk', 'Chalk', 1, '[{"added": {}}]', 6, 1),
(2, '2018-09-23 22:30:54.315650', 'Computer', 'Computer', 1, '[{"added": {}}]', 6, 1),
(3, '2018-09-23 22:31:08.122209', '1', 'AssetPurchase object (1)', 1, '[{"added": {}}]', 5, 1),
(4, '2018-09-23 22:31:19.496823', '2', 'AssetPurchase object (2)', 1, '[{"added": {}}]', 5, 1),
(5, '2018-09-23 22:32:38.104155', '2', 'parvez@gmail.com', 1, '[{"added": {}}]', 4, 1),
(6, '2018-09-23 22:36:27.667389', '3', 'preeti@gmail.com', 1, '[{"added": {}}]', 4, 1),
(7, '2018-09-23 22:37:13.322106', '4', 'mehul@gmail.com', 1, '[{"added": {}}]', 4, 1),
(8, '2018-09-23 22:38:06.765587', '5', 'saad@gmail.com', 1, '[{"added": {}}]', 4, 1),
(9, '2018-09-23 22:43:39.941216', '1', 'a@a.com', 2, '[{"changed": {"fields": ["first_name", "last_name", "role", "department"]}}]', 4, 1),
(10, '2018-09-23 22:55:08.888480', '6', 'digvijay@gmail.com', 1, '[{"added": {}}]', 4, 1),
(11, '2018-09-23 22:55:58.077741', '6', 'digvijay@gmail.com', 2, '[{"changed": {"fields": ["password"]}}]', 4, 1),
(12, '2018-09-23 22:59:36.245147', '5', 'saad@gmail.com', 2, '[]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(9, 'admin', 'logentry'),
(8, 'assetrequestprocessing', 'assetrequest'),
(5, 'assets', 'assetpurchase'),
(6, 'assets', 'assets'),
(7, 'assets', 'assetstock'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'contenttypes', 'contenttype'),
(10, 'sessions', 'session'),
(4, 'users', 'customuser');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-09-23 22:21:24.517460'),
(2, 'contenttypes', '0002_remove_content_type_name', '2018-09-23 22:21:25.400871'),
(3, 'auth', '0001_initial', '2018-09-23 22:21:28.833799'),
(4, 'auth', '0002_alter_permission_name_max_length', '2018-09-23 22:21:29.473517'),
(5, 'auth', '0003_alter_user_email_max_length', '2018-09-23 22:21:29.519626'),
(6, 'auth', '0004_alter_user_username_opts', '2018-09-23 22:21:29.561788'),
(7, 'auth', '0005_alter_user_last_login_null', '2018-09-23 22:21:29.596869'),
(8, 'auth', '0006_require_contenttypes_0002', '2018-09-23 22:21:29.622012'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2018-09-23 22:21:29.663816'),
(10, 'auth', '0008_alter_user_username_max_length', '2018-09-23 22:21:29.696196'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2018-09-23 22:21:29.730713'),
(12, 'users', '0001_initial', '2018-09-23 22:21:35.784918'),
(13, 'assets', '0001_initial', '2018-09-23 22:21:38.458750'),
(14, 'assetrequestprocessing', '0001_initial', '2018-09-23 22:21:40.383245'),
(15, 'admin', '0001_initial', '2018-09-23 22:22:11.579927'),
(16, 'admin', '0002_logentry_remove_auto_add', '2018-09-23 22:22:11.616840'),
(17, 'sessions', '0001_initial', '2018-09-23 22:22:12.298050'),
(18, 'assetrequestprocessing', '0002_remove_assetrequest_l', '2018-09-23 22:30:20.190487'),
(19, 'users', '0002_auto_20180924_0405', '2018-09-23 22:35:57.568979'),
(20, 'users', '0003_auto_20180924_0413', '2018-09-23 22:43:29.685812');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('e0cdcj20485hloanstq2lzcp5kfrlhuh', 'Y2ZkYjkxM2EyMTY2ZDc2Y2UzYjdhNGE3MTAyZThhNDNhYzY1NGE5Njp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMmE0MWE3NjEwYmM4ODE0MGJhZDAzYjEzZTNjZDVlMDFmMjVkZmEzIn0=', '2018-10-08 00:03:48.446072');

-- --------------------------------------------------------

--
-- Table structure for table `users_customuser`
--

CREATE TABLE `users_customuser` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_customuser`
--

INSERT INTO `users_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `mobile`, `role`, `department`) VALUES
(1, 'pbkdf2_sha256$100000$cIQDDfohhL8V$HgUSzCu0YTL8y8kp10VhypuxNV/IBGPz2ra9zeiaWkI=', '2018-09-24 00:01:30.001132', 1, 'parvez', 'Parvez', 'Mullah', 1, 1, '2018-09-23 22:28:55.000000', 'a@a.com', '8888888888', 'Student', 'MCA'),
(2, 'pbkdf2_sha256$100000$cIQDDfohhL8V$HgUSzCu0YTL8y8kp10VhypuxNV/IBGPz2ra9zeiaWkI=', NULL, 0, 'parry', 'Parvez', 'Mullah', 0, 1, '2018-09-23 22:31:55.000000', 'parvez@gmail.com', '8898029645', 'Student', 'MCA'),
(3, 'pbkdf2_sha256$100000$cIQDDfohhL8V$HgUSzCu0YTL8y8kp10VhypuxNV/IBGPz2ra9zeiaWkI=', '2018-09-24 00:03:48.362468', 0, 'preeti', 'Preeti', 'Singh', 0, 1, '2018-09-23 22:36:11.000000', 'preeti@gmail.com', '8989899999', 'Purchase Officer', 'MCA'),
(4, 'pbkdf2_sha256$100000$cIQDDfohhL8V$HgUSzCu0YTL8y8kp10VhypuxNV/IBGPz2ra9zeiaWkI=', '2018-09-23 23:42:36.057175', 0, 'mehul', 'Mehul', 't', 0, 1, '2018-09-23 22:36:40.000000', 'mehul@gmail.com', '8898029645', 'Principal Office', NULL),
(5, 'pbkdf2_sha256$100000$cIQDDfohhL8V$HgUSzCu0YTL8y8kp10VhypuxNV/IBGPz2ra9zeiaWkI=', '2018-09-23 23:43:07.824450', 0, 'saad', 'Saad', 'Shaikh', 0, 1, '2018-09-23 22:37:26.000000', 'saad@gmail.com', '8898029645', 'Store Manager', NULL),
(6, 'pbkdf2_sha256$100000$cIQDDfohhL8V$HgUSzCu0YTL8y8kp10VhypuxNV/IBGPz2ra9zeiaWkI=', '2018-09-23 23:02:10.357699', 0, 'digvijay', 'Digvijay', '', 0, 1, '2018-09-23 22:54:27.000000', 'digvijay@gmail.com', '8898029645', 'Student', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `users_customuser_groups`
--

CREATE TABLE `users_customuser_groups` (
  `id` int(11) NOT NULL,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_customuser_user_permissions`
--

CREATE TABLE `users_customuser_user_permissions` (
  `id` int(11) NOT NULL,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetrequestprocessing_assetrequest`
--
ALTER TABLE `assetrequestprocessing_assetrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetrequestprocessi_asset_name_id_3f39dc61_fk_assets_as` (`asset_name_id`);

--
-- Indexes for table `assets_assetpurchase`
--
ALTER TABLE `assets_assetpurchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_assetpurchase_asset_name_id_0a70a4bb_fk_assets_as` (`asset_name_id`);

--
-- Indexes for table `assets_assets`
--
ALTER TABLE `assets_assets`
  ADD PRIMARY KEY (`asset_name`);

--
-- Indexes for table `assets_assetstock`
--
ALTER TABLE `assets_assetstock`
  ADD PRIMARY KEY (`asset_name_id`);

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
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`);

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
-- Indexes for table `users_customuser`
--
ALTER TABLE `users_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_customuser_groups`
--
ALTER TABLE `users_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  ADD KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `users_customuser_user_permissions`
--
ALTER TABLE `users_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetrequestprocessing_assetrequest`
--
ALTER TABLE `assetrequestprocessing_assetrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `assets_assetpurchase`
--
ALTER TABLE `assets_assetpurchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `users_customuser`
--
ALTER TABLE `users_customuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users_customuser_groups`
--
ALTER TABLE `users_customuser_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_customuser_user_permissions`
--
ALTER TABLE `users_customuser_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetrequestprocessing_assetrequest`
--
ALTER TABLE `assetrequestprocessing_assetrequest`
  ADD CONSTRAINT `assetrequestprocessi_asset_name_id_3f39dc61_fk_assets_as` FOREIGN KEY (`asset_name_id`) REFERENCES `assets_assets` (`asset_name`);

--
-- Constraints for table `assets_assetpurchase`
--
ALTER TABLE `assets_assetpurchase`
  ADD CONSTRAINT `assets_assetpurchase_asset_name_id_0a70a4bb_fk_assets_as` FOREIGN KEY (`asset_name_id`) REFERENCES `assets_assets` (`asset_name`);

--
-- Constraints for table `assets_assetstock`
--
ALTER TABLE `assets_assetstock`
  ADD CONSTRAINT `assets_assetstock_asset_name_id_86d4fef2_fk_assets_as` FOREIGN KEY (`asset_name_id`) REFERENCES `assets_assets` (`asset_name`);

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
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`);

--
-- Constraints for table `users_customuser_groups`
--
ALTER TABLE `users_customuser_groups`
  ADD CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  ADD CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `users_customuser_user_permissions`
--
ALTER TABLE `users_customuser_user_permissions`
  ADD CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  ADD CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
