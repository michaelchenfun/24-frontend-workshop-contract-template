// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import { PRBTest } from "@prb/test/PRBTest.sol";
import { console2 } from "forge-std/console2.sol";
import { StdCheats } from "forge-std/StdCheats.sol";

import { MockERC20 } from "../src/MockERC20.sol";

contract MockERC20Test is PRBTest, StdCheats {
    MockERC20 token;
    address owner;

    function setUp() public {
        owner = address(this);
        token = new MockERC20();
    }

    function testMint() public {
        uint256 initialBalance = token.balanceOf(owner);
        uint256 amount = 1e18; // 1 token with 18 decimals
        token.mint(amount);
        uint256 finalBalance = token.balanceOf(owner);
        assertEq(finalBalance, initialBalance + amount, "Balance should have increased by the minted amount");
    }
}
