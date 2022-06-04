# Home Ownership Token

The Home Ownership Token is a non-fungible token that represents ownership of a home.

## The Contract

The contract is a modified ERC-721 contract using the[Open Zepplin](https://www.openzeppelin.com/)wizard. We want this contract to be as close to standard as possible.

## Scripts

- `compile` - Compiles the contracts.
- `migrate:development` - Deploys the contract to the development network defined in `truffle-config.js`.
- `migrate:rinkeby` - Deploys the contract to the Rinkeby network.
- `migrate:dashboard` - If the Truffle Dashboard is running, it deploys the contract via the dashboard.
- `test` - Runs the truffle tests.
- `dashboard` - Runs the Truffle Dashboard.
- `verify:roofstock-hot-genesis:rinkeby` - Verifies the RoofstockHotGenesis contract on rinkeby.etherscan.io.

## Features

- [x] ERC721 Standard (Modified) - The Home Ownership Token contract should be a standard ERC721 contract with some modifications. The modifications are:
  - [x] Transferrer Role Only - Only addresses with the TRANSFERRER_ROLE can transfer the token. The owner of the token cannot transfer it.
  - [x] Approved not supported - Approval functions grant access for a third-party to transfer tokens. This contract does not support these functions.
- [x] Base URI - Admins can set the Base URI.
- [x] Burnable - Addresses with the BURNER_ROLE can burn tokens.
- [x] Mintable - Addresses with the MINT_ROLE can mint tokens.
- [x] Pausable - Addresses with the PAUSE_ROLE can pause tokens.

## Deploy

**Rinkeby**

To deploy to Rinkeby network, run:

```
npm run migrate:rinkeby
```

To verify the contract Rinkeby network, run:

```
npm run verify:home-ownership-token:rinkeby
```
