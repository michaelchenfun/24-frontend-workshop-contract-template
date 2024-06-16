// SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract MockERC20 is ERC20, Ownable {
    constructor() ERC20("MockERC20", "MOCK") Ownable(msg.sender) { }

    function mint(uint256 amount) public onlyOwner {
        require(amount > 0, "MockERC20: mint amount must be greater than zero");
        _mint(msg.sender, amount);
    }
}
