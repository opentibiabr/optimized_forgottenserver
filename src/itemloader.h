/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019  Mark Samman <mark.samman@gmail.com>
 * Copyright (C) 2019-2021  Saiyans King
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifndef FS_ITEMLOADER_H_107F1D3EECC94CD0A0F528843010D5D4
#define FS_ITEMLOADER_H_107F1D3EECC94CD0A0F528843010D5D4

#include "fileloader.h"

enum itemgroup_t {
	ITEM_GROUP_NONE,

	ITEM_GROUP_GROUND,
	ITEM_GROUP_CONTAINER,
	ITEM_GROUP_WEAPON,
	ITEM_GROUP_AMMUNITION,
	ITEM_GROUP_ARMOR,
	ITEM_GROUP_CHARGES,
	ITEM_GROUP_TELEPORT,
	ITEM_GROUP_MAGICFIELD,
	ITEM_GROUP_WRITEABLE,
	ITEM_GROUP_KEY,
	ITEM_GROUP_SPLASH,
	ITEM_GROUP_FLUID,
	ITEM_GROUP_DOOR,
	ITEM_GROUP_DEPRECATED,

	ITEM_GROUP_LAST
};

/////////OTB specific//////////////
enum clientVersion_t {
	CLIENT_VERSION_750 = 1,
	CLIENT_VERSION_755 = 2,
	CLIENT_VERSION_760 = 3,
	CLIENT_VERSION_770 = 3,
	CLIENT_VERSION_780 = 4,
	CLIENT_VERSION_790 = 5,
	CLIENT_VERSION_792 = 6,
	CLIENT_VERSION_800 = 7,
	CLIENT_VERSION_810 = 8,
	CLIENT_VERSION_811 = 9,
	CLIENT_VERSION_820 = 10,
	CLIENT_VERSION_830 = 11,
	CLIENT_VERSION_840 = 12,
	CLIENT_VERSION_841 = 13,
	CLIENT_VERSION_842 = 14,
	CLIENT_VERSION_850 = 15,
	CLIENT_VERSION_854_BAD = 16,
	CLIENT_VERSION_854 = 17,
	CLIENT_VERSION_855 = 18,
	CLIENT_VERSION_860_OLD = 19,
	CLIENT_VERSION_860 = 20,
	CLIENT_VERSION_861 = 21,
	CLIENT_VERSION_862 = 22,
	CLIENT_VERSION_870 = 23,
	CLIENT_VERSION_871 = 24,
	CLIENT_VERSION_872 = 25,
	CLIENT_VERSION_873 = 26,
	CLIENT_VERSION_900 = 27,
	CLIENT_VERSION_910 = 28,
	CLIENT_VERSION_920 = 29,
	CLIENT_VERSION_940 = 30,
	CLIENT_VERSION_944_V1 = 31,
	CLIENT_VERSION_944_V2 = 32,
	CLIENT_VERSION_944_V3 = 33,
	CLIENT_VERSION_944_V4 = 34,
	CLIENT_VERSION_946 = 35,
	CLIENT_VERSION_950 = 36,
	CLIENT_VERSION_952 = 37,
	CLIENT_VERSION_953 = 38,
	CLIENT_VERSION_954 = 39,
	CLIENT_VERSION_960 = 40,
	CLIENT_VERSION_961 = 41,
	CLIENT_VERSION_963 = 42,
	CLIENT_VERSION_970 = 43,
	CLIENT_VERSION_980 = 44,
	CLIENT_VERSION_981 = 45,
	CLIENT_VERSION_982 = 46,
	CLIENT_VERSION_983 = 47,
	CLIENT_VERSION_985 = 48,
	CLIENT_VERSION_986 = 49,
	CLIENT_VERSION_1010 = 50,
	CLIENT_VERSION_1020 = 51,
	CLIENT_VERSION_1021 = 52,
	CLIENT_VERSION_1030 = 53,
	CLIENT_VERSION_1031 = 54,
	CLIENT_VERSION_1035 = 55,
	CLIENT_VERSION_1076 = 56,
	CLIENT_VERSION_1098 = 57,
};

enum rootattrib_ {
	ROOT_ATTR_VERSION = 0x01,
};

enum itemattrib_t {
	ITEM_ATTR_FIRST = 0x10,
	ITEM_ATTR_SERVERID = ITEM_ATTR_FIRST,
	ITEM_ATTR_CLIENTID,
	ITEM_ATTR_NAME,
	ITEM_ATTR_DESCR,
	ITEM_ATTR_SPEED,
	ITEM_ATTR_SLOT,
	ITEM_ATTR_MAXITEMS,
	ITEM_ATTR_WEIGHT,
	ITEM_ATTR_WEAPON,
	ITEM_ATTR_AMMO,
	ITEM_ATTR_ARMOR,
	ITEM_ATTR_MAGLEVEL,
	ITEM_ATTR_MAGFIELDTYPE,
	ITEM_ATTR_WRITEABLE,
	ITEM_ATTR_ROTATETO,
	ITEM_ATTR_DECAY,
	ITEM_ATTR_SPRITEHASH,
	ITEM_ATTR_MINIMAPCOLOR,
	ITEM_ATTR_07,
	ITEM_ATTR_08,
	ITEM_ATTR_LIGHT,

	//1-byte aligned
	ITEM_ATTR_DECAY2,
	ITEM_ATTR_WEAPON2,
	ITEM_ATTR_AMMO2,
	ITEM_ATTR_ARMOR2,
	ITEM_ATTR_WRITEABLE2,
	ITEM_ATTR_LIGHT2,
	ITEM_ATTR_TOPORDER,
	ITEM_ATTR_WRITEABLE3,

	ITEM_ATTR_WAREID,

	ITEM_ATTR_LAST
};

enum itemflags_t {
	FLAG_BLOCK_SOLID = 1 << 0,
	FLAG_BLOCK_PROJECTILE = 1 << 1,
	FLAG_BLOCK_PATHFIND = 1 << 2,
	FLAG_HAS_HEIGHT = 1 << 3,
	FLAG_USEABLE = 1 << 4,
	FLAG_PICKUPABLE = 1 << 5,
	FLAG_MOVEABLE = 1 << 6,
	FLAG_STACKABLE = 1 << 7,
	FLAG_FLOORCHANGEDOWN = 1 << 8,
	FLAG_FLOORCHANGENORTH = 1 << 9,
	FLAG_FLOORCHANGEEAST = 1 << 10,
	FLAG_FLOORCHANGESOUTH = 1 << 11,
	FLAG_FLOORCHANGEWEST = 1 << 12,
	FLAG_ALWAYSONTOP = 1 << 13,
	FLAG_READABLE = 1 << 14,
	FLAG_ROTATABLE = 1 << 15,
	FLAG_HANGABLE = 1 << 16,
	FLAG_VERTICAL = 1 << 17,
	FLAG_HORIZONTAL = 1 << 18,
	FLAG_CANNOTDECAY = 1 << 19,
	FLAG_ALLOWDISTREAD = 1 << 20,
	FLAG_UNUSED = 1 << 21, // unused
	FLAG_CLIENTCHARGES = 1 << 22, /* deprecated */
	FLAG_LOOKTHROUGH = 1 << 23,
	FLAG_ANIMATION = 1 << 24,
	FLAG_FULLTILE = 1 << 25, // unused
	FLAG_FORCEUSE = 1 << 26,
};

enum slotsOTB_t {
	OTB_SLOT_DEFAULT,
	OTB_SLOT_HEAD,
	OTB_SLOT_BODY,
	OTB_SLOT_LEGS,
	OTB_SLOT_BACKPACK,
	OTB_SLOT_WEAPON,
	OTB_SLOT_2HAND,
	OTB_SLOT_FEET,
	OTB_SLOT_AMULET,
	OTB_SLOT_RING,
	OTB_SLOT_HAND,
};

enum subfightOTB_t {
	OTB_DIST_NONE,
	OTB_DIST_BOLT,
	OTB_DIST_ARROW,
	OTB_DIST_FIRE,
	OTB_DIST_ENERGY,
	OTB_DIST_POISONARROW,
	OTB_DIST_BURSTARROW,
	OTB_DIST_THROWINGSTAR,
	OTB_DIST_THROWINGKNIFE,
	OTB_DIST_SMALLSTONE,
	OTB_DIST_SUDDENDEATH,
	OTB_DIST_LARGEROCK,
	OTB_DIST_SNOWBALL,
	OTB_DIST_POWERBOLT,
	OTB_DIST_SPEAR,
	OTB_DIST_POISONFIELD
};

//8-byte aligned structs
#pragma pack(8)
struct weaponBlock {
	uint8_t weaponType;
	uint8_t ammoType;
	uint8_t shootType;
	uint8_t attack;
	uint8_t defense;
};

struct ammoBlock {
	uint8_t ammoType;
	uint8_t shootType;
	uint8_t attack;
};

struct armorBlock {
	uint16_t armor;
	double weight;
	uint16_t slotPosition;
};

struct decayBlock {
	uint16_t decayTo;
	uint16_t decayTime;
};

struct lightBlock {
	uint16_t lightLevel;
	uint16_t lightColor;
};
#pragma pack()

//1-byte aligned structs
#pragma pack(1)

struct VERSIONINFO {
	uint32_t dwMajorVersion;
	uint32_t dwMinorVersion;
	uint32_t dwBuildNumber;
	uint8_t CSDVersion[128];
};

struct decayBlock2 {
	uint16_t decayTo;
	uint16_t decayTime;
};

struct weaponBlock2 {
	uint8_t weaponType;
	uint8_t ammoType;
	uint8_t shootType;
	uint8_t attack;
	uint8_t defense;
};

struct ammoBlock2 {
	uint8_t ammoType;
	uint8_t shootType;
	uint8_t attack;
};

struct armorBlock2 {
	uint16_t armor;
	double weight;
	uint16_t slotPosition;
};

struct lightBlock2 {
	uint16_t lightLevel;
	uint16_t lightColor;
};

#pragma pack()
/////////OTB specific//////////////
#endif
