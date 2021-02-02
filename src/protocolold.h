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

#ifndef FS_PROTOCOLOLD_H_5487B862FE144AE0904D098A3238E161
#define FS_PROTOCOLOLD_H_5487B862FE144AE0904D098A3238E161

#include "protocol.h"

class NetworkMessage;

class ProtocolOld final : public Protocol
{
	public:
		// static protocol information
		enum {server_sends_first = false};
		enum {protocol_identifier = 0x01};
		#if GAME_FEATURE_ADLER32_CHECKSUM > 0
		enum {use_checksum = false};
		#else
		enum {use_checksum = true};
		#endif
		static const char* protocol_name() {
			return "old login protocol";
		}

		explicit ProtocolOld(Connection_ptr connection) : Protocol(connection) {}

		void onRecvFirstMessage(NetworkMessage& msg) override;

	private:
		void disconnectClient(const std::string& message, uint16_t version);
};

#endif
