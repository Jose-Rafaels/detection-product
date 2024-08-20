-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Aug 20, 2024 at 06:56 AM
-- Server version: 8.0.38
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `detection_product`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(36) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` int DEFAULT NULL,
  `user_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `time`, `total_price`, `user_id`) VALUES
('00a1637c-9e1e-4da5-930e-3c466fa60e16', '2024-08-19 05:24:31', 8000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('03056b3b-b937-4610-8463-2b65f72089cc', '2024-07-08 23:46:38', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('0319b335-b8b0-4989-bbbd-30c0ecdf6f4a', '2024-08-16 18:42:11', 8000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('042f36e9-935a-415e-a53a-606f514b63e2', '2024-08-20 00:19:48', 4000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('06654b89-cb4a-419a-9bb4-29410c175142', '2024-07-08 23:55:05', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('12c515d9-d6d0-45db-9751-3954eefc949e', '2024-07-07 19:01:51', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd'),
('189daa7d-1762-422a-97a0-91be857d5c68', '2024-08-16 18:20:14', 15000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('1a1f36ab-6086-4aea-befa-5dc38bf6ea9f', '2024-08-16 18:30:44', 8000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('1c2c3c9a-3909-4aea-b3f7-51392a9e145c', '2024-08-16 18:34:25', 8000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('22636a6f-a824-480a-a17d-ace050ee2eb8', '2024-08-06 09:17:59', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('2867c9d3-1f2a-4ee8-abfc-1d36041fa103', '2024-08-19 23:55:12', 9500, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('292d1e49-1c24-4e21-95c9-8ed9a452aaab', '2024-08-16 18:45:53', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('29ad18e2-e205-45db-ae79-389da9a20973', '2024-07-09 00:15:28', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('2c62d66b-707d-4e05-8e94-59136521a762', '2024-08-20 00:05:38', 15000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('2cec29eb-5b56-4b07-8916-a67ad8888377', '2024-08-19 02:00:51', 8000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('2fb85f04-f9bb-4fa3-b177-2c54c32ba063', '2024-08-19 23:58:00', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('363fa641-959c-441a-bf97-4e9214efaa28', '2024-08-16 18:47:16', 8000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('39635b62-e9d0-472d-81d1-b7ecd351c587', '2024-07-08 02:18:52', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd'),
('3d533f59-ce12-4909-aa89-51d535138119', '2024-07-08 23:44:55', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('3e93708e-f309-4180-a558-bf64af003536', '2024-07-13 22:04:24', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('4635c9ca-edaa-431b-bcd8-080899f75462', '2024-07-07 18:58:03', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd'),
('48cf1285-5a39-41f8-8926-d0dd46f7c3cc', '2024-07-06 22:15:46', 3500, '31a29201-e518-48ba-a169-e3a91f45d461'),
('4e736d81-637a-4830-978d-3c82013ba969', '2024-07-08 20:00:47', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('4f9b10c1-4a6e-4e7a-b925-3fd1a3d717e6', '2024-07-15 18:39:21', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('50f72e82-3a5d-477c-b694-5478b7e9c66b', '2024-08-06 09:14:53', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('51a05132-8f33-4280-bbd0-8bc8b2d1a5d9', '2024-07-09 16:25:16', 7300, '3ed4be29-4162-42f3-b1f3-d22cb9177e36'),
('521a131d-c920-439b-8d2a-30a01b93932f', '2024-07-08 12:58:30', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('5363858e-a664-4a3a-b913-3c57297453f1', '2024-07-08 19:22:55', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('5437a009-163a-4dd9-86fa-c0f02cff4922', '2024-08-13 06:42:13', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('54ed45ca-66da-460c-a149-70629ac9c357', '2024-08-16 18:03:31', 15000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('553cd6b6-55fd-4aed-9f25-4752913d9546', '2024-07-08 20:00:46', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('56e18ab4-dae8-472b-8064-73d0f6bd043f', '2024-07-17 15:01:47', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('56f92ed2-c585-438e-945a-59dc6d64c1a8', '2024-08-20 06:17:35', 13500, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('5a3ef879-b8fb-4012-b718-ec86f59febc2', '2024-07-07 15:39:53', 3500, '3ed4be29-4162-42f3-b1f3-d22cb9177e36'),
('5a61f559-4ff7-41f2-8af4-3120c0cdc242', '2024-07-11 14:57:47', 7300, '3ed4be29-4162-42f3-b1f3-d22cb9177e36'),
('5b5c71f1-a62b-4822-baba-e3b65e7e957a', '2024-08-19 02:01:09', 8000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('60b26ca6-822f-4f71-be94-d5da152f4abd', '2024-07-07 18:50:33', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd'),
('64305809-b3cd-426b-a657-d072b9a5fc3b', '2024-07-07 15:58:40', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd'),
('67754eb3-e3e6-4234-9f7b-0765366a33f7', '2024-07-07 15:47:56', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd'),
('6ab60068-5446-495f-a0ef-07882c1eb2c2', '2024-08-16 18:32:41', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('7016a07a-e076-402c-aa79-c44db3189a4a', '2024-08-06 09:16:11', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('72ed20e2-08ab-47f1-86ae-0db25600f64a', '2024-07-08 13:13:25', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('741e9216-aeee-4125-aa8c-59ada29f07c0', '2024-08-06 09:18:28', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('75c6fffc-a800-4ddb-bf2e-5f5ec3493795', '2024-08-06 09:17:27', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('761b3780-7e0f-4b02-9e13-bbccca603a73', '2024-07-13 22:08:28', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('78e396d5-2f04-416f-95ac-3b31790473c5', '2024-08-16 18:44:39', 15000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('7a58bdb2-3384-4f19-94c1-fddd36f173f0', '2024-07-13 21:18:52', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('7c64b227-b33d-4fee-9a80-69d9ce1054c9', '2024-08-16 17:56:19', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('802fe595-dd11-4a57-9c72-91f128cc3310', '2024-07-07 19:17:29', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd'),
('80b0d7ee-90c7-425b-9be6-c6f78e06e4d8', '2024-07-18 18:45:29', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('82f2c898-2e59-4155-a8f4-0882a1602370', '2024-07-17 14:45:39', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('8571df2d-2c40-4c78-8bf4-a997cd40972a', '2024-07-17 07:33:05', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('8671fc13-a6b8-467e-85ab-379bdc37e9f2', '2024-07-15 12:38:00', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('88b69db7-152d-4eb2-a419-296f8e783ee1', '2024-08-06 09:15:35', 15000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('8a04cf25-16d5-4b57-951a-2bc54983dfb0', '2024-07-18 17:40:01', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('8b0ea5e0-5e27-4b9e-a869-51fe8d745a14', '2024-08-16 17:53:21', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('9307e639-8ebd-4927-84c0-04207d918cd4', '2024-07-09 00:12:27', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('96039bfd-d9ba-4c27-bcbf-67d98ce4c6dc', '2024-08-06 09:20:33', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('978e8866-aec3-415c-b67e-268cb1b742a0', '2024-08-16 18:36:24', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('98de2825-7efd-464e-8a62-ab24b4305702', '2024-07-18 12:26:04', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('a5cdb393-d34a-44fe-86f2-2c4bcbf7016b', '2024-07-15 12:00:35', 8000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('a6e42600-cc40-40ad-9d4c-df8edd9ed960', '2024-07-09 00:40:38', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('a8d536b2-0b42-4ddf-b9b3-b1e42d975cdf', '2024-07-08 13:04:37', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('ac38cb67-468e-488a-855b-096c0f76871e', '2024-07-11 03:46:13', 15000, '31a29201-e518-48ba-a169-e3a91f45d461'),
('ac593b45-81c5-469a-8f9f-64e9058cd33e', '2024-08-16 18:38:12', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('af326a6f-8112-44ef-8ae8-66a479979a62', '2024-08-16 18:23:14', 15000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('b1ebfd6f-12b5-4951-9243-3d4546f97c65', '2024-08-06 09:19:33', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('b457dc25-c124-4ea5-88bd-14453fd5646f', '2024-07-09 00:05:26', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('bc93a5a1-b1e8-47a5-95cb-90928f1df9ee', '2024-07-17 10:55:38', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('bf50e576-27b6-42d0-bbd5-804271ccf7ce', '2024-07-17 21:50:28', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('c0ff0704-045f-40f6-88ee-716e28bae428', '2024-07-09 00:35:58', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('c1cda1fd-eb04-4654-ac1f-093a427f799b', '2024-08-16 18:12:50', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('c45cf8dc-ae2b-4810-98b6-9d7c95697c90', '2024-07-18 17:51:47', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('c869d8d4-04b5-498f-ba64-1c7162790bdc', '2024-07-09 16:23:43', 7300, '3ed4be29-4162-42f3-b1f3-d22cb9177e36'),
('c947d7ed-714e-44cc-a4de-a8c6f8601aa7', '2024-07-15 12:06:23', 15000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('cacf26a9-fdee-4d17-b9dd-2d36679c4bdd', '2024-07-07 16:01:52', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd'),
('cc6880fb-f354-4ac0-87e6-b12ca57b02af', '2024-07-05 19:34:43', 10800, '31a29201-e518-48ba-a169-e3a91f45d461'),
('ce4606f0-211e-4fab-b1de-a3f31033a63f', '2024-07-18 17:50:41', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('d0b38577-b6bf-4861-971e-f0ad910c65c1', '2024-07-18 07:59:36', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('d24e0b4a-106d-4381-8942-87c5f06d3ba1', '2024-07-08 23:47:20', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('d8c707a3-4c43-4b0b-83dc-54d630655027', '2024-07-07 16:06:27', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd'),
('d9e0be70-c80e-453d-bf8c-fc417a33a18e', '2024-06-27 23:27:20', 13500, '31a29201-e518-48ba-a169-e3a91f45d461'),
('dada1b85-b816-4527-8b84-f12a7b4c36e3', '2024-07-09 00:38:12', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('dd8f8a4f-65f4-476c-8aa3-7e6403ab3b13', '2024-08-20 00:14:03', 3500, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('e3c142c6-1b8a-40e3-bcf4-4e5f486b59bb', '2024-07-17 07:36:52', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('e82132a4-44cb-441b-820e-7c95a423f546', '2024-08-19 06:07:03', 8000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('e8acf4af-4867-4380-b36f-d75c01dc5aa6', '2024-08-16 18:27:12', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('f00a8479-a6bc-4cf1-b7f4-26fd0391e5f2', '2024-08-16 18:49:06', 8000, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('f644a0ac-922e-42a5-b040-c4f91ed20aae', '2024-07-08 13:10:26', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('f8a15c51-922a-411b-9b12-fa413705f13b', '2024-07-07 16:00:26', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd'),
('f8ec7425-ed10-40ac-8bca-d80f54c72f65', '2024-07-08 16:01:19', 18600, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('fa693853-eac4-479e-9e05-9ba752548f8e', '2024-07-08 20:01:42', 7300, 'c815b1ff-b2d9-45c6-9091-eca5414ce95c'),
('fd1fa461-e64f-4497-b85e-afff17ff4b23', '2024-07-07 14:25:59', 7300, 'bb081ace-e24a-4019-8132-3c67278cfedd');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` varchar(36) DEFAULT NULL,
  `product_id` varchar(36) NOT NULL,
  `qty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `qty`) VALUES
('d9e0be70-c80e-453d-bf8c-fc417a33a18e', '58bf5e4b-c247-42e9-a4cb-52f0458726fb', 1),
('d9e0be70-c80e-453d-bf8c-fc417a33a18e', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('cc6880fb-f354-4ac0-87e6-b12ca57b02af', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('cc6880fb-f354-4ac0-87e6-b12ca57b02af', 'e4c473fb-b601-4cf5-a09a-8eb4acc1592b', 1),
('48cf1285-5a39-41f8-8926-d0dd46f7c3cc', 'e4c473fb-b601-4cf5-a09a-8eb4acc1592b', 1),
('fd1fa461-e64f-4497-b85e-afff17ff4b23', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('5a3ef879-b8fb-4012-b718-ec86f59febc2', 'e4c473fb-b601-4cf5-a09a-8eb4acc1592b', 1),
('67754eb3-e3e6-4234-9f7b-0765366a33f7', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('64305809-b3cd-426b-a657-d072b9a5fc3b', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('f8a15c51-922a-411b-9b12-fa413705f13b', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('cacf26a9-fdee-4d17-b9dd-2d36679c4bdd', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('d8c707a3-4c43-4b0b-83dc-54d630655027', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('60b26ca6-822f-4f71-be94-d5da152f4abd', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('4635c9ca-edaa-431b-bcd8-080899f75462', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('12c515d9-d6d0-45db-9751-3954eefc949e', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('802fe595-dd11-4a57-9c72-91f128cc3310', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('39635b62-e9d0-472d-81d1-b7ecd351c587', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('521a131d-c920-439b-8d2a-30a01b93932f', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('521a131d-c920-439b-8d2a-30a01b93932f', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('a8d536b2-0b42-4ddf-b9b3-b1e42d975cdf', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('f644a0ac-922e-42a5-b040-c4f91ed20aae', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('72ed20e2-08ab-47f1-86ae-0db25600f64a', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('f8ec7425-ed10-40ac-8bca-d80f54c72f65', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('f8ec7425-ed10-40ac-8bca-d80f54c72f65', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('5363858e-a664-4a3a-b913-3c57297453f1', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('553cd6b6-55fd-4aed-9f25-4752913d9546', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('4e736d81-637a-4830-978d-3c82013ba969', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('fa693853-eac4-479e-9e05-9ba752548f8e', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('3d533f59-ce12-4909-aa89-51d535138119', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('03056b3b-b937-4610-8463-2b65f72089cc', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('d24e0b4a-106d-4381-8942-87c5f06d3ba1', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('06654b89-cb4a-419a-9bb4-29410c175142', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('b457dc25-c124-4ea5-88bd-14453fd5646f', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('9307e639-8ebd-4927-84c0-04207d918cd4', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('29ad18e2-e205-45db-ae79-389da9a20973', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('c0ff0704-045f-40f6-88ee-716e28bae428', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('dada1b85-b816-4527-8b84-f12a7b4c36e3', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('a6e42600-cc40-40ad-9d4c-df8edd9ed960', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('c869d8d4-04b5-498f-ba64-1c7162790bdc', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('51a05132-8f33-4280-bbd0-8bc8b2d1a5d9', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('ac38cb67-468e-488a-855b-096c0f76871e', 'bf61860d-e04e-43a4-aae9-b04abccede6e', 1),
('5a61f559-4ff7-41f2-8af4-3120c0cdc242', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('7a58bdb2-3384-4f19-94c1-fddd36f173f0', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('3e93708e-f309-4180-a558-bf64af003536', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('761b3780-7e0f-4b02-9e13-bbccca603a73', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('4f9b10c1-4a6e-4e7a-b925-3fd1a3d717e6', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('a5cdb393-d34a-44fe-86f2-2c4bcbf7016b', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 2),
('c947d7ed-714e-44cc-a4de-a8c6f8601aa7', 'bf61860d-e04e-43a4-aae9-b04abccede6e', 1),
('8671fc13-a6b8-467e-85ab-379bdc37e9f2', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('8571df2d-2c40-4c78-8bf4-a997cd40972a', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('e3c142c6-1b8a-40e3-bcf4-4e5f486b59bb', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('bc93a5a1-b1e8-47a5-95cb-90928f1df9ee', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('82f2c898-2e59-4155-a8f4-0882a1602370', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('56e18ab4-dae8-472b-8064-73d0f6bd043f', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('bf50e576-27b6-42d0-bbd5-804271ccf7ce', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('d0b38577-b6bf-4861-971e-f0ad910c65c1', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('98de2825-7efd-464e-8a62-ab24b4305702', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('8a04cf25-16d5-4b57-951a-2bc54983dfb0', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('ce4606f0-211e-4fab-b1de-a3f31033a63f', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('c45cf8dc-ae2b-4810-98b6-9d7c95697c90', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('80b0d7ee-90c7-425b-9be6-c6f78e06e4d8', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('50f72e82-3a5d-477c-b694-5478b7e9c66b', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('88b69db7-152d-4eb2-a419-296f8e783ee1', 'bf61860d-e04e-43a4-aae9-b04abccede6e', 1),
('7016a07a-e076-402c-aa79-c44db3189a4a', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('7016a07a-e076-402c-aa79-c44db3189a4a', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('75c6fffc-a800-4ddb-bf2e-5f5ec3493795', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('22636a6f-a824-480a-a17d-ace050ee2eb8', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('22636a6f-a824-480a-a17d-ace050ee2eb8', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('741e9216-aeee-4125-aa8c-59ada29f07c0', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('b1ebfd6f-12b5-4951-9243-3d4546f97c65', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('96039bfd-d9ba-4c27-bcbf-67d98ce4c6dc', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('5437a009-163a-4dd9-86fa-c0f02cff4922', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('5437a009-163a-4dd9-86fa-c0f02cff4922', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('8b0ea5e0-5e27-4b9e-a869-51fe8d745a14', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('8b0ea5e0-5e27-4b9e-a869-51fe8d745a14', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('7c64b227-b33d-4fee-9a80-69d9ce1054c9', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('7c64b227-b33d-4fee-9a80-69d9ce1054c9', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('54ed45ca-66da-460c-a149-70629ac9c357', 'bf61860d-e04e-43a4-aae9-b04abccede6e', 1),
('c1cda1fd-eb04-4654-ac1f-093a427f799b', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('c1cda1fd-eb04-4654-ac1f-093a427f799b', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('189daa7d-1762-422a-97a0-91be857d5c68', 'bf61860d-e04e-43a4-aae9-b04abccede6e', 1),
('af326a6f-8112-44ef-8ae8-66a479979a62', 'bf61860d-e04e-43a4-aae9-b04abccede6e', 1),
('e8acf4af-4867-4380-b36f-d75c01dc5aa6', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('e8acf4af-4867-4380-b36f-d75c01dc5aa6', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('1a1f36ab-6086-4aea-befa-5dc38bf6ea9f', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 2),
('6ab60068-5446-495f-a0ef-07882c1eb2c2', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('6ab60068-5446-495f-a0ef-07882c1eb2c2', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('1c2c3c9a-3909-4aea-b3f7-51392a9e145c', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 2),
('978e8866-aec3-415c-b67e-268cb1b742a0', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('ac593b45-81c5-469a-8f9f-64e9058cd33e', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('ac593b45-81c5-469a-8f9f-64e9058cd33e', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('0319b335-b8b0-4989-bbbd-30c0ecdf6f4a', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 2),
('78e396d5-2f04-416f-95ac-3b31790473c5', 'bf61860d-e04e-43a4-aae9-b04abccede6e', 1),
('292d1e49-1c24-4e21-95c9-8ed9a452aaab', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('292d1e49-1c24-4e21-95c9-8ed9a452aaab', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 2),
('363fa641-959c-441a-bf97-4e9214efaa28', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 2),
('f00a8479-a6bc-4cf1-b7f4-26fd0391e5f2', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 2),
('2cec29eb-5b56-4b07-8916-a67ad8888377', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 2),
('5b5c71f1-a62b-4822-baba-e3b65e7e957a', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 2),
('00a1637c-9e1e-4da5-930e-3c466fa60e16', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 2),
('e82132a4-44cb-441b-820e-7c95a423f546', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 2),
('2867c9d3-1f2a-4ee8-abfc-1d36041fa103', '58bf5e4b-c247-42e9-a4cb-52f0458726fb', 1),
('2fb85f04-f9bb-4fa3-b177-2c54c32ba063', 'b913b5dc-a7ac-4c6e-ad23-009425b73166', 1),
('2c62d66b-707d-4e05-8e94-59136521a762', 'bf61860d-e04e-43a4-aae9-b04abccede6e', 1),
('dd8f8a4f-65f4-476c-8aa3-7e6403ab3b13', 'e4c473fb-b601-4cf5-a09a-8eb4acc1592b', 1),
('042f36e9-935a-415e-a53a-606f514b63e2', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('56f92ed2-c585-438e-945a-59dc6d64c1a8', '9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 1),
('56f92ed2-c585-438e-945a-59dc6d64c1a8', '58bf5e4b-c247-42e9-a4cb-52f0458726fb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `order_id` varchar(36) DEFAULT NULL,
  `payment_method` varchar(36) NOT NULL,
  `payment_status` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`order_id`, `payment_method`, `payment_status`) VALUES
('d9e0be70-c80e-453d-bf8c-fc417a33a18e', 'Credit Card', 'Completed'),
('cc6880fb-f354-4ac0-87e6-b12ca57b02af', 'Credit Card', 'Completed'),
('802fe595-dd11-4a57-9c72-91f128cc3310', 'Pembayaran Tunai', 'completed'),
('521a131d-c920-439b-8d2a-30a01b93932f', 'Pembayaran Tunai', 'completed'),
('a8d536b2-0b42-4ddf-b9b3-b1e42d975cdf', 'Pembayaran Tunai', 'completed'),
('f644a0ac-922e-42a5-b040-c4f91ed20aae', 'Pembayaran Tunai', 'completed'),
('72ed20e2-08ab-47f1-86ae-0db25600f64a', 'Pembayaran Tunai', 'completed'),
('5363858e-a664-4a3a-b913-3c57297453f1', 'Pembayaran Non-Tunai', 'completed'),
('5363858e-a664-4a3a-b913-3c57297453f1', 'Pembayaran Non-Tunai', 'completed'),
('fa693853-eac4-479e-9e05-9ba752548f8e', 'Pembayaran Non-Tunai', 'completed'),
('fa693853-eac4-479e-9e05-9ba752548f8e', 'Pembayaran Non-Tunai', 'completed'),
('3d533f59-ce12-4909-aa89-51d535138119', 'Pembayaran Tunai', 'completed'),
('d24e0b4a-106d-4381-8942-87c5f06d3ba1', 'Pembayaran Tunai', 'completed'),
('06654b89-cb4a-419a-9bb4-29410c175142', 'Pembayaran Tunai', 'completed'),
('b457dc25-c124-4ea5-88bd-14453fd5646f', 'Pembayaran Tunai', 'completed'),
('9307e639-8ebd-4927-84c0-04207d918cd4', 'Pembayaran Tunai', 'completed'),
('29ad18e2-e205-45db-ae79-389da9a20973', 'Pembayaran Tunai', 'completed'),
('dada1b85-b816-4527-8b84-f12a7b4c36e3', 'Pembayaran Tunai', 'completed'),
('a6e42600-cc40-40ad-9d4c-df8edd9ed960', 'Pembayaran Tunai', 'completed'),
('51a05132-8f33-4280-bbd0-8bc8b2d1a5d9', 'Pembayaran Non-Tunai', 'completed'),
('64305809-b3cd-426b-a657-d072b9a5fc3b', 'BCA', 'completed'),
('4f9b10c1-4a6e-4e7a-b925-3fd1a3d717e6', 'Pembayaran Tunai', 'completed'),
('a5cdb393-d34a-44fe-86f2-2c4bcbf7016b', 'Pembayaran Tunai', 'completed'),
('c947d7ed-714e-44cc-a4de-a8c6f8601aa7', 'Pembayaran Tunai', 'completed'),
('8671fc13-a6b8-467e-85ab-379bdc37e9f2', 'Pembayaran Tunai', 'completed'),
('8571df2d-2c40-4c78-8bf4-a997cd40972a', 'Pembayaran Non-Tunai', 'completed'),
('98de2825-7efd-464e-8a62-ab24b4305702', 'Pembayaran Non-Tunai', 'completed'),
('50f72e82-3a5d-477c-b694-5478b7e9c66b', 'Pembayaran Tunai', 'completed'),
('88b69db7-152d-4eb2-a419-296f8e783ee1', 'Pembayaran Tunai', 'completed'),
('7016a07a-e076-402c-aa79-c44db3189a4a', 'Pembayaran Tunai', 'completed'),
('75c6fffc-a800-4ddb-bf2e-5f5ec3493795', 'Pembayaran Tunai', 'completed'),
('22636a6f-a824-480a-a17d-ace050ee2eb8', 'Pembayaran Tunai', 'completed'),
('741e9216-aeee-4125-aa8c-59ada29f07c0', 'Pembayaran Tunai', 'completed'),
('b1ebfd6f-12b5-4951-9243-3d4546f97c65', 'Pembayaran Tunai', 'completed'),
('96039bfd-d9ba-4c27-bcbf-67d98ce4c6dc', 'Pembayaran Tunai', 'completed'),
('5437a009-163a-4dd9-86fa-c0f02cff4922', 'Pembayaran Non-Tunai', 'settlement'),
('54ed45ca-66da-460c-a149-70629ac9c357', 'Pembayaran Tunai', 'completed'),
('ac593b45-81c5-469a-8f9f-64e9058cd33e', 'Pembayaran Tunai', 'completed'),
('56f92ed2-c585-438e-945a-59dc6d64c1a8', 'Pembayaran Non-Tunai', 'expire');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` varchar(36) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`) VALUES
('58bf5e4b-c247-42e9-a4cb-52f0458726fb', 'Wafer Nabati Coklat 122 gr', 9500),
('9e9f391b-3234-437b-8b36-0b8b2aaf7d0e', 'Air Mineral Aqua 600 ml', 4000),
('b913b5dc-a7ac-4c6e-ad23-009425b73166', 'Biskuit Oreo Ice Cream 137 gr', 7300),
('bf61860d-e04e-43a4-aae9-b04abccede6e', 'Sarden ABC Tomat 250 gr', 15000),
('e4c473fb-b601-4cf5-a09a-8eb4acc1592b', 'Mie Indomie Goreng 85 gr', 3500);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(36) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `role` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `password` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `username`, `role`, `password`) VALUES
('29de4ad4-ac0e-4462-8f6d-46402425bd58', 'Jose', 'Jose', 'user', '$2b$12$EfqjWIU/wxr9IQ9vu9VYleCZck1VdPG5MqJeFq.fihoDk1cyZzwHC'),
('29dfb69f-b06e-4cd3-9bc2-0acb4ef8f734', 'testing', 'testing', 'user', '$2b$12$9OzXOBxrgiJ0sosPhQsAN.pqQwqIx7i6rverOdfcyl1qcwZtsnidG'),
('31a29201-e518-48ba-a169-e3a91f45d461', '', 'test', '', '$2b$12$dvNpE.VPds3qAM9vXYVZYuktj5LLqZmwqbvL9/cUVCrpsohCIC.1O'),
('3ed4be29-4162-42f3-b1f3-d22cb9177e36', 'Johannes', 'Johannes', 'user', '$2b$12$C3bUHsJVy6AVjXsuL9MaJul7NolYgbncA3KrQSRx/gSWGtcrxRyly'),
('bb081ace-e24a-4019-8132-3c67278cfedd', 'Admin', 'Admin', 'admin', '$2a$12$ZA3YsHGSBovVO/kpY32ziezKIgYVqjh8PPFMgFp6gZchqonsJdUH.'),
('c815b1ff-b2d9-45c6-9091-eca5414ce95c', '123', 'Grace', 'user', '$2b$12$URsMAmewgSadjARLuX3JmeEkEq3wL7y.bIJ0dJrg5kTQAsRLcgDpm'),
('e656d20b-1c12-446f-b152-5849c28bf8d6', 'Trisna', 'Trisna', 'user', '$2b$12$02M0ASDZmz9D5MsKClwkQe9rC5BQCQrSAkLdFxLnSKQWmTqmJbpTW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `transaction_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `transaction_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
