var Election = artifacts.require("Election");

//earlier i had passed two arguments, election, "Candidate 1". possible exercise 
module.exports = function(deployer) {
  deployer.deploy(Election);
};


//smart contract relies heavily on the promises of js because they are asynchronous. 
 //.deployed is asynchonous - which means you cant do var app = Election.deployed() (because its a promise) 
 //we use.then for promises so that once promis is fulfilled ti will get executed. promise takes callback function where we inject the instance . then to the app variable. 
 //solidity - public variables can be called by name(). ) getter function automatically by solidity. 


  //why reset - immutable because everytime code changes, you havet to deploy new contract. migrate avoids losing all the state

  //bignumber, cant access id - why?
  //have to do .toNumber

   //WHY TEST

   //truffle bundle mocha testing framework and chai library 


   
   
