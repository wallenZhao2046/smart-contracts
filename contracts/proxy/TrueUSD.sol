// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

import {OwnedUpgradeabilityProxy} from "./OwnedUpgradeabilityProxy.sol";

/**
 * @title TrueUSD
 * @dev This is the top-level ERC20 contract, but most of the interesting functionality is
 * inherited - see the documentation on the corresponding contracts.
 */
contract TrueUSD is OwnedUpgradeabilityProxy {
    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool){
        proxyCall();
    }

    /**
     * @dev Change the minimum and maximum amount that can be burned at once.
     * Burning may be disabled by setting both to 0 (this will not be done
     * under normal operation, but we can't add checks to disallow it without
     * losing a lot of flexibility since burning could also be as good as disabled
     * by setting the minimum extremely high, and we don't want to lock
     * in any particular cap for the minimum)
     * @param _min minimum amount that can be burned at once
     * @param _max maximum amount that can be burned at once
     */
    function setBurnBounds(uint256 _min, uint256 _max) external {
        proxyCall();
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view returns (uint256) {
        proxyCallView();
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public returns (bool) {
        proxyCall();
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view returns (uint256) {
        proxyCallView();
    }

    /**
     * @dev Destroys `amount` tokens from `msg.sender`, reducing the
     * total supply.
     * @param amount amount of tokens to burn
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     * Emits a {Burn} event with `burner` set to `msg.sender`
     *
     * Requirements
     *
     * - `msg.sender` must have at least `amount` tokens.
     *
     */
    function burn(uint256 amount) external {
        proxyCall();
    }

    function burnMax() public view returns (uint256) {
        proxyCallView();
    }

    function burnMin() public view returns (uint256) {
        proxyCallView();
    }

    function canBurn(address) public view returns (bool) {
        proxyCallView();
    }

    /**
     * @dev Allows the pendingOwner address to finalize the transfer.
     */
    function claimOwnership() public {
        proxyCall();
    }

    function decimals() public pure returns (uint8) {
        proxyCallView();
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        proxyCall();
    }

    function name() public pure returns (string memory) {
        proxyCallView();
    }

    function owner() public view returns (address) {
        proxyCallView();
    }

    function pendingOwner() public view returns (address) {
        proxyCallView();
    }

    /**
     * @dev send all eth balance in the contract to another address
     * @param _to address to send eth balance to
     */
    function reclaimEther(address payable _to) external {
        proxyCall();
    }

    /**
     * @dev send all token balance of an arbitrary erc20 token
     * in the contract to another address
     * @param token token to reclaim
     * @param _to address to send eth balance to
     */
    function reclaimToken(address token, address _to) external {
        proxyCall();
    }

    function symbol() public pure returns (string memory) {
        proxyCallView();
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view returns (uint256) {
        proxyCallView();
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public returns (bool) {
        proxyCall();
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20};
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        proxyCall();
    }

    /**
     * @dev Allows the current owner to set the pendingOwner address.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public {
        proxyCall();
    }

    function proxyCallView() internal {
        address(this).staticcall(abi.encodeWithSignature("proxyCall()"));
    }
}

/**
{
	"39509351": "increaseAllowance(address,uint256)",
	"52006050": "setBurnBounds(uint256,uint256)",
	"dd62ed3e": "allowance(address,address)",
	"095ea7b3": "approve(address,uint256)",
	"70a08231": "balanceOf(address)",
	"42966c68": "burn(uint256)",
	"5c131d70": "burnMax()",
	"02d3fdc9": "burnMin()",
	"3820a686": "canBurn(address)",
	"4e71e0c8": "claimOwnership()",
	"313ce567": "decimals()",
	"a457c2d7": "decreaseAllowance(address,uint256)",
	"06fdde03": "name()",
	"8da5cb5b": "owner()",
	"e30c3978": "pendingOwner()",
	"9a6a30a4": "reclaimEther(address)",
	"88ee39cc": "reclaimToken(address,address)",
	"95d89b41": "symbol()",
	"18160ddd": "totalSupply()",
	"a9059cbb": "transfer(address,uint256)",
	"23b872dd": "transferFrom(address,address,uint256)",
	"f2fde38b": "transferOwnership(address)"
}
 */