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
- `verify:home-ownership-token:rinkeby` - Verifies the HomeOwnershipToken contract on rinkeby.etherscan.io.

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
