//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// We need some util functions for strings.
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "hardhat/console.sol";
import "github.com/Arachnid/solidity-stringutils/src/strings.sol";

contract CharacterRandomGenerator is ERC721URIStorage {
  using Counters for Counters.Counter;
  using strings for *;
  Counters.Counter private _tokenIds;

  // This is our SVG code. All we need to change is the word that's displayed. Everything else stays the same.
  // So, we make a baseSvg variable here that all our NFTs can use.
  string baseSvg = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>";

  // I create three arrays, each with their own theme of random words.
  // Pick some random funny words, names of anime characters, foods you like, whatever! 
  string[] fontRand = ["Arial", "Verdana", "Tahoma", "Trebuchet MS", "Times New Roman", "Georgia","Garamond", "Courier New", "Brush Script MT", "monospace"];
  string[] colorRand = ["Red", "Green", "Blue", "Pink", "Yellow", "Black","Gray", "Coral", "DarkCyan", "DarkBlue", "Brown", "Khaki", "LightBlue", "Lavender","Indigo", "Gold", "Fuchsia", "Magenta", "Linen", "Maroon"];
  string[] nameRand = ["John", "Laura", "Clark", "Gerard", "Mary", "Lucas","Didac", "Olalla", "Patry", "Bob", "Leo", "Angelina", "Irene", "Diego","Anthony", "Aina", "Sasha", "Duke", "Leonardo", "Manuela"];
  string[] professionRand = ["Engineer", "Photographer", "Gamer", "Marketer", "Lawyer", "Journalist","Doctor", "Judge", "Accountant", "Nurse", "Writer", "Teacher", "Actor", "Musician","Vet", "Scientist", "Dentist", "Psychologist", "Nurse", "Surgeon"];
  string[] countriesRand = ["United States", "Spain", "Brasil", "Colombia", "Argentina", "China","Germany", "France", "United Kingdom", "Rusia", "Arabia Saudi", "Italy", "Portugal", "Holland","Finland", "Polonia", "Peru", "Venezuela", "Ecuador", "Chile"];
  string[] spiritRand = ["Blunt", "Bright", "Sharp", "Ambitious", "Affectionate", "Boring","Resentful", "Kind", "Fervent", "Adventurous", "Listless", "Curious", "Cynical", "Jealous","Weak", "Strong", "Polite", "Direct", "Distant", "Cold"];

  constructor() ERC721 ("CharacterRandomGenerator", "CRG") {
    console.log("This is my NFT CharacterRandomGenerator contract. Oh yeah!");
  }

  function splitArray(string calldata toSplit) pure internal returns (string[] memory) {
      strings.slice memory s = toSplit.toSlice();
      strings.slice memory delim = ",".toSlice();
      string[] memory parts = new string[](s.count(delim));
      for(uint i = 0; i < parts.length; i++) {
          parts[i] = s.split(delim).toString();
      }

      
      return parts;
  }


  //GETs and SETs Font Array
  function setFontArray(string calldata strArray) public {
    fontRand = splitArray(strArray);
  }
  function getFontArray() public view returns (string[] memory) {
    return fontRand;
  }

  //GETs and SETs Color Array
  function setColorArray(string calldata strArray) public {
    colorRand = splitArray(strArray);
  }
  function getColorArray() public view returns (string[] memory) {
    return colorRand;
  }

  //GETs and SETs Name Array
  function setNameArray(string calldata strArray) public {
    nameRand = splitArray(strArray);
  }
  function getNameArray() public view returns (string[] memory) {
    return nameRand;
  }

  //GETs and SETs Profession Array
  function setProfessionArray(string calldata strArray) public {
    professionRand = splitArray(strArray);
  }
  function getProfessionArray() public view returns (string[] memory) {
    return professionRand;
  }

  //GETs and SETs Countries Array
  function setCountriesArray(string calldata strArray) public {
    countriesRand = splitArray(strArray);
  }
  function getCountriesArray() public view returns (string[] memory) {
    return countriesRand;
  }
  
  //GETs and SETs Spirit Array
  function setSpiritArray(string calldata strArray) public {
    spiritRand = splitArray(strArray);
  }
  function getSpiritArray() public view returns (string[] memory) {
    return spiritRand;
  }

  // I create a function to randomly pick a word from each array.
  function pickRandomFontWord(uint256 tokenId, string calldata data) public view returns (string memory) {
    // I seed the random generator. More on this in the lesson. 
    uint256 rand = random(string(abi.encodePacked(data, Strings.toString(tokenId))));
    // Squash the # between 0 and the length of the array to avoid going out of bounds.
    rand = rand % fontRand.length;
    return fontRand[rand];
  }


  // I create a function to randomly pick a word from each array.
  function pickRandomColorWord(uint256 tokenId, string calldata data) public view returns (string memory) {
    // I seed the random generator. More on this in the lesson. 
    uint256 rand = random(string(abi.encodePacked(data, Strings.toString(tokenId))));
    // Squash the # between 0 and the length of the array to avoid going out of bounds.
    rand = rand % colorRand.length;
    return colorRand[rand];
  }

  // I create a function to randomly pick a word from each array.
  function pickRandomNameWord(uint256 tokenId, string calldata data) public view returns (string memory) {
    // I seed the random generator. More on this in the lesson. 
    uint256 rand = random(string(abi.encodePacked(data, Strings.toString(tokenId))));
    // Squash the # between 0 and the length of the array to avoid going out of bounds.
    rand = rand % nameRand.length;
    return nameRand[rand];
  }

  // I create a function to randomly pick a word from each array.
  function pickRandomProfessionWord(uint256 tokenId, string calldata data) public view returns (string memory) {
    // I seed the random generator. More on this in the lesson. 
    uint256 rand = random(string(abi.encodePacked(data, Strings.toString(tokenId))));
    // Squash the # between 0 and the length of the array to avoid going out of bounds.
    rand = rand % professionRand.length;
    return professionRand[rand];
  }

  function pickRandomCountriesWord(uint256 tokenId, string calldata data) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked(data, Strings.toString(tokenId))));
    rand = rand % countriesRand.length;
    return countriesRand[rand];
  }

  function pickRandomSpiritWord(uint256 tokenId, string calldata data) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked(data, Strings.toString(tokenId))));
    rand = rand % spiritRand.length;
    return spiritRand[rand];
  }

  function random(string memory input) internal pure returns (uint256) {
      return uint256(keccak256(abi.encodePacked(input)));
  }

  function CreateRandonCharacterNFT(address user, string calldata data) public {
    uint256 newItemId = _tokenIds.current();

    // We go and randomly grab one word from each of the three arrays.
    string memory font = pickRandomFontWord(newItemId, data);
    string memory name = pickRandomNameWord(newItemId, data);
    string memory color = pickRandomColorWord(newItemId, data);
    string memory profession = pickRandomProfessionWord(newItemId, data);
    string memory countries = pickRandomCountriesWord(newItemId, data);
    string memory spirit = pickRandomSpiritWord(newItemId, data);

    // I concatenate it all together, and then close the <text> and <svg> tags.
    // string memory finalSvg = string(abi.encodePacked(baseSvg, first, second, third, "</text></svg>"));

    bytes memory svg = abi.encodePacked(
    baseSvg, 
    ".base { fill: white; font-family: ", font, "; font-size: 24px; }</style><rect width='100%' height='100%'",
    " fill='", color ,"' />",
    "<text x='50%' y='20%' class='base' dominant-baseline='middle' text-anchor='middle'>", name, "</text>",
    "<text x='50%' y='40%' class='base' dominant-baseline='middle' text-anchor='middle'>", profession, "</text>",
    "<text x='50%' y='60%' class='base' dominant-baseline='middle' text-anchor='middle'>", countries, "</text>",
    "<text x='50%' y='80%' class='base' dominant-baseline='middle' text-anchor='middle'>", spirit, "</text>",
    "</svg>");

    _safeMint(user, newItemId);
  
    string memory imageStr = string(
        abi.encodePacked(
            "data:image/svg+xml;base64,",
            Base64.encode(svg)
        )    
    );
    console.log("This is the SVG: %s", string(svg));
    delete svg;


    // Get all the JSON metadata in place and base64 encode it.
    string memory json = Base64.encode(
        bytes(
            string(
                abi.encodePacked(
                    '{"name":"CityQuiz3 NFT", "image":"',
                    imageStr,
                    unicode'", "description": "This NFT marks the bound address as a member of the BuidlGuidl. The image is a fully-onchain dynamic SVG reflecting current balances of the bound wallet and builder work stream."}'
                )
            )
        )
    );

    bytes memory image = abi.encodePacked(imageStr);
    delete imageStr;

    string memory tokenURI = string(
        abi.encodePacked(
            "data:application/json;base64,",
            json
        )    
    );
    delete image;
    
    console.log("This is the tokenURI: %s", tokenURI);
    _setTokenURI(newItemId, tokenURI);

  
    _tokenIds.increment();
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
  }
}