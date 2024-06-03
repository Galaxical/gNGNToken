const { ethers } = require('hardhat');
const { G_Naira } = require('../contracts/G_Naira.sol');

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account ", deployer.address);

  const Balance = deployer.await.getBalance();
  console.log("Accounts balance: ", ethers.utils.formatEther(Balance));

  const governor = '0xC1C21f7f0440f68a7C4Ed898d3dE724dD73a1F7D';
  const tx = await GNairaContract.grantGovernorRole(governor);
  await tx.wait();

  console.log('Governor role granted to:', governor);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
