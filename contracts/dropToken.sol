pragma solidity ^0.6.0;

interface IToken {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract customDropToken { // transfer msg.sender token to recipients per approved drop amount
    function customDropTKN(uint256 amount, address tokenAddress, address[] memory recipients) public {
        IToken token = IToken(tokenAddress);
        uint256 amounts = amount / recipients.length;
        for (uint256 i = 0; i < recipients.length; i++) {
	     token.transferFrom(msg.sender, recipients[i], amounts);
        }
    }
}
