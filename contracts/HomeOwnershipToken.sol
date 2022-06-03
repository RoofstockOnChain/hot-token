// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "./ERC721ApprovalNotSupported.sol";
import "./ERC721BaseURI.sol";
import "./ERC721Burnable.sol";
import "./ERC721Mintable.sol";
import "./ERC721Pausable.sol";

contract HomeOwnershipToken is Initializable, ERC721Upgradeable, ERC721EnumerableUpgradeable, AccessControlUpgradeable, ERC271ApprovalNotSupported, ERC721BaseURI, ERC721Mintable, ERC721Pausable, ERC721Burnable {
    bytes32 public constant TRANSFERRER_ROLE = keccak256("TRANSFERRER_ROLE");

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
        _grantRole(TRANSFERRER_ROLE, msg.sender);
    }

    // The following functions make it so only Transferrers can do transfers

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    )
        public
        virtual
        override(ERC721Upgradeable, IERC721Upgradeable)
        onlyRole(TRANSFERRER_ROLE)
    {
        _transfer(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    )
        public
        virtual
        override(ERC721Upgradeable, IERC721Upgradeable)
        onlyRole(TRANSFERRER_ROLE)
    {
        safeTransferFrom(from, to, tokenId, "");
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    )
        public
        virtual
        override(ERC721Upgradeable, IERC721Upgradeable)
        onlyRole(TRANSFERRER_ROLE)
    {
        _safeTransfer(from, to, tokenId, _data);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721Upgradeable, ERC721EnumerableUpgradeable, AccessControlUpgradeable, ERC721BaseURI, ERC721Mintable, ERC721Pausable, ERC721Burnable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function approve(address to, uint256 tokenId)
        public
        override(ERC271ApprovalNotSupported, ERC721Upgradeable, IERC721Upgradeable)
    {
        return super.approve(to, tokenId);
    }

    function getApproved(uint256 tokenId)
        public
        view
        override(ERC271ApprovalNotSupported, ERC721Upgradeable, IERC721Upgradeable)
        returns (address)
    {
        return super.getApproved(tokenId);
    }

    function isApprovedForAll(address owner, address operator)
        public
        view
        override(ERC271ApprovalNotSupported, ERC721Upgradeable, IERC721Upgradeable)
        returns (bool)
    {
        return super.isApprovedForAll(owner, operator);
    }

    function setApprovalForAll(address operator, bool approved)
        public
        override(ERC271ApprovalNotSupported, ERC721Upgradeable, IERC721Upgradeable)
    {
        return super.setApprovalForAll(operator, approved);
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
