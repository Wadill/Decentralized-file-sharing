// FileSharing.test.js
const FileSharing = artifacts.require("FileSharing");

contract("FileSharing", (accounts) => {
  let fileSharing;

  before(async () => {
    fileSharing = await FileSharing.deployed();
  });

  it("should upload a file and emit an event", async () => {
    const result = await fileSharing.uploadFile("Example File", "QmHash");
    const fileId = result.logs[0].args.fileId.toNumber();
    
    assert.equal(fileId, 0, "File ID should be 0");
    
    const file = await fileSharing.files(fileId);
    assert.equal(file.name, "Example File", "File name mismatch");
    assert.equal(file.ipfsHash, "QmHash", "File IPFS hash mismatch");
    assert.equal(file.owner, accounts[0], "File owner address mismatch");
  });
  
  // Add more test cases for other contract functions
});
