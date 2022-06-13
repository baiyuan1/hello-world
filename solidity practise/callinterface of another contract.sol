// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/*
在同一个sol文件中没有该合约的时候如何调用它的interface（例子中的Counter）
*/





interface ICounter {
    function count() external view returns (uint); 
    function inc() external;
    function dec() external;
//召唤inferface函数，在该函数中，定义function，
//第一个函数返回一个uint，这是Counter合约中一个状态变量的存入值，根据该存入值定义一个function： count
//第二个召唤Counter中的inc（）,注意语法结构
}

/*contract Counter {
    uint public count;

    function inc () external {
        count += 1;
    }
    function dec() external {
        count -= 1;
    }
} 以上是另外一个合约要另起一个文件。
*/
contract CallInterface {
    uint public count;
    uint public countdec;
    function examples(address _counter) external {
        ICounter(_counter).inc();
        // 召唤inc（），语法： Interfaceidentifier(address).function()
        count = ICounter(_counter).count();
        //count()有返回值所以可以取值。
    }
    function examples2(address _counter) external{
        ICounter(_counter).dec();
        countdec = ICounter(_counter).count();

    }
}
