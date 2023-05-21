pragma solidity ^0.8.0;

contract FileSharing {
    struct File {
        string name;
        string ipfsHash;
        address owner;
        mapping(address => bool) allowedUsers;
    }

    mapping(uint256 => File) public files;
    uint256 public fileCount;

    event FileUploaded(uint256 fileId, string name, string ipfsHash, address owner);

    function uploadFile(string memory _name, string memory _ipfsHash) external {
        uint256 fileId = fileCount++;
        files[fileId] = File(_name, _ipfsHash, msg.sender);
        emit FileUploaded(fileId, _name, _ipfsHash, msg.sender);
    }

    function allowAccess(uint256 _fileId, address _user) external {
        require(files[_fileId].owner == msg.sender, "You can only allow access to your own files");
        files[_fileId].allowedUsers[_user] = true;
    }

    function getFile(uint256 _fileId) external view returns (string memory, string memory, address) {
        File storage file = files[_fileId];
        require(file.owner == msg.sender || file.allowedUsers[msg.sender], "You don't have permission to access this file");
        return (file.name, file.ipfsHash, file.owner);
    }
}
