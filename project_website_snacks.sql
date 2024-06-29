-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 19, 2024 lúc 10:31 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project_website_snacks`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'profile.jpg',
  `email` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `id_role` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `fullname`, `avatar`, `email`, `address`, `tel`, `id_role`) VALUES
(3, 'Oaiker123', '123456', 'Trần Bá Oai', '26229821_1856227864677528_6882526283385183553_n.jpg', 'oaitbph36440@fpt.edu.vn', 'Đơn nguyên 5 ký túc xá Mỹ Đình, Phố Nguyễn Cơ Thạch, Từ Liêm, Hà Nội', '0353712030', 0),
(29, 'user123', '123456', 'Trần Bá Oai', '26229821_1856227864677528_6882526283385183553_n.jpg', 'tranbaoai2004@gmail.com', '16/149,Phương Canh,Hà Nội', '0353712030', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_product_variants` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `id_product_variants`, `id_account`, `quantity`) VALUES
(19, 16, 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name_category` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name_category`, `image`) VALUES
(1, 'Burger', 'burger_cate.png'),
(2, 'Combo', 'combo_cate.png'),
(3, 'Gà rán', 'chicken_fried_cate.png'),
(4, 'Mỳ Ý', 'pasta_cate.png'),
(5, 'Khoai tây', 'potato_fried_cate.png'),
(6, 'Thức uống', 'drinks_cate.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `id_account` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_codes`
--

CREATE TABLE `discount_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `expiration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `discount_codes`
--

INSERT INTO `discount_codes` (`id`, `code`, `discount`, `quantity`, `expiration_date`) VALUES
(20, 'FOOD', 20, 100, '2024-03-30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `id_status` int(11) DEFAULT 1,
  `id_account` int(11) NOT NULL DEFAULT 1,
  `notes` text NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_date`, `id_status`, `id_account`, `notes`, `fullname`, `email`, `tel`, `address`) VALUES
(26, '2024-03-14', 5, 29, '', 'Trần Bá Oai', 'tranbaoai2004@gmail.com', '0396336296', '124/49 Hòe Thị');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL DEFAULT 1,
  `id_product_variants` int(11) NOT NULL DEFAULT 1,
  `quantity` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `id_order`, `id_product_variants`, `quantity`, `discount`, `total_amount`) VALUES
(29, 26, 17, 1, 20, 72000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(0, 'Chờ xác nhận'),
(1, 'Đã xác nhận'),
(2, 'Đang đóng gói'),
(3, 'Đang giao hàng'),
(4, 'Đã giao hàng'),
(5, 'Đã hủy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `description`, `id_category`) VALUES
(1, 'BURGER GÀ GIÒN CAY', 'BURGER GÀ GIÒN CAY.png', 'Burger Gà Giòn Cay', 1),
(2, 'GÀ BBQ (1 miếng)', 'GÀ BBQ (1 miếng) .png', 'Gà BBQ (1 miếng)', 3),
(3, 'GÀ GIÒN CRISPY ', 'GÀ GIÒN CRISPY .png', 'Gà Giòn Crispy', 3),
(4, 'Mix Wing 6pcs ', 'Mix Wing 6pcs .png', 'Mix Wing 6pcs', 3),
(5, 'Mix Wing 4pcs ', 'Mix Wing 4pcs .png', 'Mix Wing 4pcs', 3),
(6, 'BURGER CÁ', 'BURGER CÁ.png', 'Burger Cá', 1),
(7, 'BURGER BÒ NƯỚNG HÀNH CHIÊN ', 'BURGER BÒ NƯỚNG HÀNH CHIÊN .png', 'Burger Bò Nướng Hành Chiên', 1),
(8, 'BURGER BÒ NƯỚNG WHOPPER JR ', 'BURGER BÒ NƯỚNG WHOPPER JR .png', 'Burger Bò Nướng Whopper Jr', 1),
(9, 'BURGER GÀ NƯỚNG ', 'BURGER GÀ NƯỚNG .png', 'Burger Gà Nướng', 1),
(10, 'BURGER BÒ TẮM PHÔ MAI', 'BURGER BÒ TẮM PHÔ MAI.png', 'Burger Bò Tắm Phô Mai', 1),
(11, 'BURGER BÒ THỊT HEO XÔNG KHÓI ', 'BURGER BÒ THỊT HEO XÔNG KHÓI .png', 'Burger Bò Thịt Heo Xông Khói', 1),
(12, 'COMBO BURGER CÁ ', 'COMBO BURGER CÁ .png', '1 Burger Cá + 1 Khoai Tây Chiên + 1 Nước ngọt', 2),
(13, 'COMBO BURGER GÀ PHÔ MAI SỐT BBQ ', 'COMBO BURGER GÀ PHÔ MAI SỐT BBQ .png', '1 Burger Gà Phô Mai Sốt BBQ + 1 Khoai tây chiên + 1 Nước ngọt', 2),
(14, 'COMBO BURGER BÒ NƯỚNG HÀNH CHIÊN ', 'COMBO BURGER BÒ NƯỚNG HÀNH CHIÊN .png', '1 Burger Bò Nướng Hành Chiên + 1 Khoai Tây Chiên + 1 Nước ngọt', 2),
(15, 'COMBO BURGER BÒ PHÔ MAI ', 'COMBO BURGER BÒ PHÔ MAI .png', '1 Burger Bò Phô Mai + 1 Khoai Tây Chiên + 1 Nước ngọt', 2),
(16, 'COMBO BURGER BÒ NƯỚNG WHOPPER JR', 'COMBO BURGER BÒ NƯỚNG WHOPPER JR. .png', '1 Burger Bò Nướng Whopper Jr + 1 Khoai Tây Chiên + 1 Nước ngọt.', 2),
(17, 'COMBO BURGER GÀ GIÒN CAY ', 'COMBO BURGER GÀ GIÒN CAY .png', '1 Burger Gà Giòn Cay + 1 Khoai Tây Chiên + 1 Nước ngọt', 2),
(18, 'MILO', 'MILO.png', 'MILO', 6),
(19, 'DASANI', 'DASANI.png', 'DASANI', 6),
(20, 'NESTEA', 'NESTEA.png', 'NESTEA', 6),
(21, 'FANTA', 'FANTA.png', 'FANTA', 6),
(22, 'COCACOLA', 'COCACOLA.png', 'COCACOLA', 6),
(23, 'PEPSI', 'PEPSI.png', 'PEPSI', 6),
(24, 'KHOAI TÂY CHIÊN', 'KHOAI TÂY CHIÊN.png', 'KHOAI TÂY CHIÊN', 5),
(25, 'KHOAI TÂY TẮM PHÔ MAI ', 'KHOAI TÂY TẮM PHÔ MAI .png', 'KHOAI TÂY TẮM PHÔ MAI', 5),
(26, 'Mỳ Ý Tôm Sốt Kem Cà Chua', 'Mỳ Ý Tôm Sốt Kem Cà Chua.png', 'Sự tươi ngon của tôm kết hợp với sốt kem cà chua.', 4),
(27, 'Mỳ Ý Cay Xúc Xích', 'Mỳ Ý Cay Xúc Xích.png', 'Mỳ Ý rán với xúc xích cay, thảo mộc, ngò gai và húng quế Ý.', 4),
(28, 'Mì Ý Pesto', 'Mì Ý Pesto.png', 'Các loại nguyên liệu hải sản hảo hạng: Tôm, mực hoà quyện trên nền sốt Pesto xanh đậm vị, thơm hương đặc trưng từ lá húng tây – mang đậm nét truyền thống ẩm thực Ý.', 4),
(29, 'Mỳ Ý Truffle', 'Mỳ Ý Truffle.png', 'Nấm Truffle đen với hương thơm ngất ngây, phủ trên lớp sốt kem n', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL DEFAULT 1,
  `id_size` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`id`, `id_product`, `id_size`, `price`, `quantity`) VALUES
(1, 1, 1, 60000, 0),
(2, 1, 2, 80000, 91),
(3, 1, 3, 100000, 100),
(4, 2, 1, 60000, 27),
(5, 2, 2, 80000, 100),
(6, 2, 3, 100000, 43),
(7, 3, 1, 60000, 83),
(8, 3, 2, 80000, 32),
(9, 3, 3, 100000, 68),
(10, 4, 1, 60000, 51),
(11, 4, 2, 80000, 42),
(12, 4, 3, 100000, 48),
(13, 5, 1, 70000, 15),
(14, 5, 2, 90000, 10),
(15, 5, 3, 110000, 86),
(16, 6, 1, 70000, 26),
(17, 6, 2, 90000, 53),
(18, 6, 3, 110000, 78),
(19, 7, 1, 50000, 61),
(20, 7, 2, 70000, 53),
(21, 7, 3, 90000, 71),
(22, 8, 1, 70000, 92),
(23, 8, 2, 90000, 58),
(24, 8, 3, 110000, 94),
(25, 9, 1, 60000, 15),
(26, 9, 2, 80000, 56),
(27, 9, 3, 100000, 45),
(28, 10, 1, 50000, 47),
(29, 10, 2, 70000, 90),
(30, 10, 3, 90000, 25),
(31, 11, 1, 60000, 28),
(32, 11, 2, 80000, 58),
(33, 11, 3, 100000, 12),
(34, 12, 2, 0, 0),
(35, 12, 1, 60000, 61),
(36, 12, 3, 0, 0),
(37, 13, 2, 0, 0),
(38, 13, 1, 80000, 61),
(39, 13, 3, 0, 0),
(40, 14, 2, 0, 0),
(41, 14, 1, 80000, 87),
(42, 14, 3, 0, 0),
(43, 15, 2, 0, 0),
(44, 15, 1, 70000, 37),
(45, 15, 3, 0, 0),
(46, 16, 1, 60000, 81),
(47, 16, 2, 80000, 38),
(48, 16, 3, 100000, 29),
(49, 17, 2, 0, 0),
(51, 17, 3, 0, 0),
(52, 18, 1, 60000, 48),
(53, 18, 2, 80000, 11),
(54, 18, 3, 100000, 84),
(55, 19, 1, 50000, 16),
(56, 19, 2, 70000, 88),
(57, 19, 3, 90000, 21),
(58, 20, 1, 60000, 11),
(59, 20, 2, 80000, 75),
(60, 20, 3, 100000, 59),
(61, 21, 1, 60000, 60),
(62, 21, 2, 80000, 25),
(63, 21, 3, 100000, 23),
(64, 22, 1, 60000, 33),
(65, 22, 2, 80000, 87),
(66, 22, 3, 100000, 52),
(67, 23, 1, 60000, 80),
(68, 23, 2, 80000, 54),
(69, 23, 3, 100000, 20),
(70, 24, 1, 70000, 19),
(71, 24, 2, 90000, 24),
(72, 24, 3, 110000, 54),
(73, 25, 1, 60000, 99),
(74, 25, 2, 80000, 52),
(75, 25, 3, 100000, 37),
(76, 26, 1, 70000, 25),
(77, 26, 2, 90000, 95),
(78, 26, 3, 110000, 26),
(79, 27, 1, 70000, 17),
(80, 27, 2, 90000, 87),
(81, 27, 3, 110000, 14),
(82, 28, 1, 70000, 70),
(83, 28, 2, 90000, 30),
(84, 28, 3, 110000, 18),
(85, 29, 1, 50000, 81),
(86, 29, 2, 70000, 66),
(87, 29, 3, 90000, 79);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(0, 'Admin'),
(1, 'Client');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `name`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_role` (`id_role`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_account` (`id_account`),
  ADD KEY `id_product_variants` (`id_product_variants`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_account` (`id_account`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `discount_codes`
--
ALTER TABLE `discount_codes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_account` (`id_account`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product_variants` (`id_product_variants`),
  ADD KEY `discount` (`discount`);

--
-- Chỉ mục cho bảng `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_size_product` (`id_size`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `discount_codes`
--
ALTER TABLE `discount_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_product_variants`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `order_status` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`id_product_variants`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`discount`) REFERENCES `discount_codes` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `id_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_size` FOREIGN KEY (`id_size`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
