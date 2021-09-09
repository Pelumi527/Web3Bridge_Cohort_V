pragma solidity ^0.8.1;

contract Transfer {
    address admin;

    constructor(address _admin) {
        admin = _admin;
    }

    struct CLUB {
        string club;
        uint256 age;
        address addr;
        uint256 jerseyno;
        string name;
    }

    mapping(address => CLUB) userInfo;

    event UserCreated(
        address addr,
        string name,
        uint256 _age,
        uint256 jerseyno,
        string club
    );

    event Update(
        string oldclub,
        uint256 oldjersey,
        string newclub,
        uint256 newjersey
    );

    event AdminChanged(address oldAdmin, address newAdmin);

    modifier onlyAdmin() {
        require(msg.sender == admin, "access Denied");
        _;
    }

    function registerPlayer(
        string memory _name,
        uint256 _age,
        address _addr,
        string memory _club,
        uint256 _jerseyno
    ) public onlyAdmin {
        CLUB storage user = userInfo[_addr];
        user.name = _name;
        user.age = _age;
        user.addr = _addr;
        user.club = _club;
        user.jerseyno = _jerseyno;

        emit UserCreated(_addr, _name, _age, _jerseyno, _club);
    }

    function PlayerDetails(address _addr)
        public
        view
        onlyAdmin
        returns (CLUB memory)
    {
        return userInfo[_addr];
    }

    function ChangedClub(
        address _addr,
        string memory _club,
        uint256 _jerseyno
    ) public onlyAdmin {
        string memory oldclub = userInfo[_addr].club;
        uint256 oldJersey = userInfo[_addr].jerseyno;
        userInfo[_addr].club = _club;
        userInfo[_addr].jerseyno = _jerseyno;
        emit Update(oldclub, oldJersey, _club, _jerseyno);
    }

    function changeAdmin(address newAdmin) public onlyAdmin {
        address oldAdmin = admin;
        admin = newAdmin;
        emit AdminChanged(oldAdmin, newAdmin);
    }
}
