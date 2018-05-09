// Copyright 2016 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ethereum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ethereum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package params

// MainnetBootnodes are the enode URLs of the P2P bootstrap nodes running on
// the main ESN network.
var MainnetBootnodes = []string{
	// ESN Foundation Go Bootnodes
	"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@52.231.74.146:50505", // genNode1
	"enode://7769cf0bdb7edd8dd95e590b46f950b9bd9625d681ec6123b31d3be58f1f1e0531d9811ccd9c1ad5d52a73999c6da2131943ca02666e238b1f265a1cc64dcae7@52.231.35.75:50505",  // genNode2
	"enode://1aded60f7986b8bccce5f3c20596724ab087af2dfa618f83a9ec385a4a34230e197a5c7a53db19a50b0eba6d5a08f0e02484587084c4bb2a8ecda43c0d337838@52.231.30.39:50505",  // genNode3
	"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@52.231.74.146:50505", // AU
	"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@52.231.74.146:50505", // SG

	// ESN Foundation Cpp Bootnodes
	"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@52.231.74.146:50505", // DE
}

// TestnetBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Ropsten test network.
var TestnetBootnodes = []string{
	"enode://eece4a79e9dfa3e61209b006d97334f9310178de8efd0832f76372ab98abcc7d28ec050a1b43f03c3c5837fb4eb29e32f549f9afca38f10014d62f93de35ca45@52.170.148.239:50505", // US-TX
}

// RinkebyBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Rinkeby test network.
var RinkebyBootnodes = []string{
	"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@1.1.1.1:50505", // IE
	"enode://7769cf0bdb7edd8dd95e590b46f950b9bd9625d681ec6123b31d3be58f1f1e0531d9811ccd9c1ad5d52a73999c6da2131943ca02666e238b1f265a1cc64dcae7@1.1.1.1:50505", // INFURA
}

// RinkebyV5Bootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Rinkeby test network for the experimental RLPx v5 topic-discovery network.
var RinkebyV5Bootnodes = []string{
	"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@1.1.1.1:50505?discport=50506", // IE
	"enode://7769cf0bdb7edd8dd95e590b46f950b9bd9625d681ec6123b31d3be58f1f1e0531d9811ccd9c1ad5d52a73999c6da2131943ca02666e238b1f265a1cc64dcae7@1.1.1.1:50505?discport=50506", // INFURA
}

// DiscoveryV5Bootnodes are the enode URLs of the P2P bootstrap nodes for the
// experimental RLPx v5 topic-discovery network.
var DiscoveryV5Bootnodes = []string{
	"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@1.1.1.1:50507",
	"enode://7769cf0bdb7edd8dd95e590b46f950b9bd9625d681ec6123b31d3be58f1f1e0531d9811ccd9c1ad5d52a73999c6da2131943ca02666e238b1f265a1cc64dcae7@1.1.1.1:50508",
	"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@1.1.1.1:50509",
}
