// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { Strings } from "@openzeppelin/contracts/utils/Strings.sol";

/**
 * @title XueMembershipNFT
 * @dev Extends ERC721 Non-Fungible Token Standard basic implementation
 */
contract XueMembershipNFT is ERC721, Ownable {
    using Strings for uint256;

    mapping(address => uint256) public addressToTokenId;

    string public baseURI;
    uint256 public nextTokenId = 1;
    bool public revealed;
    string public notRevealedURI;
    string public baseExtension = ".json";

    /**
     * @dev Initializes the contract by setting a `notRevealedURI` and the token collection name and symbol.
     * @param notRevealedURI_ URI to be used before the baseURI is set
     */
    constructor(string memory notRevealedURI_) ERC721("XueDAO Core Contributor", "XueDAO") Ownable(msg.sender) {
        notRevealedURI = notRevealedURI_;
    }

    /**
     * @dev Sets the base URI for the token metadata
     * @param baseURI_ The base URI to be set
     */
    function setBaseURI(string memory baseURI_) external onlyOwner {
        baseURI = baseURI_;
        revealed = true;
    }

    /**
     * @dev Toggles the reveal state
     */
    function switchRevealed() external onlyOwner {
        revealed = !revealed;
    }

    /**
     * @dev Airdrops tokens to a list of addresses
     * @param addresses List of addresses to receive tokens
     */
    function airdrop(address[] memory addresses) public onlyOwner {
        for (uint256 i = 0; i < addresses.length; ++i) {
            require(addressToTokenId[addresses[i]] == 0, "Already minted");
            _safeMint(addresses[i], nextTokenId);
            addressToTokenId[addresses[i]] = nextTokenId;
            nextTokenId++;
        }
    }

    /**
     * @dev Returns the token URI for a given token ID
     * @param tokenId The token ID to query
     * @return The token URI
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(ownerOf(tokenId) != address(0), "ERC721Metadata: URI query for nonexistent token");

        if (!revealed) {
            return notRevealedURI;
        }

        return string(abi.encodePacked(baseURI, tokenId.toString(), baseExtension));
    }
}
