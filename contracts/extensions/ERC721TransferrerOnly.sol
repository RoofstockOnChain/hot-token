// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";

abstract contract ERC721TransferrerOnly is ERC721Upgradeable {
    function transferFrom(address from, address to, uint256 tokenId) public virtual override {
        require(_isApproved(_msgSender(), tokenId), "ERC721: transfer caller is not approved");
        _transfer(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public virtual override {
        require(_isApproved(_msgSender(), tokenId), "ERC721: transfer caller is not approved");
        _safeTransfer(from, to, tokenId, _data);
    }

    function _isApproved(address spender, uint256 tokenId) internal view virtual returns (bool) {
        require(_exists(tokenId), "ERC721: operator query for nonexistent token");
        address owner = ERC721Upgradeable.ownerOf(tokenId);
        return (isApprovedForAll(owner, spender) || getApproved(tokenId) == spender);
    }
}
