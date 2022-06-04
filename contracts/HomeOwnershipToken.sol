// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "./extensions/ERC721AdminApprovalGrantorOnly.sol";
import "./extensions/ERC721BaseURI.sol";
import "./extensions/ERC721Burnable.sol";
import "./extensions/ERC721Mintable.sol";
import "./extensions/ERC721Pausable.sol";
import "./extensions/ERC721TransferrerOnly.sol";

contract HomeOwnershipToken is Initializable, ERC721Upgradeable, ERC721EnumerableUpgradeable, AccessControlUpgradeable, ERC721AdminApprovalGrantorOnly, ERC721TransferrerOnly, ERC721BaseURI, ERC721Mintable, ERC721Pausable, ERC721Burnable {
    function __HomeOwnershipToken_init(
        string memory name,
        string memory symbol,
        string memory baseTokenURI
    ) internal onlyInitializing {
        __ERC721_init(name, symbol);
        __ERC721BaseURI_init(baseTokenURI);
        __ERC721Enumerable_init();
        __AccessControl_init();
        __ERC721Mintable_init();
        __ERC721Pausable_init();
        __ERC721Burnable_init();

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721Upgradeable, ERC721EnumerableUpgradeable, AccessControlUpgradeable, ERC721AdminApprovalGrantorOnly, ERC721BaseURI, ERC721Mintable, ERC721Pausable, ERC721Burnable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function transferFrom(address from, address to, uint256 tokenId)
        public
        override(ERC721TransferrerOnly, ERC721Upgradeable, IERC721Upgradeable)
    {
        super.transferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data)
        public
        override(ERC721TransferrerOnly, ERC721Upgradeable, IERC721Upgradeable)
    {
        super.safeTransferFrom(from, to, tokenId, _data);
    }

    function approve(address to, uint256 tokenId)
        public
        override(ERC721AdminApprovalGrantorOnly, ERC721Upgradeable, IERC721Upgradeable)
    {
        super.approve(to, tokenId);
    }

    function setApprovalForAll(address operator, bool approved)
        public
        override(ERC721AdminApprovalGrantorOnly, ERC721Upgradeable, IERC721Upgradeable)
    {
        return super.setApprovalForAll(operator, approved);
    }

    function isApprovedForAll(address owner, address operator)
        public
        view
        override(ERC721AdminApprovalGrantorOnly, ERC721Upgradeable, IERC721Upgradeable)
        returns (bool)
    {
        return super.isApprovedForAll(owner, operator);
    }

    function _approve(address to, uint256 tokenId)
        internal
        override(ERC721AdminApprovalGrantorOnly, ERC721Upgradeable)
    {
        super._approve(to, tokenId);
    }

    function _setApprovalForAll(
        address owner,
        address operator,
        bool approved
    )
        internal 
        override(ERC721AdminApprovalGrantorOnly, ERC721Upgradeable)
    {
        super._setApprovalForAll(owner, operator, approved);
    }

    function _baseURI()
        internal
        view
        override(ERC721BaseURI, ERC721Upgradeable)
        returns (string memory)
    {
        return super._baseURI();
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override(ERC721Upgradeable, ERC721EnumerableUpgradeable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }
}
