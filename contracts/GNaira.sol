// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract G_Naira is ERC20, ERC20Burnable, AccessControl, ERC20Permit {
    bytes32 public constant GOVERNOR_ROLE = keccak256("GOVERNOR_ROLE");

    mapping (address => bool) public blacklist;
    mapping (address => bool) public connectWallet;
    mapping (address => bool) public disconnectWallet;

    constructor(address governor)
        ERC20("G_Naira", "gNGN")
        ERC20Permit("G_Naira")
    {
       
    }

    function grantRole(bytes32 role, address account) public override onlyRole(getRoleAdmin(role)) {
        _grantRole(role, account);
    }
    
    function grantGovernorRole(address governor) public {
    _grantRole(DEFAULT_ADMIN_ROLE, governor);
    _grantRole(GOVERNOR_ROLE, governor);
    }

    function mint(address to, uint256 amount) public onlyRole (GOVERNOR_ROLE) returns (bool) {
        _mint(to, amount);
        return true;
    }

     function burn(address account, uint256 amount) public onlyRole(GOVERNOR_ROLE) returns (bool){
        _burn(account, amount);
        return true;
    }

    function blacklistAddress(address addressToBlacklist) public onlyRole(GOVERNOR_ROLE) returns (bool) {
        blacklist[addressToBlacklist] = true;
        return true;
    }

    function unBlacklist(address addressToUnblacklist) public onlyRole(GOVERNOR_ROLE) returns (bool){
        blacklist[addressToUnblacklist] = false;
        return false;
    }

    function connectedWallet(address Wallet) public onlyRole(GOVERNOR_ROLE) returns (bool){
        connectWallet[Wallet] = true;
        return true;
    }

    function disconnecedtWallet(address Wallet) public onlyRole(GOVERNOR_ROLE) returns (bool){
        disconnectWallet[Wallet] = false;
        return false;
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal view {
        require(!blacklist[from], "Sender is blacklisted!");
        require(!blacklist[to], "Recipient is blacklisted!");
        require(amount >= 1, "Amount must be 1 or more !");
        require (balanceOf(msg.sender) >= amount, "Insufficient account balance for transfer!");
        }
}


