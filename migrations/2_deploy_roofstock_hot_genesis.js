const { deployProxy } = require("@openzeppelin/truffle-upgrades");

const RoofstockHotGenesis = artifacts.require("RoofstockHotGenesis");

module.exports = async function (deployer) {
  await deployProxy(RoofstockHotGenesis, [], { deployer });
};
