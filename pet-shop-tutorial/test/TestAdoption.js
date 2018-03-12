/**
 * Created by yongliu on 3/9/18.
 */

var adoption = artifacts.require("../contracts/Adoption.sol");

contract('adoption', function(){
  it('Adoption of pet ID 8 should be recorded', function(){
    return adoption.deployed().then(function(instance){
      return instance.adopt.call(8);
    }).then(function(returnedId){
      var expected = 8;
      console.log('returnedId:', returnedId);
      assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded")
    })
  });
  
  it('Owner of pet ID 8 should be recorded', function(){
    return adoption.deployed().then(function(instance){
      return instance.getAdopters.call()
    }).then(function(adopters){
      console.log('adopters', adopters);
      console.log('adopters[8]', adopters[8]);
    })
  });
});