//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract NFTlamas is ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter public _tokenIdCounter;

    // Maximum supply of NFTs
    uint256 public constant MAX_SUPPLY = 10000;

    // Maximum NFTs per address
    uint256 public constant MAX_PER_ADDRESS = 5;

    // Mapping to track the number of tokens minted by each address
    mapping(address => uint256) private _mintedTokensCount;

    constructor() ERC721("NFTlamas", "NFTl") {}

    function mint(uint256 _nftToMint) public {
    require(_nftToMint > 0, "Must mint at least one NFT");
    require(_tokenIdCounter.current() + _nftToMint <= MAX_SUPPLY, "Max supply would be exceeded");
    require(_mintedTokensCount[msg.sender] + _nftToMint <= MAX_PER_ADDRESS, "Max NFTs per address would be exceeded");

    for (uint256 i = 0; i < _nftToMint; i++) {
        _mintedTokensCount[msg.sender] += 1;
        _tokenIdCounter.increment();
        _safeMint(msg.sender, _tokenIdCounter.current());
    }
}

    function tokensMintedBy() public view returns (uint256) {
        return _mintedTokensCount[msg.sender];
    }
}