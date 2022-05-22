const { expect } = require("chai");
const { ethers, waffle } = require("hardhat");

describe('Greeter', function () {
  let greeter;
  let address1;

  beforeEach(async function () {
    Greeter = await ethers.getContractFactory("Greeter");
    [address1] = await ethers.getSigners();
    greeter = await Greeter.deploy();
  })


  describe("receive", function () {
    it("Should send ether to contract and update the account balance mapping", async function () {

      const provider = waffle.provider;

      expect(await provider.getBalance(greeter.address)).to.equal(0);
      await address1.sendTransaction({
        to: greeter.address,
        value:100,
      });

      expect(await provider.getBalance(greeter.address)).to.equal(100);

      // expect(await greeter.greet()).to.equal("Hello, world!");

      // const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

      // // wait until the transaction is mined
      // await setGreetingTx.wait();

      // expect(await greeter.greet()).to.equal("Hola, mundo!");
    });
  });

})