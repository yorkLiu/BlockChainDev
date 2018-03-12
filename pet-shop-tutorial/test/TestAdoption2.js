/**
 * Created by yongliu on 3/9/18.
 */

var adoption = artifacts.require("../contracts/Adoption.sol");

contract('2nd adoption', async() => {
  it('Adoption of pet ID 8 should be recorded', async() => {
    let instance = await adoption.deployed();
    let returnedId = await instance.adopt.call(8);
    assert.equal(returnedId, 8, 'Adoption of pet ID 8 should be recorded')
  })
});
