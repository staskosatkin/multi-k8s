import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link} from 'react-router-dom';
import OtherPage from "./OtherPage";
import Fib from "./Fib";

function App() {
  return (
      <Router>
        <div className="App">
          <div>
              <h1>Fib calculator version 1</h1>
              <h2>With changes</h2>
              <Link to="/">Home</Link>
              <Link to="/otherpage">Other Page</Link>
          </div>
          <div>
            <Route exact path="/" component={Fib} />
            <Route path="/otherpage" component={OtherPage} />
          </div>
        </div>
      </Router>
  );
}

export default App;
