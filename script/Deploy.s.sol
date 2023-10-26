// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {stdJson} from "forge-std/StdJson.sol";
import {Script} from "forge-std/Script.sol";

import {Common} from "./Common.s.sol";
import {CREATE3Factory} from "../src/CREATE3Factory.sol";

contract Deploy is Common {
    using stdJson for string;

    address immutable ADDR = 0x00b8848A3ee03CfD770037913D8e7722021F6a46;
    bytes32 immutable SALT = 0x57ce4c47260474f72b92f84772456a57f4035bae112d62e86a07ef225dded39b;

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
