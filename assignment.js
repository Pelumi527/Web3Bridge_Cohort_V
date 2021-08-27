const Web3= require('web3'); // import web3 for hashing the  function

const custAr = []; // an array for storing the object

class Cust {
    constructor(_name,_age){
        this.name = _name;
        this.age = _age;
        this.time = Date()
        this.hash = Web3.utils.keccak256((_name, Date()))
    }
} 


// to use this function all values must be passed has string
// returns a hash which serve has an identifier
const setCust = (name, age) => {
    const cust = new Cust(name, age);
    custAr.push(cust);
    console.log(cust.hash);
}

// the input has to be passed has a string
const findCust = (hash) => {
    let cust = custAr.find(cust => cust.hash === hash);
    console.log(cust)
}

//this does what we want to acheive the only limitation is that javaScript has no storage.
// Anytime we run the script it starts again from the beginning,