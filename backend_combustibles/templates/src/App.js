import './App.css';
import React, {useState} from 'react';
import axios from "axios";
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


const base_URL ="http://localhost:8000";

class App extends React.Component {
  
  constructor(props){
    super(props);
    this.state={
      zonas :{
        idZona :"",
        nombreZona:"",
      },
    }
  }
 
  getZonas = async()=>{
    axios.get(base_URL+"/jsonzonas").then((res)=>{
      const z=res.data;
    })
  }
  
  render(){
    return (
        <Router>
          <div >
            {/*Seleccion de vistas*/}
            <Switch>
              {/*Peticion onload={getDatos}*/}
              <Route exact  path="/"><Inicio url={base_URL} /></Route>
              <Route exact path="/login"><Login /></Route>
              <Route exact path ="/usuario"><Usuario/></Route>
            </Switch>
          </div>
        </Router>
    );
  }
}

export default App;
