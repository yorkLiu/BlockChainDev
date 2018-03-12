pragma solidity ^0.4.4;

import "truffle/Assert.sol"; // 引入的断言
import "truffle/DeployedAddresses.sol"; // 用来获取被测试合约的地址
import "../contracts/Adoption.sol"; // 被测试合约


contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());
    // 领养测试用例
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(8);
        uint expected = 8;
        Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded");
    }

    // 宠物所有者测试用例
    function testGetGetAdapterAddressByPetId() public {
        // 期望领养者的地址就是本合约地址，因为交易是由测试合约发起交易
        address expected = this;
        address adopter = adoption.adopters(8);
        Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded");
    }

    // 测试所有领养者
    function testGetAdapterAddressByPetIdInArray() public{
        // 领养者的地址就是本合约地址
        address expected = this;
        address[16] memory adapters = adoption.getAdopters();
        Assert.equal(adapters[8], expected, "Owner of pet ID 8 should be recorded.");
    }


}
