// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

abstract contract ERC721Pausable is Initializable, ERC721Upgradeable, AccessControlUpgradeable, PausableUpgradeable {
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    function __ERC721Pausable_init()
        internal
        onlyInitializing
    {
        __Pausable_init();
        
        _grantRole(PAUSER_ROLE, msg.sender);
    }

    function pause()
        public
        onlyRole(PAUSER_ROLE)
    {
        _pause();
    }

    function unpause()
        public
        onlyRole(PAUSER_ROLE)
    {
        _unpause();
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        virtual
        override
        whenNotPaused
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721Upgradeable, AccessControlUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
