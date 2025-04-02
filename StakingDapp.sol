// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract StakingDapp is Ownable, ReentrancyGuard {

    using SafeERC20 from IERC20;

    struct UserInfo{
        uint256 amount;
        uint256 lastRewardAt;
        uint256 lockUntil;
    }

    struct PoolInfo{
        IERC20 depositToken;
        IERC20 rewardToken;
        uint256 depositedAmount;
        uint256 apy;
        uint256 lockDays;   //53:45min
    }

    struct Notification{}

    uint decimals = 10 ** 18;
    uint public poolCount;
    PoolInfo[] public poolInfo;

    mapping (address => uint256) public depositedTokens;
    mapping(uint256 => mapping(address => UserInfo)) public userInfo;     //check later

    Notification[] public notifications;

    function addPool(){} 
    function deposit(){} 
    function withdraw(){} 
    function _calcPendingReward(){} 
    function pendingReward(){} 
    function sweep(){} 
    function modifyPool(){}
    function claimReward(){}
    function _createNotification(){}
    function getNotifications(){}




}