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
    function increaseAllowance(address,uint256) public returns (bool){
        proxyCall();
    }

    /**
     * @dev Change the minimum and maximum amount that can be burned at once.
     * Burning may be disabled by setting both to 0 (this will not be done
     * under normal operation, but we can't add checks to disallow it without
     * losing a lot of flexibility since burning could also be as good as disabled
     * by setting the minimum extremely high, and we don't want to lock
     * in any particular cap for the minimum)
     *  _min minimum amount that can be burned at once
     *  _max maximum amount that can be burned at once
     */
    function setBurnBounds(uint256,uint256) external {
        proxyCall();
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address,address) public returns (uint256) {
        proxyCall();
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address,uint256) public returns (bool) {
        proxyCall();
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address) public returns (uint256) {
        proxyCall();
    }

    /**
     * @dev Destroys `amount` tokens from `msg.sender`, reducing the
     * total supply.
     *  amount amount of tokens to burn
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     * Emits a {Burn} event with `burner` set to `msg.sender`
     *
     * Requirements
     *
     * - `msg.sender` must have at least `amount` tokens.
     *
     */
    function burn(uint256) external {
        proxyCall();
    }

    function burnMax() public returns (uint256) {
        proxyCall();
    }

    function burnMin() public returns (uint256) {
        proxyCall();
    }

    function canBurn(address) public returns (bool) {
        proxyCall();
    }

    /**
     * @dev Allows the pendingOwner address to finalize the transfer.
     */
    function claimOwnership() public {
        proxyCall();
    }

    function decimals() public returns (uint8) {
        proxyCall();
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
    function decreaseAllowance(address,uint256) public returns (bool) {
        proxyCall();
    }

    function name() public returns (string memory) {
        proxyCall();
    }

    function owner() public returns (address) {
        proxyCall();
    }

    function pendingOwner() public returns (address) {
        proxyCall();
    }

    /**
     * @dev send all eth balance in the contract to another address
     *  _to address to send eth balance to
     */
    function reclaimEther(address payable) external {
        proxyCall();
    }

    /**
     * @dev send all token balance of an arbitrary erc20 token
     * in the contract to another address
     *  token token to reclaim
     *  _to address to send eth balance to
     */
    function reclaimToken(address,address) external {
        proxyCall();
    }

    function symbol() public returns (string memory) {
        proxyCall();
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public returns (uint256) {
        proxyCall();
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address, uint256) public returns (bool) {
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
    function transferFrom(address,address,uint256) public returns (bool) {
        proxyCall();
    }

    /**
     * @dev Allows the current owner to set the pendingOwner address.
     *  newOwner The address to transfer ownership to.
     */
    function transferOwnership(address) public {
        proxyCall();
    }
}
