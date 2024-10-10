/*
 * This file is part of OpenTTD.
 * OpenTTD is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 2.
 * OpenTTD is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with OpenTTD. If not, see <http://www.gnu.org/licenses/>.
 */

/** @file linkgraph_gui.cpp Implementation of linkgraph overlay GUI. */

#include "../safeguards.h"

/**
 * Colours for the various "load" states of links. Ordered from "unused" to
 * "overloaded".
 */
const uint8_t LinkGraphOverlay::LINK_COLOURS[][12] = {
{
	0x0f, 0xd1, 0xd0, 0x57,
	0x55, 0x53, 0xbf, 0xbd,
	0xba, 0xb9, 0xb7, 0xb5
},
{
	0x0f, 0xd1, 0xd0, 0x57,
	0x55, 0x53, 0x96, 0x95,
	0x94, 0x93, 0x92, 0x91
},
{
	0x0f, 0x0b, 0x09, 0x07,
	0x05, 0x03, 0xbf, 0xbd,
	0xba, 0xb9, 0xb7, 0xb5
},
{
	0x0f, 0x0b, 0x0a, 0x09,
	0x08, 0x07, 0x06, 0x05,
	0x04, 0x03, 0x02, 0x01
}
};

/**
 * Get a DPI for the widget we will be drawing to.
 * @param dpi DrawPixelInfo to fill with the desired dimensions.
