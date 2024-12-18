// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Vm} from "forge-std/Vm.sol";

/// @notice Chain IDs for the various networks.
library Chains {
    uint256 internal constant Ethereum = 1;
    uint256 internal constant Goerli = 5;
    uint256 internal constant Optimism = 10;
    uint256 internal constant Crab = 44;
    uint256 internal constant Pangoro = 45;
    uint256 internal constant Darwinia = 46;
	uint256 internal constant BSC = 56;
	uint256 internal constant Gnosis = 100;
    uint256 internal constant Polygon = 137;
    uint256 internal constant Zksync = 324;
    uint256 internal constant OptimismGoerli = 420;
    uint256 internal constant Koi = 701;
	uint256 internal constant Moonbeam = 1284;
	uint256 internal constant Morph = 2818;
	uint256 internal constant Astar = 3776;
    uint256 internal constant Mantle = 5000;
    uint256 internal constant Base = 8453;
    uint256 internal constant Arbitrum = 42161;
	uint256 internal constant Avalanche = 43114;
	uint256 internal constant Zircuit = 48900;
	uint256 internal constant Linea = 59144;
    uint256 internal constant Mumbai = 80001;
    uint256 internal constant Blast = 81457;
    uint256 internal constant BaseSepolia = 84532;
    uint256 internal constant ArbitrumGoerli = 421613;
    uint256 internal constant ArbitrumSepolia = 421614;
    uint256 internal constant Scroll = 534352;
    uint256 internal constant Sepolia = 11155111;
    uint256 internal constant OptimismSepolia = 11155420;
    Vm constant vm = Vm(address(bytes20(uint160(uint256(keccak256("hevm cheat code"))))));

    function toChainName(uint256 chainid) internal pure returns (string memory) {
        if (chainid == Ethereum) {
            return "ethereum";
        } else if (chainid == Goerli) {
            return "goerli";
        } else if (chainid == Optimism) {
            return "optimism";
        } else if (chainid == Crab) {
            return "crab";
        } else if (chainid == Pangoro) {
            return "pangoro";
        } else if (chainid == Darwinia) {
            return "darwinia";
        } else if (chainid == BSC) {
            return "bsc";
        } else if (chainid == Gnosis) {
            return "gnosis";
        } else if (chainid == Polygon) {
            return "polygon";
        } else if (chainid == Zksync) {
            return "zksync";
        } else if (chainid == OptimismGoerli) {
            return "optimism-goerli";
        } else if (chainid == Koi) {
            return "koi";
        } else if (chainid == Moonbeam) {
            return "moonbeam";
        } else if (chainid == Morph) {
            return "morph";
        } else if (chainid == Astar) {
            return "astar";
        } else if (chainid == Mantle) {
            return "mantle";
        } else if (chainid == Base) {
            return "base";
        } else if (chainid == Arbitrum) {
            return "arbitrum";
        } else if (chainid == Avalanche) {
            return "avalanche";
        } else if (chainid == Linea) {
            return "linea";
        } else if (chainid == Zircuit) {
            return "zircuit";
        } else if (chainid == Mumbai) {
            return "mumbai";
        } else if (chainid == Blast) {
            return "blast";
        } else if (chainid == BaseSepolia) {
            return "base-sepolia";
        } else if (chainid == ArbitrumGoerli) {
            return "arbitrum-goerli";
        } else if (chainid == ArbitrumSepolia) {
            return "arbitrum-sepolia";
        } else if (chainid == Scroll) {
            return "scroll";
        } else if (chainid == Sepolia) {
            return "sepolia";
        } else if (chainid == OptimismSepolia) {
            return "optimism-sepolia";
        } else {
            return vm.toString(chainid);
        }
    }

    function isL2(uint256 chainid) internal pure returns (bool) {
        if (chainid == Ethereum) {
            return false;
        } else {
            return true;
        }
    }
}
