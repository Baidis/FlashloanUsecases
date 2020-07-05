pragma solidity ^0.5.0;

import "https://github.com/mrdavey/ez-flashloan/blob/remix/contracts/aave/FlashLoanReceiverBase.sol";
import "https://github.com/mrdavey/ez-flashloan/blob/remix/contracts/aave/ILendingPool.sol";
import "https://github.com/mrdavey/ez-flashloan/blob/remix/contracts/aave/ILendingPoolAddressesProvider.sol";



// PROVIDER ADDRESS: 0x506B0B2CF20FAA8f38a4E2B524EE43e1f4458Cc5

//DAI ADDRESS: 0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD
// 1 dai = 1000000000000000000(Due to 18 decimal number)

//USDC ADDRESS: 0xe22da380ee6B445bb8273C81944ADEB6E8450422
// 1 USDC = 1000000 (Due to 6 decimal number)

//TUSD ADDRESS: 0x1c4a937d171752e1313D70fb16Ae2ea02f86303e
// 1 TUSD = 1000000000000000000 (Due to 18 decimal number)

//USDT ADDRESS: 0x13512979ADE267AB5100878E2e0f485B568328a4
// 1 USDT = 1000000 (Due to 6 decimal number)

//SUSD ADDRESS: 0xD868790F57B39C9B2B51b12de046975f986675f9
// 1 SUSD = 1000000 (Due to 6 decimal number)

//BUSD ADDRESS: 0x4c6E1EFC12FDfD568186b7BAEc0A43fFfb4bCcCf 
// 1 BUSD = 1000000000000000000000 (Due to 18 decimal number)

//BAT ADDRESS: 0x2d12186Fbb9f9a8C28B3FfdD4c42920f8539D738
// 1 BAT = 1000000000000000000000 (Due to 18 decimal number)

//KNC ADDRESS: 0x3F80c39c0b96A0945f9F0E9f55d8A8891c5671A8
// 1 KNC = 1000000000000000000000 (Due to 18 decimal number)

//LEND ADDRESS: 0x1BCe8A0757B7315b74bA1C7A731197295ca4747a
// 1 LEND = 1000000000000000000000 (Due to 18 decimal number)

//LINK ADDRESS: 0xAD5ce863aE3E4E9394Ab43d4ba0D80f419F61789
// 1 LINK = 1000000000000000000000 (Due to 18 decimal number)

//MANA ADDRESS: 0x738Dc6380157429e957d223e6333Dc385c85Fec7
// 1 MANA = 1000000000000000000000 (Due to 18 decimal number)

//MKR ADDRESS: 0x61e4CAE3DA7FD189e52a4879C7B8067D7C2Cc0FA
// 1 MKR = 1000000000000000000000 (Due to 18 decimal number)

//REP ADDRESS: 0x260071C8D61DAf730758f8BD0d6370353956AE0E
// 1 REP = 1000000000000000000000 (Due to 18 decimal number)

//SNX ADDRESS: 0x7FDb81B0b8a010dd4FFc57C3fecbf145BA8Bd947
// 1 SNX = 1000000000000000000000 (Due to 18 decimal number)

//WBTCADDRESS: 0x3b92f58feD223E2cB1bCe4c286BD97e42f2A12EA
// 1 WBTC = 1000000000000000000000 (Due to 18 decimal number)

//ZRX ADDRESS: 0xD0d76886cF8D952ca26177EB7CfDf83bad08C00C
// 1 ZRX = 1000000000000000000000 (Due to 18 decimal number)



contract MyfirstFlashLoan is FlashLoanReceiverBase(address(0x506B0B2CF20FAA8f38a4E2B524EE43e1f4458Cc5)) {
  function flashLoan(uint256 newamount, address _token) external {
    bytes memory _params = "0x0";
    address exchangeAddress = addressesProvider.getLendingPool();
    ILendingPool exchange = ILendingPool(exchangeAddress);

    exchange.flashLoan(address(this), _token, newamount, _params);
  }

  function executeOperation(
    address _reserve,
    uint256 _amount,
    uint256 _fee,
    bytes calldata _params
  ) external {
    // INSERT YOUR USE CASE HERE

    uint256 totalDebt = _amount.add(_fee);
    transferFundsBackToPoolInternal(_reserve, totalDebt);
  }
}
