// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.21 <0.9.0;

import { BaseScript } from "./Base.s.sol";

import { MockERC20 } from "../src/MockERC20.sol";
import { XueMembershipNFT } from "../src/XueMembershipNFT.sol";

/// @dev See the Solidity Scripting tutorial: https://book.getfoundry.sh/tutorials/solidity-scripting
contract Deploy is BaseScript {
    function run() public broadcast returns (MockERC20 token, XueMembershipNFT nft) {
        token = new MockERC20();
        nft = new XueMembershipNFT("https://xuedaoisgood.com/");

        return (token, nft);
    }
}
