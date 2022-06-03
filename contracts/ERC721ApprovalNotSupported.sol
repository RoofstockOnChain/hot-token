// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";

error NotSupported();

abstract contract ERC271ApprovalNotSupported is ERC721Upgradeable {
    function approve(address to, uint256 tokenId) public virtual override(ERC721Upgradeable) {
        to;
        tokenId;
        revert NotSupported();
    }

    function getApproved(uint256 tokenId) public view virtual override(ERC721Upgradeable) returns (address) {
        tokenId;
        revert NotSupported();
    }

    function isApprovedForAll(address owner, address operator) public view virtual override(ERC721Upgradeable) returns (bool) {
        owner;
        operator;
        revert NotSupported();
    }

    function setApprovalForAll(address operator, bool approved) public virtual override(ERC721Upgradeable) {
        operator;
        approved;
        revert NotSupported();
    }
}
