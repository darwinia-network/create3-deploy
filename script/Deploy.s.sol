// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {stdJson} from "forge-std/StdJson.sol";
import {Script} from "forge-std/Script.sol";

import {Common} from "./Common.s.sol";
import {CREATE3Factory} from "../src/Create3Factory.sol";

contract Deploy is Common {
    using stdJson for string;

    address immutable ADDR = 0x00C5bd1C749CE01017547eaa8E6154BfEEdd7547;
    bytes32 immutable SALT = 0xbd899e20184b046e23234817dbfb7f2430e17806ad266bc65e66d9d18460b4e1;

    function name() public pure override returns (string memory) {
        return "Deploy";
    }

    function setUp() public override {
        super.setUp();
    }

    function run() public {
        deploy();
    }

    function deploy() public broadcast returns (address) {
        bytes memory initCode = type(CREATE3Factory).creationCode;
        address factory = _deploy2(SALT, initCode);
        require(factory == ADDR, "!addr");
        return factory;
    }
}
