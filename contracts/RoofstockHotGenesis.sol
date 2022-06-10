// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./HomeOwnershipToken.sol";

/// @custom:security-contact security@roofstock.com
contract RoofstockHotGenesis is HomeOwnershipToken {
    function initialize()
        initializer
        public
    {
        __HomeOwnershipToken_init(
            "Roofstock - Home Ownership Token - Genesis",
            "RHOTG",
            "https://onchain.roofstock.com/metadata/"
        );
    }
}
