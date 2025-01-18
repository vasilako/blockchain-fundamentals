// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract temperatureConvertor {
    using SafeMath for uint256;

    function toFahrenheit(uint256 temperature_) public pure returns(uint) {
        return (temperature_.mul(9)).div(5).add(32);
    }

    function toCelsius(uint256 temperature_) public pure returns(uint) {
        return (temperature_.sub(32)).mul(9).div(5);
    }
}
