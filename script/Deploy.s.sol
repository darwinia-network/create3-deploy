// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {stdJson} from "forge-std/StdJson.sol";
import {Script} from "forge-std/Script.sol";

import {Common} from "./Common.s.sol";
import {CREATE3Factory} from "../src/CREATE3Factory.sol";

contract Deploy is Common {
    using stdJson for string;

    address immutable ADDR = 0x00029DD3018fd919e7f04D1De4b61549304BD19d;
    bytes32 immutable SALT = 0x14060b2cf12bb9d46d0c4d9dd64699ce730b0ebc9a377d4a84280110a8b22a67;

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
