function onUpdateDatabase()
	print("> Updating database to version 27 (Binary Save)")
	db.query("ALTER TABLE `players` ADD `depotlockeritems` longblob DEFAULT NULL")
	db.query("DROP TABLE `player_depotlockeritems`")
	return true
end

