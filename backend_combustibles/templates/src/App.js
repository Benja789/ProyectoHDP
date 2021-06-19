import './App.css';
import React from 'react';
import {
  BrowserRouter as Router,
  Switch,
  Route
} from "react-router-dom";

//Vistas
import Inicio from "./Components/Inicio";
import Login from "./Components/Login";
import Usuario from "./Components/Usuario";
import Loading from './Components/Loading';


const base_URL ="http://localhost:8000";

const App =()=> {
  return (
      <Router>
        <div >
          {/*Seleccion de vistas*/}
          <Switch>
            {/*Peticion onload={getDatos}*/}
            <Route exact  path="/"><Loading/></Route>
            <Route exact  path="/inicio"><Inicio url={base_URL}/></Route>
            <Route exact path="/login"><Login /></Route>
            <Route exact path ="/usuario"><Usuario/></Route>
          </Switch>
        </div>
      </Router>
  );

}

export default App;
