import { ethers } from "hardhat";

async function main() {


  const nftLamas = await ethers.deployContract("NFTlamas");

  //await nftLamas.deployed();

  console.log(`Contract deployed to ${nftLamas.address}` );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
