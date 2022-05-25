const HomeOwnershipToken = artifacts.require("HomeOwnershipToken");

module.exports = function (deployer) {
  deployer.deploy(HomeOwnershipToken);
};
