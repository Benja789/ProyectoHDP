import './App.css';
import React from 'react';
//import axios from "axios";
import {
  BrowserRouter as Router,
  Switch,
  Route
} from "react-router-dom";
//import LogoESA from "./Media/Logo El Salvador.png"

//Vistas
import Inicio from "./Components/Inicio";
import Login from "./Components/Login";
import Usuario from "./Components/Usuario";

const App=()=> {
  
  const base_URL ="http://localhost:8000";
/*

  const getZonas = async()=>{
    axios.get(base_URL+"/jsonzonas").then((res)=>{
      const z=res.data;
      console.log(res.data)
      setZonas(z);
      console.log(zonas);
    })
  }
*/
  return (
      <Router>
        <div >
          {/*Seleccion de vistas*/}
          <Switch>
            {/*Peticion onload={getDatos}*/}
            <Route exact  path="/"><Inicio url={base_URL}/></Route>
            <Route exact path="/login"><Login /></Route>
            <Route exact path ="/Usuario"><Usuario/></Route>
          </Switch>
        </div>
      </Router>
  );
}

export default App;
