// Copyright 2015 The go-ethereum Authors
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
// the main Ethereum network.
var MainnetBootnodes = []string{
	// Ethereum Foundation Go Bootnodes
	"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@52.231.74.146:50505", // genNode1
	"enode://7769cf0bdb7edd8dd95e590b46f950b9bd9625d681ec6123b31d3be58f1f1e0531d9811ccd9c1ad5d52a73999c6da2131943ca02666e238b1f265a1cc64dcae7@52.231.35.75:50505",  // genNode2
	"enode://98dc06dffe8d399b2b51e56dd1d600fd64c8efc1d4c1ebb80a844a42615d3bc7b05c450d854208d345646b573089c9a9923ddb6b8a45bf4b4f990454d7f4c496@52.226.16.248:50505", // us-east

	// Ethereum Foundation C++ Bootnodes
	//"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@52.231.74.146:50505", // DE
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
}

// DiscoveryV5Bootnodes are the enode URLs of the P2P bootstrap nodes for the
// experimental RLPx v5 topic-discovery network.
var DiscoveryV5Bootnodes = []string{
	"enode://f2c298eee215cefa930b5280e665a38b2706be3120c302b9fcb48dc7d3ceba3a3e7bac354dccbbcbc3bfd177882b0d5498f36833dfcd5674225adb19dd04ec3a@1.1.1.1:50507",
	"enode://7769cf0bdb7edd8dd95e590b46f950b9bd9625d681ec6123b31d3be58f1f1e0531d9811ccd9c1ad5d52a73999c6da2131943ca02666e238b1f265a1cc64dcae7@1.1.1.1:50508",
	"enode://07c7baac71f398dce3fae3d75632eabf5c31b2d02fc37e2b1dd5f8ed5049ea74a7e91b311a60e72f77e0bba1943ef7ce14595ad6edde688d14223e7c9d82ee91@1.1.1.1:50509",
}
