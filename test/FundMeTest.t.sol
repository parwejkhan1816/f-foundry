
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18 ; 

import {Test , console } from "forge-std/Test.sol" ; 
import {FundMe} from "../src/FundMe.sol" ; 
import  {DeployFundMe} from "../script/DeployFundMe.s.sol" ;

contract FundMeTest is Test {
    FundMe  fundme  ;
    function setUp() external {
        // fundme = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306) ; 
        DeployFundMe deployfundme = new DeployFundMe() ; 
        fundme  = deployfundme.run() ;
    
    }
    
    function testdollar() public  { 
        assertEq(fundme.MINIMUM_USD(),5e18) ; 
    }

    function testchecktheOwner() public  { 
        console.log(msg.sender) ; 
        console.log(address(this)) ; 
        assertEq(fundme.i_owner() , msg.sender ) ;
    }

    function testversion() public { 
        uint256 version = fundme.getVersion() ; 
        assertEq(version , 4 ) ; 
    }

} 