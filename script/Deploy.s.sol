// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {stdJson} from "forge-std/StdJson.sol";
import {Script} from "forge-std/Script.sol";

import {Common} from "./Common.s.sol";
import {CREATE3Factory} from "../src/CREATE3Factory.sol";

contract Deploy is Common {
    using stdJson for string;

    address immutable ADDR = 0x009dE19E34bEcDF5712f65526d8B94699B3dbD3c;
    bytes32 immutable SALT = 0x548e32bb34689c11111a919c23632943df0c003b96eebe84a7bcdcb8fd50261b;

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
