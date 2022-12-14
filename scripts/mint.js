require("@nomiclabs/hardhat-ethers");
require('dotenv').config();
console.log(process.env);

console.log("CONTRACT_ADDRESS: " + process.env.CONTRACT_ADDRESS);

const contract = require("../artifacts/contracts/NFTRandomSVG.sol/CharacterRandomGenerator.json");
const contractInterface = contract.abi;
const contractAddress = process.env.CONTRACT_ADDRESS;

let provider = ethers.provider;

const privateKey = process.env.PRIVATE_KEY;
console.log("privateKey: " + privateKey);
const wallet = new ethers.Wallet(privateKey);

wallet.provider = provider;
const signer = wallet.connect(provider);

const nft = new ethers.Contract(
  contractAddress,
  contractInterface,
  signer
);

const main = () => {
  console.log("Waiting for 5 blocks to confirm...");
  nft
    .CreateRandonCharacterNFT("patata")
    .then((tx) => tx.wait(5))
    .then((receipt) => console.log(`Confirmed! Your transaction receipt is: ${receipt.transactionHash}`))
    .catch((e) => console.log("Something went wrong", e));
};

main();