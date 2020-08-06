function onUpdateDatabase()
	print("> Updating database to version 30 (Supply Stash)")
	db.query("ALTER TABLE `players` ADD `supplystash` longblob DEFAULT NULL")
	return true
end

