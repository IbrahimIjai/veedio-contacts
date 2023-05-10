import { ethers } from "hardhat";

async function main() {


    const supply = 1000000;

  const chillsTOKEN = await ethers.getContractFactory("chillsToken");
  const ChillsToken = await chillsTOKEN.deploy(supply);

  await ChillsToken.deployed();

  console.log(
    `ChillsToken deployed to address: ${ChillsToken.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
