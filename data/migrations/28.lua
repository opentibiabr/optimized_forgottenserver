function onUpdateDatabase()
	print("> Updating database to version 28 (Optimize database)")
	db.query("ALTER TABLE `players` \z
			MODIFY COLUMN `level` int unsigned NOT NULL DEFAULT '1', \z
			MODIFY COLUMN `experience` bigint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `group_id` smallint unsigned NOT NULL DEFAULT '1', \z
			MODIFY COLUMN `vocation` smallint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `lookbody` tinyint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `lookfeet` tinyint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `lookhead` tinyint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `looklegs` tinyint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `looktype` smallint unsigned NOT NULL DEFAULT '136', \z
			MODIFY COLUMN `lookaddons` tinyint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `maglevel` int unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `mana` int unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `manamax` int unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `soul` tinyint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `town_id` int unsigned NOT NULL DEFAULT '1', \z
			MODIFY COLUMN `posx` smallint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `posy` smallint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `posz` tinyint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `cap` int unsigned NOT NULL DEFAULT '400', \z
			MODIFY COLUMN `sex` tinyint unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `skill_fist` smallint unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_club` smallint unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_sword` smallint unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_axe` smallint unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_dist` smallint unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_shielding` smallint unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_fishing` smallint unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `onlinetime` bigint unsigned NOT NULL DEFAULT '0'")
	return true
end
