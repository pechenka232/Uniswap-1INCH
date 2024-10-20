const web3 = require('./web3Setup');
const abi = [ /* ABI вашего контракта */ ];
const contractAddress = '0x...'; // Адрес вашего контракта

const contract = new web3.eth.Contract(abi, contractAddress);

async function getLatestPrice() {
    const price = await contract.methods.getLatestPrice().call();
    console.log("Latest Price:", price);
}

getLatestPrice();
