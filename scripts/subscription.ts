import { ethers } from "hardhat";

async function main() {
  const _tokenAddress = "0x07F293c402F4C86b2A9d04753Ed775C7E39ee577";
  const oneMonthCost = 50;
  const twelveMonthCost = 600;

  const subscribtion = await ethers.getContractFactory("VeedioSubscribtion");
  const Subscription = await subscribtion.deploy(
    _tokenAddress,
    oneMonthCost,
    twelveMonthCost,
  );

  await Subscription.deployed();

  console.log(`subscriotion contract deployed at address: ${Subscription.address} with 
  tokenaddress of ${_tokenAddress}, monthly subscription cost: ${oneMonthCost}chillsToken 
  and yearly subscription of ${twelveMonthCost}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
