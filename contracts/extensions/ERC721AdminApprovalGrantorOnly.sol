// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

abstract contract ERC721AdminApprovalGrantorOnly is ERC721Upgradeable, AccessControlUpgradeable {
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => bool) private _operatorApprovals;

    function approve(address to, uint256 tokenId) public virtual override(ERC721Upgradeable) {
        _checkRole(DEFAULT_ADMIN_ROLE);

        _approve(to, tokenId);
    }

    function setApprovalForAll(address operator, bool approved) public virtual override(ERC721Upgradeable) {
        _checkRole(DEFAULT_ADMIN_ROLE);

        _setApprovalForAll(_msgSender(), operator, approved);
    }

    function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {
        owner;
        return _operatorApprovals[operator];
    }

    function _approve(address to, uint256 tokenId) internal virtual override {
        _tokenApprovals[tokenId] = to;
        emit Approval(ERC721Upgradeable.ownerOf(tokenId), to, tokenId);
    }

    function _setApprovalForAll(
        address approvalGrantor,
        address operator,
        bool approved
    ) internal virtual override {
        _operatorApprovals[operator] = approved;
        emit ApprovalForAll(approvalGrantor, operator, approved);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721Upgradeable, AccessControlUpgradeable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
