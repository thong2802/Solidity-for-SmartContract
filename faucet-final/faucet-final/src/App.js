import './App.css';
import Web3 from "web3";
import {useState, useEffect} from 'react';

function App() {

  const [web3Api, setWeb3Api] = useState({
      provider:null,
      web3:null,
  });

  useEffect ({
    const loadProvider = async () + 
  });
  return (
    <div className="faucet-wrapper">
        <div className='faucet'>
           <div className='balance-view is-size-2'>
              Current Balance: <strong>10 ETH</strong>
           </div>
           <button class="button is-primary mr-5 ml-5">Donate</button>
           <button class="button is-danger">Withdraw</button>
        </div>
    </div>
  );
}

export default App;
