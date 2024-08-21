//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console2} from "forge-std/Test.sol";
import {Base_TestV1, IHorseStore, HorseStore} from "./Base_TestV1.t.sol";

contract HorseStoreSolc is Base_TestV1 {
    function setUp() public override {
        horseStore = IHorseStore(address(new HorseStore()));
    }
}
