CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `is_blocked` varchar(45) DEFAULT 'NO',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `vendors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;





CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `mobile` bigint(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` varchar(2) DEFAULT 'VD',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;




CREATE TABLE `product_details` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `prod_name` varchar(45) DEFAULT NULL,
  `prod_brand` varchar(45) DEFAULT NULL,
  `prod_description` varchar(255) DEFAULT NULL,
  `prod_category` varchar(45) DEFAULT NULL,
  `prod_price` int(11) DEFAULT NULL,
  `prod_offer` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT NULL,
  `rem` int(11) DEFAULT NULL,
  `buffer` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `is_blocked` int(1) DEFAULT '0',
  `pending` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_id_idx` (`role_id`),
  CONSTRAINT `prod_id` FOREIGN KEY (`role_id`) REFERENCES `vendors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
