// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

abstract contract ERC721Burnable is Initializable, ERC721Upgradeable, AccessControlUpgradeable {
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    function __ERC721Burnable_init() internal onlyInitializing {
        _grantRole(BURNER_ROLE, msg.sender);
    }

    function burn(uint256 tokenId)
        public
        virtual
        onlyRole(BURNER_ROLE)
    {
        //solhint-disable-next-line max-line-length
        _burn(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721Upgradeable, AccessControlUpgradeable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
