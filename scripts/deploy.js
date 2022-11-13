const hre = require("hardhat");

async function main() {
  const Minter = await hre.ethers.getContractFactory("CharacterRandomGenerator");
  const minter = await Minter.deploy();
  await minter.deployed();
  console.log("Minter deployed to:", minter.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
