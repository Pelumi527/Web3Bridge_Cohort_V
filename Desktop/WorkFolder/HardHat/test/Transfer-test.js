const { expect } = require("chai");
const { ethers } = require("hardhat");

describe('Transfer Market', function () {
    let admin,
        addr1,
        addr2,
        FTransfer,
        ftransfer;
    

    before(async function () {
        [admin,addr1,addr2] = await ethers.getSigners();

        FTransfer = await ethers.getContractFactory("Transfer");
        ftransfer = await  FTransfer.deploy(admin.address);

        await ftransfer.deployed();

        console.log("Transfer deployed to", ftransfer.address);
    });


    it("Should the correct player details", async () => {
        let obj = ["AMadrid",23,addr1.address,8,"Saul"];
            
        await ftransfer.connect(admin).registerPlayer("Saul",23,addr1.address,"AMadrid", 8);
        const Details = await ftransfer.connect(admin).PlayerDetails(addr1.address);
        expect(Details.toString()).to.equal(obj.toString());
    });

    it("Should updatedDetails", async () => {
        let obj2 = ["Chelsea",23,addr1.address,17,"Saul"];

        await ftransfer.connect(admin).ChangedClub(addr1.address, "Chelsea", 17);
        const newDetails = await ftransfer.connect(admin).PlayerDetails(addr1.address);
        expect(newDetails.toString()).to.equal(obj2.toString());
    })


    it("Should revert", async() => {
       await expect( ftransfer.connect(addr2).ChangedClub(addr1.address,"Chelsea",17)
        ).to.be.revertedWith("access Denied");
    })
});

