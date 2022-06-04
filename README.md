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
  - [x] Transferrer Role Transfer Only - Only addresses with the TRANSFERRER_ROLE can transfer the token. The owner of the token cannot transfer it.
  - [x] Admin Role Approval Grantor Only - Approval functions grant access for a third-party to transfer tokens. This contract only allows contract admins to add approved addresses as approver.
- [x] Base URI - Admins can set the Base URI.
- [x] Burnable - Addresses with the BURNER_ROLE can burn tokens.
- [x] Mintable - Addresses with the MINT_ROLE can mint tokens.
- [x] Pausable - Addresses with the PAUSE_ROLE can pause tokens.

## Main Contracts

- RoofstockHotGenesis - Inherits the HomeOwnershipToken contract. This is the initial contract that Roofstock will deploy to represent home ownership on Ethereum.
- HomeOwnershipToken - Inherits from all of the extensions defined below. This contract can be reused by anyone that wants to represent home ownership on Ethereum.

## Extensions

- ERC721AdminApprovalGrantorOnly - If a contract inherits from this contract, the approval functions are modified so that only an admin can grant approval access for other addresses to transfer tokens.
- ERC721BaseURI - If a contract inherits from this contract, new functions will be exposed to get and set the BaseURI for the token metadata.
- ERC721Burnable - If a contract inherits from this contract, new functions will be exposed that allow a token to be burned by a role that is created by this contract.
- ERC721Mintable - If a contract inherits from this contract, new functions will be exposed that allow a token to be minted by a role that is created by this contract.
- ERC721Pausable - If a contract inherits from this contract, new functions will be exposed that allow a contract to be paused by a role that is created by this contract.
- ERC721TransferrerOnly - If a contract inherits from this contract, only addresses that are approved can transfer. Owners themselves can no longer transfer.

## Deploy

This section will define how to deploy smart contracts to different environments.

**Rinkeby**

To deploy to Rinkeby network, run:

```
npm run migrate:rinkeby
```

To verify the contract Rinkeby network, run:

```
npm run verify:home-ownership-token:rinkeby
```
