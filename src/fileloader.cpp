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

#include "fileloader.h"

namespace OTB {

constexpr Identifier wildcard = {{'\0', '\0', '\0', '\0'}};

Loader::Loader(const std::string& fileName, const Identifier& acceptedIdentifier):
	fileContents(fileName)
{
	constexpr auto minimalSize = sizeof(Identifier) + sizeof(Node::START) + sizeof(Node::type) + sizeof(Node::END);
	if (fileContents.size() <= minimalSize) {
		throw InvalidOTBFormat{};
	}

	Identifier fileIdentifier;
	std::copy(fileContents.begin(), fileContents.begin() + fileIdentifier.size(), fileIdentifier.begin());
	if (fileIdentifier != acceptedIdentifier && fileIdentifier != wildcard) {
		throw InvalidOTBFormat{};
	}
}

using NodeStack = std::vector<Node*>;
static Node& getCurrentNode(const NodeStack& nodeStack) {
	if (nodeStack.empty()) {
		throw InvalidOTBFormat{};
	}
	return *nodeStack.back();
}

const Node& Loader::parseTree()
{
	auto it = fileContents.begin() + sizeof(Identifier);
	if (static_cast<uint8_t>(*it) != Node::START) {
		throw InvalidOTBFormat{};
	}
	root.type = *(++it);
	root.propsBegin = ++it;
	NodeStack parseStack;
	parseStack.push_back(&root);

	for (auto end = fileContents.end(); it != end; ++it) {
		uint8_t nodeType = static_cast<uint8_t>(*it);
		if (nodeType == Node::START) {
			auto& currentNode = getCurrentNode(parseStack);
			if (currentNode.children.empty()) {
				currentNode.propsEnd = it;
			}
			currentNode.children.emplace_back();
			auto& child = currentNode.children.back();
			if (++it == fileContents.end()) {
				throw InvalidOTBFormat{};
			}
			child.type = *it;
			child.propsBegin = it + sizeof(Node::type);
			parseStack.push_back(&child);
		} else if (nodeType == Node::END) {
			auto& currentNode = getCurrentNode(parseStack);
			if (currentNode.children.empty()) {
				currentNode.propsEnd = it;
			}
			parseStack.pop_back();
		} else if (nodeType == Node::ESCAPE) {
			if (++it == fileContents.end()) {
				throw InvalidOTBFormat{};
			}
		}
	}
	if (!parseStack.empty()) {
		throw InvalidOTBFormat{};
	}

	return root;
}

bool Loader::getProps(const Node& node, PropStream& props)
{
	size_t size = std::distance(node.propsBegin, node.propsEnd);
	if (size == 0) {
		return false;
	}
	if (propBuffer.size() < size) {
		propBuffer.resize(size);
	}
	bool lastEscaped = false;

	auto escapedPropEnd = std::copy_if(node.propsBegin, node.propsEnd, propBuffer.begin(), [&lastEscaped](const char& byte) {
		lastEscaped = byte == static_cast<char>(Node::ESCAPE) && !lastEscaped;
		return !lastEscaped;
	});
	props.init(&propBuffer[0], std::distance(propBuffer.begin(), escapedPropEnd));
	return true;
}

} //namespace OTB
