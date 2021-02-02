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

#include "otpch.h"

#include "server.h"

#include "game.h"

#include "modules.h"
#include "iomarket.h"

#include "configmanager.h"
#include "scriptmanager.h"
#include "rsa.h"
#include "protocolold.h"
#include "protocollogin.h"
#include "protocolstatus.h"
#include "databasemanager.h"
#include "databasetasks.h"
#include "script.h"
#include <fstream>

Database g_database;
DatabaseTasks g_databaseTasks;
Dispatcher g_dispatcher;

Game g_game;
ConfigManager g_config;
Monsters g_monsters;
Vocations g_vocations;
Modules g_modules;
extern Scripts* g_scripts;
RSA g_RSA;

std::mutex g_loaderLock;
std::condition_variable g_loaderSignal;
std::unique_lock<std::mutex> g_loaderUniqueLock(g_loaderLock);

void startupErrorMessage(const std::string& errorStr)
{
	std::cout << "> ERROR: " << errorStr << std::endl;
	getchar();
	g_loaderSignal.notify_all();
}

void mainLoader(int argc, char* argv[], ServiceManager* services);

[[noreturn]] void badAllocationHandler()
{
	// Use functions that only use stack allocation
	puts("Allocation failed, server out of memory.\nDecrease the size of your map or compile in 64 bits mode.\n");
	getchar();
	exit(-1);
}

int main(int argc, char* argv[])
{
	// Setup bad allocation handler
	std::set_new_handler(badAllocationHandler);

	if (!g_database.init()) {
		return 1;
	}

	ServiceManager serviceManager;

	g_dispatcher.start();
	g_dispatcher.addTask(std::bind(mainLoader, argc, argv, &serviceManager));

	g_loaderSignal.wait(g_loaderUniqueLock);

	if (serviceManager.is_running()) {
		std::cout << ">> " << g_config.getString(ConfigManager::SERVER_NAME) << " Server Online!" << std::endl << std::endl;
		serviceManager.run();
	} else {
		std::cout << ">> No services running. The server is NOT online." << std::endl;
		g_databaseTasks.shutdown();
		g_dispatcher.shutdown();
	}

	g_databaseTasks.join();
	g_dispatcher.join();
	g_database.end();
	return 0;
}

void mainLoader(int, char*[], ServiceManager* services)
{
	//dispatcher thread
	g_game.setGameState(GAME_STATE_STARTUP);

	srand(static_cast<unsigned int>(OTSYS_TIME()));
#ifdef _WIN32
	SetConsoleTitle(STATUS_SERVER_NAME);
#endif
	std::cout << STATUS_SERVER_NAME << " - Version " << STATUS_SERVER_VERSION << std::endl;
	std::cout << "Compiled with " << BOOST_COMPILER << std::endl;
	std::cout << "Compiled on " << __DATE__ << ' ' << __TIME__ << " for platform ";

#if defined(__amd64__) || defined(_M_X64)
	std::cout << "x64" << std::endl;
#elif defined(__i386__) || defined(_M_IX86) || defined(_X86_)
	std::cout << "x86" << std::endl;
#elif defined(__arm__)
	std::cout << "ARM" << std::endl;
#else
	std::cout << "unknown" << std::endl;
#endif
	std::cout << std::endl;

	std::cout << "A server developed by " << STATUS_SERVER_DEVELOPERS << std::endl;
	std::cout << "Server protocol: " << CLIENT_VERSION_UPPER << "." << CLIENT_VERSION_LOWER << std::endl;

	std::cout << std::endl;
	std::cout << "                    .*#%%/                            (&&#*.                    " << std::endl;
	std::cout << "               *(%%&%/.                                  ,(&&&%(*               " << std::endl;
	std::cout << "           .%%&&&&%,                                        *&&&&&&%.           " << std::endl;
	std::cout << "          ,&&&&&&#                                            %&&&&&&.          " << std::endl;
	std::cout << "     ,&/  (&&&&&&                                             .&&&&&&/  (&.     " << std::endl;
	std::cout << "   .%&&#  %&&&%%/                                              %%%&&&(  %&&%    " << std::endl;
	std::cout << "  /&&&&&/ (%%%%%(                                              %%%&%%* #&&&&&*  " << std::endl;
	std::cout << " .&&&&&&&( %%%%%%.                                            ,%%%%%% #&&&&&&&  " << std::endl;
	std::cout << " *&&&&&&%%%*%%%%%#                                            %%%%%#(%%%&&&&&&. " << std::endl;
	std::cout << "  ,&&&%%%%%%%%####,                                          *##%#%%%%%%%%%&&.  " << std::endl;
	std::cout << "%,  (&%%%%%#%%###.                                            .#####%%%%%%%/  *(" << std::endl;
	std::cout << "(&&(. *%%%%%####* /.                                        ., /####%%%%#* .(%&/" << std::endl;
	std::cout << ".&&%&%#. /###%##, *#,                                      *#, *#####%* ,#%%%%%." << std::endl;
	std::cout << " #%%%%%%%%#/####(  (((,           .,*,*//**,..           *((/ .#####/#%#%%%%%%/ " << std::endl;
	std::cout << "  /%%%%%%%######((. *(((/.         .*/*/*/****        ,((((, *((######%#%%%%%,  " << std::endl;
	std::cout << "    *#%%%#######(#((* ,((///*,       */*****..    ,/(((((, *((#(#######%#%#,    " << std::endl;
	std::cout << "          ./((##(((((((/ ,//////.    *******,   //(((/. /((((((##((/*.          " << std::endl;
	std::cout << "      ,####((////*/(((((///*/////*/*,*********///////((((((((/////(((####.      " << std::endl;
	std::cout << "        .#######((((((((//////////***/*****//////(/((/((((((((((#(#####         " << std::endl;
	std::cout << "           *(###(((((, .,*//////////*****//////////(//,,. ,((((((##(,           " << std::endl;
	std::cout << "               *((((((((.     *///*/***///////(//*     *((((((((*               " << std::endl;
	std::cout << "                    .,,**//*.    .,////.*////,     ,*/**,,,.                    " << std::endl;
	std::cout << "                                  *(/,    //(/                                  " << std::endl;
	std::cout << "                                ./((((((((((((/.                                " << std::endl;
	std::cout << "                               ((((* ,(.*(. /((((.                              " << std::endl;
	std::cout << "                            *(((((./*,(.*( (*.(((((/.                           " << std::endl;
	std::cout << "                         ,##((#(./((*,(.*(.(((*.(((((#*                         " << std::endl;
	std::cout << "                       *#####(,*####*,(./(.(####*,(####(                        " << std::endl;
	std::cout << "                          (# (###### (#./#,*######( (/                          " << std::endl;
	std::cout << "                            ,(#####,(##./##**#####*.                            " << std::endl;
	std::cout << "                                #(.####./#### #/                                " << std::endl;
	std::cout << "                                  ./%%%./%%#*                                   " << std::endl;
	std::cout << std::endl;
	std::this_thread::sleep_for(std::chrono::seconds(5));

	// check if config.lua or config.lua.dist exist
	std::ifstream c_test("./config.lua");
	if (!c_test.is_open()) {
		std::ifstream config_lua_dist("./config.lua.dist");
		if (config_lua_dist.is_open()) {
			std::cout << ">> copying config.lua.dist to config.lua" << std::endl;
			std::ofstream config_lua("config.lua");
			config_lua << config_lua_dist.rdbuf();
			config_lua.close();
			config_lua_dist.close();
		}
	} else {
		c_test.close();
	}

	// read global config
	std::cout << ">> Loading config" << std::endl;
	if (!g_config.load()) {
		startupErrorMessage("Unable to load config.lua!");
		return;
	}

#ifdef _WIN32
	const std::string& defaultPriority = g_config.getString(ConfigManager::DEFAULT_PRIORITY);
	if (strcasecmp(defaultPriority.c_str(), "high") == 0) {
		SetPriorityClass(GetCurrentProcess(), HIGH_PRIORITY_CLASS);
	} else if (strcasecmp(defaultPriority.c_str(), "above-normal") == 0) {
		SetPriorityClass(GetCurrentProcess(), ABOVE_NORMAL_PRIORITY_CLASS);
	}
#endif

	const char* p("14299623962416399520070177382898895550795403345466153217470516082934737582776038882967213386204600674145392845853859217990626450972452084065728686565928113");
	const char* q("7630979195970404721891201847792002125535401292779123937207447574596692788513647179235335529307251350570728407373705564708871762033017096809910315212884101");
	try {
		if (!g_RSA.loadPEM("key.pem")) {
			// file doesn't exist - switch to base10-hardcoded keys
			std::cout << ">> File key.pem doesn't exist - loading standard rsa key\n";
			g_RSA.setKey(p, q);
		}
	} catch (std::exception const& e) {
		std::cout << ">> Loading RSA Key from key.pem failed: " << e.what() << "\n";
		g_RSA.setKey(p, q);
	}

	std::cout << ">> Establishing database connection..." << std::flush;
	if (!g_database.connect()) {
		startupErrorMessage("Failed to connect to database.");
		return;
	}

	std::cout << " MySQL " << Database::getClientVersion() << std::endl;
	if (g_database.getMaxPacketSize() < 104857600) {
		std::cout << "> Max MYSQL Query size below 100MB might generate undefined behaviour." << std::endl;
		std::cout << "> Do you want to continue? Press enter to continue." << std::endl;
		getchar();
	}

	// run database manager
	std::cout << ">> Running database manager" << std::endl;

	if (!DatabaseManager::isDatabaseSetup()) {
		startupErrorMessage("The database you have specified in config.lua is empty, please import the schema.sql to your database.");
		return;
	}
	g_databaseTasks.start();

	DatabaseManager::updateDatabase();
	if (g_config.getBoolean(ConfigManager::OPTIMIZE_DATABASE) && !DatabaseManager::optimizeTables()) {
		std::cout << "> No tables were optimized." << std::endl;
	}

	//load vocations
	std::cout << ">> Loading vocations" << std::endl;
	if (!g_vocations.loadFromXml()) {
		startupErrorMessage("Unable to load vocations!");
		return;
	}

	// load item data
	std::cout << ">> Loading items" << std::endl;
	try {
		if (!Item::items.loadFromOtb("data/items/" + std::to_string(CLIENT_VERSION) + "/items.otb")) {
			startupErrorMessage("Unable to load items (OTB)!");
			return;
		}
	} catch (std::exception const& e) {
		std::cout << "[Fatal Error - Items::loadFromOtb] " << e.what() << std::endl;
		startupErrorMessage("Unable to load items (OTB)!");
		return;
	}

	if (!Item::items.loadFromXml()) {
		startupErrorMessage("Unable to load items (XML)!");
		return;
	}

	std::cout << ">> Loading script systems" << std::endl;
	if (!ScriptingManager::getInstance().loadScriptSystems()) {
		startupErrorMessage("Failed to load script systems");
		return;
	}

	std::cout << ">> Loading modules" << std::endl;
	if (!g_modules.load()) {
		startupErrorMessage("Failed to load modules");
		return;
	}

	std::cout << ">> Loading lua scripts" << std::endl;
	if (!g_scripts->loadScripts("scripts", false, false)) {
		startupErrorMessage("Failed to load lua scripts");
		return;
	}

	std::cout << ">> Loading monsters" << std::endl;
	if (!g_monsters.loadFromXml()) {
		startupErrorMessage("Unable to load monsters!");
		return;
	}

	std::cout << ">> Loading lua monsters" << std::endl;
	if (!g_scripts->loadScripts("monster", false, false)) {
		startupErrorMessage("Failed to load lua monsters");
		return;
	}

	std::cout << ">> Loading outfits" << std::endl;
	if (!Outfits::getInstance().loadFromXml()) {
		startupErrorMessage("Unable to load outfits!");
		return;
	}

	std::cout << ">> Checking world type... " << std::flush;
	std::string worldType = asLowerCaseString(g_config.getString(ConfigManager::WORLD_TYPE));
	if (!tfs_strcmp(worldType.c_str(), "pvp")) {
		g_game.setWorldType(WORLD_TYPE_PVP);
	} else if (!tfs_strcmp(worldType.c_str(), "no-pvp")) {
		g_game.setWorldType(WORLD_TYPE_NO_PVP);
	} else if (!tfs_strcmp(worldType.c_str(), "pvp-enforced")) {
		g_game.setWorldType(WORLD_TYPE_PVP_ENFORCED);
	} else {
		std::cout << std::endl;

		std::stringExtended ss(256);
		ss << "> ERROR: Unknown world type: " << g_config.getString(ConfigManager::WORLD_TYPE) << ", valid world types are: pvp, no-pvp and pvp-enforced.";
		startupErrorMessage(ss);
		return;
	}
	std::cout << asUpperCaseString(worldType) << std::endl;

	std::cout << ">> Loading map" << std::endl;
	if (!g_game.loadMainMap(g_config.getString(ConfigManager::MAP_NAME))) {
		startupErrorMessage("Failed to load map");
		return;
	}

	std::cout << ">> Initializing gamestate" << std::endl;
	g_game.setGameState(GAME_STATE_INIT);

	// Game client protocols
	services->add<ProtocolGame>(static_cast<uint16_t>(g_config.getNumber(ConfigManager::GAME_PORT)));
	services->add<ProtocolLogin>(static_cast<uint16_t>(g_config.getNumber(ConfigManager::LOGIN_PORT)));

	// OT protocols
	services->add<ProtocolStatus>(static_cast<uint16_t>(g_config.getNumber(ConfigManager::STATUS_PORT)));

	// Legacy login protocol
	services->add<ProtocolOld>(static_cast<uint16_t>(g_config.getNumber(ConfigManager::LOGIN_PORT)));

	RentPeriod_t rentPeriod;
	std::string strRentPeriod = asLowerCaseString(g_config.getString(ConfigManager::HOUSE_RENT_PERIOD));
	if (!tfs_strcmp(strRentPeriod.c_str(), "yearly")) {
		rentPeriod = RENTPERIOD_YEARLY;
	} else if (!tfs_strcmp(strRentPeriod.c_str(), "weekly")) {
		rentPeriod = RENTPERIOD_WEEKLY;
	} else if (!tfs_strcmp(strRentPeriod.c_str(), "monthly")) {
		rentPeriod = RENTPERIOD_MONTHLY;
	} else if (!tfs_strcmp(strRentPeriod.c_str(), "daily")) {
		rentPeriod = RENTPERIOD_DAILY;
	} else {
		rentPeriod = RENTPERIOD_NEVER;
	}

	g_game.map.houses.payHouses(rentPeriod);

#if GAME_FEATURE_MARKET > 0
	IOMarket::checkExpiredOffers();
	IOMarket::getInstance().updateStatistics();
#endif

	std::cout << ">> Loaded all modules, server starting up..." << std::endl;

#ifndef _WIN32
	if (getuid() == 0 || geteuid() == 0) {
		std::cout << "> Warning: " << STATUS_SERVER_NAME << " has been executed as root user, please consider running it as a normal user." << std::endl;
	}
#endif

	g_game.start(services);
	g_game.setGameState(GAME_STATE_NORMAL);
	g_loaderSignal.notify_all();
}
