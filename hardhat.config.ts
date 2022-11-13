import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require('dotenv').config();
console.log(process.env);

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
}); 

const config: HardhatUserConfig = {
  solidity: "0.8.17",
  paths: { tests: "tests" },
};

export default config;


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545",
      /*
        notice no mnemonic here? it will just use account 0 of the hardhat node to deploy
        (you can put in a mnemonic here to set the deployer locally)
      */
    },
    hardhat: {
      chainId: 1337, // We set 1337 to make interacting with MetaMask simpler
      gas: 1800000,
    },
    goerli: {
        url: `https://eth-goerli.alchemyapi.io/v2/${process.env.ALCHEMY_KEY}`,
        accounts: [process.env.PRIVATE_KEY]
    },
    Opal: {
      url: "https://rpc-opal.unique.network",
      chainId: 8882, // We set 1337 to make interacting with MetaMask simpler
      gas: 1800000,
    }
  }
};