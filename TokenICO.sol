// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ERC20{

    function transfer (address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256); 
    function allowance (address owner, address spender) external view returns (uint256); 
    function approve(address spender, uint256 amount) external returns (bool); 
    function transferFrom (address spender, address recipient, uint256 amount) external returns (bool); 
    function symbol()external view returns (string memory); 
    function totalSupply() external view returns (uint256); 
    function name() external view returns (string memory);

}

contract TokenICO {
    address public owner;
    address public tokenAddress;
    uint256 public tokenSalePrice;
    uint256 public soldTokens;

    modifier onlyOwner() {
        require(msg.sender == owner , "only contract owner can perform this action");
        _;
    }

    constructor(){
        owner = msg.sender;
    }

    function updateToken(address _tokenAddress) public onlyOwner {

        tokenAddress = _tokenAddress;

    }
    function updateTokenSalePrice(uint256 _tokenSalePrice) public onlyOwner {

        tokenSalePrice = _tokenSalePrice;
    }

    function multiply(uint256 x, uint256 y) internal pure returns(uint256 z) {
        require(y == 0 || (z = x*y) / y==x);
    }

    function buyTokens()





}





 
