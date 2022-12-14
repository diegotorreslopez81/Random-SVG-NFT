# RandCharacter

<!-- Badges -->
<p>
  <a href="https://github.com/diegotorreslopez81/Random-SVG-NFT/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/diegotorreslopez81/Random-SVG-NFT" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/diegotorreslopez81/Random-SVG-NFT" alt="last update" />
  </a>
  <a href="https://github.com/diegotorreslopez81/Random-SVG-NFT/network/members">
    <img src="https://img.shields.io/github/forks/diegotorreslopez81/Random-SVG-NFT" alt="forks" />
  </a>
  <a href="https://github.com/diegotorreslopez81/Random-SVG-NFT/stargazers">
    <img src="https://img.shields.io/github/stars/diegotorreslopez81/Random-SVG-NFT" alt="stars" />
  </a>
  <a href="https://github.com/diegotorreslopez81/Random-SVG-NFT/issues/">
    <img src="https://img.shields.io/github/issues/diegotorreslopez81/Random-SVG-NFT" alt="open issues" />
  </a>
  <a href="https://github.com/diegotorreslopez81/Random-SVG-NFT/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/diegotorreslopez81/Random-SVG-NFT.svg" alt="license" />
  </a>
</p>

<h4>
    <a href="https://github.com/diegotorreslopez81/Random-SVG-NFT/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/diegotorreslopez81/Random-SVG-NFT/issues/">Request Feature</a>
  </h4>
</div>

<img src="./images/RandCharacter.png" width="">

Based on the idea of the Loot project, I want to build something similar, just creating a random character creation proof of concept. Here, the user just mints an NFT sending a seed word, and randomly, the Smart Contract generates an NFT with a Name, Profession, Country, and Personality, with different background color and font. In addition, the entries by default of every data can be modified.


[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/UyI6VuciJNg/0.jpg)](https://www.youtube.com/watch?v=UyI6VuciJNg)


:camera: Some examples of RandCharacter NFTs:


<img src="./images/nft3.svg" width="200"><img src="./images/nft2.svg" width="200"><img src="./images/nft1.svg" width="200">


## :toolbox: Prerequisites

- [Node.js](https://nodejs.org/en/download/)
- [MetaMask wallet browser extension](https://metamask.io/download.html).

## :gear: Getting Started

### Clone This Repo

Use `git clone git@github.com:diegotorreslopez81/Random-SVG-NFT.git` to get the files within this repository onto your local machine.

### Environment Setup

Duplicate `.env.example` to `.env` and fill out the `HARDHAT_CHAIN_ID` environment variable. The port from the example file, if it's free, will be fine in most cases.

Run `npm install`.

### Running The Smart Contract Locally

Compile the ABI for the smart contract using `npx hardhat compile`.

If you're successful, you'll recieve a confirmation message of:

```
Compilation finished successfully
```

And, a `src/artifacts` folder will be created in your project.

Deploy the smart contract to the local blockchain for testing with `npx hardhat node`.

If you're successful, you'll be presented with a number of account details in the CLI. Here's an example:

```
Account #0: 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 (10000 ETH)
Private Key: 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

Then in a new terminal window, `npx hardhat run scripts/deploy.js --network localhost`.

If you're successful, you'll get something like the following CLI output:

```
Minter deployed to: 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0
```

### Mint your RandCharacter

Edit the file `scripts/mint.js` and write a random word as seed to randomize the NFT: `.CreateRandonCharacterNFT("whatever")`

Finally, come back to the terminal window, and execute `npx hardhat run scripts/mint.js --network localhost`.

and you will get your NFT Character Randomize.

<!-- Roadmap -->
## :compass: Roadmap

* [x] Create the Smart Contract
* [ ] Develop the Frontend

## :star2: About the project

Please, any feedback or comment, contact me:

Diego Torres - [@0xDiegoTorres](https://twitter.com/0xDiegoTorres) 

GitHub profile: [https://github.com/diegotorreslopez81](https://github.com/diegotorreslopez81)