const { deployProxy, upgradeProxy } = require("@openzeppelin/truffle-upgrades");

const HomeOwnershipToken = artifacts.require("HomeOwnershipToken");

module.exports = async function (deployer) {
  try {
    var instance = await HomeOwnershipToken.deployed();
    var upgraded = await upgradeProxy(instance.address, HomeOwnershipToken, {
      deployer,
    });
    console.log("Upgraded", upgraded.address);
  } catch {
    var instance = await deployProxy(HomeOwnershipToken, [], { deployer });
    console.log("Deployed", instance.address);
  }
  await deployProxy(HomeOwnershipToken);
  deployer.deploy(HomeOwnershipToken);
};
