const LarvaMatch = artifacts.require("LarvaMatch");

module.exports = function(deployer) {
  // Command Truffle to deploy the Smart Contract
  deployer.deploy(LarvaMatch);
};