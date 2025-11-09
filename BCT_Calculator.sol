// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BCT_Calculator{

    //Store the last calculated result
    uint256 public result;

    //Event to log each operation
    event Calculated(string operation,uint256 value);

    //function Add two number 
    function add(uint256 a,uint256 b) public returns (uint256) {
        result=a+b;
        emit Calculated("Addition" , result);
        return result;
    }

    //function Subtract two number
    function subtract(uint256 a,uint256 b) public returns (uint256){
        result=a-b;
        emit Calculated("Subtraction",result);
        return result;
    }

    //Multiply two number
    function multiply(uint256 a,uint256 b) public returns (uint256){
        result=a*b;
        emit Calculated("Multiplication",result);
        return result;
    }

    //Divide two number
    function divide(uint256 a,uint b) public returns (uint256){
        require(b!=0,"Division by Zero is not allowed");
        result=a/b;
        emit Calculated("Division",result);
        return result;
    }

    //Reset to result 0
    function clear() public {
        result=0;
        emit Calculated("Cleared",result);
    }

    function getResult() public view returns (uint256){
        return result;
    }
}
