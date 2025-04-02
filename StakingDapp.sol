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
        uint256 lockDays;   
    }

    struct Notification{
        uint256 poolID;
        uint256 anount;
        uint256 user;
        uint256 typeOf;
        uint256 timestamp;
    }

    uint decimals = 10 ** 18;
    uint public poolCount;
    PoolInfo[] public poolInfo;

    mapping (address => uint256) public depositedTokens;
    mapping(uint256 => mapping(address => UserInfo)) public userInfo;     //check later

    Notification[] public notifications;




    function addPool(IERC20 _depositToken, IERC20 rewardToken, uint256 _apy, uint _lockdays) public onlyOwner{

        poolInfo.push(PoolInfo({
            depositToken: _depositToken,
            rewardToken: _rewardToken,
            depositedAmount: 0,
            apy: _apy,
            lockDays: _lockdays,
        }));

        poolCount++;
    } 






    function deposit(uint256 _pid, uint256 _amount) public nonReentrant{
        require(_amount > 0 , "amount should be greater then 0!");

        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = UserInfo[_pid][msg.sender];

        if(user.amount > 0){
            uint pending = _calcPendingReward(user, _pid);
            pool.rewardToken.transfer(msg.sender, pending);

            _createNotification(_pid, pending, msg.sender, "Claim");
        }

        pool.depositToken.transferFrom(msg.sender, address(this), amount);

        pool.depositedAmount += _amount;
        user.amount += _amount;
        user.lastRewardAt = block.timestamp;

        //user.lockUntil = block.timestamp + (pool.lockDays * 86400);
        user.lockUntil = block.timestamp + (pool.lockDays * 60);

        depositedTokens[address(pool.depositToken)] += _amount;

        _createNotification(_pid, _amount, msg.sender, "Deposit");
    } 






    function withdraw(uint256 _pid, uint256 _amount) public nonReentrant{

        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = UserInfo[_pid][msg.sender];

        require(user.amount >= _amount , "withdraw amount exceeded the balance");
        require(user.lockUntil <= block.timestamp, "Lock is ongoing");

        uint256 pending = _calcPendingReward(user, _pid);

        if(user.amount > 0){

            pool.rewardToken.transfer(msg.sender, pending);

            _createNotification(_pid, pending, msg.sender, "Claim");
        }

        if (_amount > 0 ) {
            user.amount -= _amount;
            pool.depositedAmount -= _amount;
            //1:06
        }


    } 



























    function _calcPendingReward(){} 

    function pendingReward(){} 

    function sweep(){} 

    function modifyPool(){}

    function claimReward(){}

    function _createNotification(){}

    function getNotifications(){}




}