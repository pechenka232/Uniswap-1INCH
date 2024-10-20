async function getGasPrice() {
    const gasPrice = await web3.eth.getGasPrice();
    console.log("Current Gas Price:", gasPrice);
}

async function getBalance(address) {
    const balance = await web3.eth.getBalance(address);
    console.log("Balance:", web3.utils.fromWei(balance, 'ether'));
}

async function sendEther(from, to, amount) {
    const transaction = await web3.eth.sendTransaction({
        from: from,
        to: to,
        value: web3.utils.toWei(amount, 'ether')
    });
    console.log("Transaction Hash:", transaction.transactionHash);
}
