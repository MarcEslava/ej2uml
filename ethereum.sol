pragma solidity ^0.8;

contract Token {
    function name() public view returns (string) {return "aurecoin";}
    function symbol() public view returns (string) {return "aure";}
    function decimals() public view returns (uint8) {return 18;}
    function totalSupply() public view returns (uint256) {return total;}
    function balanceOf(address _owner) public view returns (uint256 balance){
        return balances[_owner];
    }
    function transfer(address _to, uint256 _value) public returns (bool success){
        assert(balances[msg.sender] >= amount);
        assert(blacklist[msg.sender] == false);

    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
    function approve(address _spender, uint256 _value) public returns (bool success)
    function allowance(address _owner, address _spender) public view returns (uint256 remaining)

    mapping ( address => uint ) balances;
    mapping ( address => bool) blacklist;
    address owner;

    constructor (){
        balances[msg.sender] = 10000;
        owner = msg.sender;
        total = 10000;
        emit Transfer (address(0), msg.sender(10000))
    }
   // function blacklist(address addr) public{
   //     assert(msg.sender == owner);
    //   blacklist[addr] = true;
    }
  //  function transfer(address to, uint amount) public {
   //     assert(balances[msg.sender] >= amount);
   // assert(blacklist[msg.sender] == false)
    // let comision = amount/100;
    //balances[0x8DAfd90333555c8faBAA079bA8B25dA9C16B07dB] += comision;

        balances[msg.sender] = balances[msg.sender] - amount;
        balances[to] = balances[to] - amount;
    }

}

pragma solidity ^0.8;

contract Token {

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    mapping ( address => uint ) balances;
    mapping ( address => bool ) blacklist;
    address owner;
    uint total;

    constructor() {
        total = 10000 * 10**18;
        balances[msg.sender]= total;
        owner = msg.sender;
        emit Transfer(address(0),msg.sender,total);
    }

    function name() public view returns (string memory) { return "Token prueba FP1";  }
    function symbol() public view returns (string memory) { return "FP1"; } 
    function decimals() public view returns (uint8) { return 18; }
    function totalSupply() public view returns (uint256) { return total; }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        assert(balances[msg.sender] >= _value);
        assert(blacklist[msg.sender] == false );

        balances[msg.sender] -= _value;
        balances[_to] += _value;

        emit Transfer(msg.sender,_to,_value);

        return true;
    }

    // unimplemented
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {}
    function approve(address _spender, uint256 _value) public returns (bool success) {}
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {}
  
}