// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);
}

contract VeedioSubscribtion {
    struct Subscription {
        uint256 startTimestamp;
        uint256 endTimestamp;
    }

    mapping(address => Subscription) public subscriptions;
    address public tokenAddress;
    uint256 public oneMonthCost;
    uint256 public twelveMonthCost;

    constructor(
        address _tokenAddress,
        uint256 _oneMonthCost,
        uint256 _twelveMonthCost
    ) {
        tokenAddress = _tokenAddress;
        oneMonthCost = _oneMonthCost;
        twelveMonthCost = _twelveMonthCost;
    }

    function subscribeOneMonth() external {
        require(
            subscriptions[msg.sender].endTimestamp < block.timestamp,
            "Subscription is already active"
        );

        IERC20 token = IERC20(tokenAddress);
        require(
            token.transferFrom(msg.sender, address(this), oneMonthCost),
            "Failed to transfer subscription cost"
        );

        subscriptions[msg.sender] = Subscription(
            block.timestamp,
            block.timestamp + 30 days
        );
    }

    function subscribeTwelveMonths() external {
        require(
            subscriptions[msg.sender].endTimestamp < block.timestamp,
            "Subscription is already active"
        );

        IERC20 token = IERC20(tokenAddress);
        require(
            token.transferFrom(msg.sender, address(this), twelveMonthCost),
            "Failed to transfer subscription cost"
        );

        subscriptions[msg.sender] = Subscription(
            block.timestamp,
            block.timestamp + 365 days
        );
    }
}
