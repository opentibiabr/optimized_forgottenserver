function onUpdateDatabase()
	print("> Updating database to version 28 (Optimize database)")
	db.query("ALTER TABLE `players` \z
			MODIFY COLUMN `level` int(11) unsigned NOT NULL DEFAULT '1', \z
			MODIFY COLUMN `experience` bigint(20) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `group_id` smallint(6) unsigned NOT NULL DEFAULT '1', \z
			MODIFY COLUMN `vocation` smallint(6) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `lookbody` tinyint(3) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `lookfeet` tinyint(3) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `lookhead` tinyint(3) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `looklegs` tinyint(3) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `looktype` smallint(6) unsigned NOT NULL DEFAULT '136', \z
			MODIFY COLUMN `lookaddons` tinyint(3) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `maglevel` int(11) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `mana` int(11) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `manamax` int(11) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `soul` tinyint(3) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `town_id` int(11) unsigned NOT NULL DEFAULT '1', \z
			MODIFY COLUMN `posx` smallint(6) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `posy` smallint(6) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `posz` tinyint(3) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `cap` int(11) unsigned NOT NULL DEFAULT '400', \z
			MODIFY COLUMN `sex` tinyint(3) unsigned NOT NULL DEFAULT '0', \z
			MODIFY COLUMN `skill_fist` smallint(6) unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_club` smallint(6) unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_sword` smallint(6) unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_axe` smallint(6) unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_dist` smallint(6) unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_shielding` smallint(6) unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `skill_fishing` smallint(6) unsigned NOT NULL DEFAULT '10', \z
			MODIFY COLUMN `onlinetime` bigint(20) unsigned NOT NULL DEFAULT '0'")
	return true
end
