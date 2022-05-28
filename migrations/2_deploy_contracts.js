const { deployProxy, upgradeProxy } = require("@openzeppelin/truffle-upgrades");

const HomeOwnershipToken = artifacts.require("HomeOwnershipToken");

module.exports = async function (deployer) {
  const upgrade = false;
  if (upgrade) {
    var instance = await HomeOwnershipToken.deployed();
    await upgradeProxy(instance.address, HomeOwnershipToken, {
      deployer,
    });
  } else {
    await deployProxy(HomeOwnershipToken, [], { deployer });
    deployer.deploy(HomeOwnershipToken);
  }
};
