//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {HorseStore} from "../../src/horseStoreV1/HorseStore.sol";
import {Test, console2} from "forge-std/Test.sol";
import {IHorseStore} from "../../src/horseStoreV1/IHorseStore.sol";

abstract contract Base_TestV1 is Test {
    IHorseStore public horseStore;

    function setUp() public virtual {
        bytes memory bytecode = hex"5f3560e01c8063cdfead2e1460245763e026c01714601b575f80fd5b5f545f5260205ff35b602436106032576004355f55005b5f80fd";
        
        address deployedAddress;
        assembly {
            mstore(0x80, bytecode)
            deployedAddress := create(0, 0x80, 0x36)
        }
        
        require(deployedAddress != address(0), "Deployment failed!");
        
        horseStore = IHorseStore(address(deployedAddress));
    }

    function testReadValue() public {
        uint256 initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, 0);
    }

    function testWriteValue() public {
        uint256 valueToWrite = 13;
        horseStore.updateHorseNumber(valueToWrite);

        assertEq(valueToWrite, horseStore.readNumberOfHorses());
    }
}