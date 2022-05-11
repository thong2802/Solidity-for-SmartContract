pragma solidity >= 0.7.0 < 0.9.0;

// keywork : array, mapping, enum, struct
contract Game {
    Player[] public players1;
    uint public countPlayer = 0;
    mapping (address => Player) public players;
    enum Level {Beginner, InternalMediate, Advance}

    struct Player {
        address addressPlayer;
        Level myLevel;
        string firstName;
        string lastName;
        uint createdTime;
    }

    function addPlayer(string memory firstName, string memory lastName) public {
       players[msg.sender] =  Player(msg.sender, Level.Beginner, firstName, lastName, block.timestamp);
       countPlayer += 1;
    }

    function getPlayerLevel(address addressPlayer) public view returns(Level) {
        return players[addressPlayer].myLevel;
    }

    function changeLevel(address addressPlayer) public {
        Player storage player = players[addressPlayer];
        if(block.timestamp >= player.createdTime + 15) {
            player.myLevel = Level.InternalMediate;
        }
    }
}