function onUpdateDatabase()
	print("> Updating database to version 29 (Gamestore)")
	db.query("CREATE TABLE IF NOT EXISTS `store_history` \z
			(\z
				`id` int unsigned NOT NULL AUTO_INCREMENT, \z
				`account_id` int NOT NULL, \z
				`mode` smallint NOT NULL DEFAULT '0', \z
				`description` varchar(3500) NOT NULL, \z
				`coin_amount` int NOT NULL, \z
				`time` bigint unsigned NOT NULL, \z
				`coin_type` smallint NOT NULL DEFAULT '0', \z
				INDEX `account_id` (`account_id`), \z
				CONSTRAINT `store_history_pk` PRIMARY KEY (`id`), \z
				CONSTRAINT `store_history_account_fk` \z
					FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) \z
					ON DELETE CASCADE\z
			) ENGINE=InnoDB DEFAULT CHARSET=utf8")

	db.query("ALTER TABLE `accounts` ADD `coins` int NOT NULL DEFAULT '0'")
	return true
end
