// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;


import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@5.0.2/access/AccessControl.sol";
import "@openzeppelin/contracts@5.0.2/token/ERC20/extensions/ERC20Permit.sol";

contract G_Naira is ERC20, ERC20Burnable, AccessControl, ERC20Permit {
    bytes32 public constant GOVERNOR_ROLE = keccak256("GOVERNOR_ROLE");

    mapping (address => bool) public blacklist;
    mapping (address => bool) public connectWallet;
    mapping  (address => bool) public disconnectWallet;

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


