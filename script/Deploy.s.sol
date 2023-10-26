// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {stdJson} from "forge-std/StdJson.sol";
import {Script} from "forge-std/Script.sol";

import {Common} from "./Common.s.sol";
import {CREATE3Factory} from "../src/CREATE3Factory.sol";

contract Deploy is Common {
    using stdJson for string;

    address immutable ADDR = 0x00e436d96884B495F955eF7B81De46B2A5DF5394;
    bytes32 immutable SALT = 0xdc5589e9ad03a349c17e5ee8f0fd316db73f37e4d6a6470c8656b9f6bf55866b;

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
