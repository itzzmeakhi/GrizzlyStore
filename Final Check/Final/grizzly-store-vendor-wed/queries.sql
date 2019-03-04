CREATE TABLE `product_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` varchar(45) DEFAULT NULL,
  `prod_name` varchar(45) DEFAULT NULL,
  `prod_brand` varchar(45) DEFAULT NULL,
  `prod_desc` varchar(45) DEFAULT NULL,
  `prod_category` varchar(45) DEFAULT NULL,
  `prod_price` int(11) DEFAULT NULL,
  `prod_offer` int(11) DEFAULT NULL,
  `prod_rating` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;








CREATE TABLE `quantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` varchar(45) DEFAULT NULL,
  `in_stock` int(11) DEFAULT '0',
  `rem` int(11) DEFAULT '0',
  `buffer` int(11) DEFAULT '0',
  `pending` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;









CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(2) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_blocked` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `mobile` bigint(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` varchar(2) DEFAULT 'VD',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
