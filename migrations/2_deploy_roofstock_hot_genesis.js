const { deployProxy } = require("@openzeppelin/truffle-upgrades");

const HomeOwnershipToken = artifacts.require("HomeOwnershipToken");

module.exports = async function (deployer) {
  await deployProxy(HomeOwnershipToken, [], { deployer });
};
