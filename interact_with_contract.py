from web3 import Web3

# Connect to Celo network using the desired provider
w3 = Web3(Web3.HTTPProvider("https://<celo-network-rpc-url>"))

# Contract address and ABI
contract_address = "<contract-address>"
contract_abi = [
    # Contract ABI goes here...
]

# Create contract instance
contract = w3.eth.contract(address=contract_address, abi=contract_abi)

# Interact with the contract
file_id = 0  # Example file ID
file_name, file_ipfs_hash, file_owner = contract.functions.getFile(file_id).call()
print("File Name:", file_name)
print("IPFS Hash:", file_ipfs_hash)
print("Owner:", file_owner)
