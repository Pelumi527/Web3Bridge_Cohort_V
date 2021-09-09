const hre = require("hardhat");

  let admin,
    addr1;

async function main() {
  [admin, addr1] = await hre.ethers.getSigners()
    
  const FTransfer = await hre.ethers.getContractFactory("Transfer");
  const ftransfer = await  FTransfer.deploy(admin.address);

  await ftransfer.deployed();

  console.log("Transfer deployed to", transfer.address);

  const Playerfxn = await ftransfer.connect(admin).Player("saul",23,addr1.address,"Amadrid",8);
  const playerfxn = await Playerfxn.wait();

  console.log(playerfxn.events[0].args.toString());

  const Changedclub = await ftransfer.connect(admin).ChangedClub(addr1.address, "Chelsea",17);
  const changeclub = await Changedclub.wait();

  console.log(changeclub.events[0].args.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });