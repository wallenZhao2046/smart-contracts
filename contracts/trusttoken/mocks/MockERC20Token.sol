// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

import {Registry} from "../../registry/Registry.sol";
import {TRC20} from "../TRC20.sol";

contract MockTRC20Token is TRC20 {
    Registry registryAddress;

    function registry() public view returns (Registry) {
        return registryAddress;
    }

    function setRegistry(Registry _registry) external {
        registryAddress = _registry;
    }

    function mint(address _to, uint256 _value) external {
        _mint(_to, _value);
    }

    function burn(uint256 _value) external {
        _burn(msg.sender, _value);
    }

    uint8 constant DECIMALS = 18;
    uint8 constant ROUNDING = 2;

    function rounding() public pure returns (uint8) {
        return ROUNDING;
    }

    function decimals() public override pure returns (uint8) {
        return DECIMALS;
    }

    function name() public override pure returns (string memory) {
        return "TrueUSD";
    }

    function symbol() public override pure returns (string memory) {
        return "TUSD";
    }
}
