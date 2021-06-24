import './App.css';
import React, {useState} from 'react';
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
import Registrarse from './Components/Registrarse';


const base_URL ="http://localhost:8000";

const App =()=> {
  const [idUser, setUser] = useState()
  return (
      <Router>
        <div >
          {/*Seleccion de vistas*/}
          <Switch>
            {/*Peticion onload={getDatos}*/}
            <Route exact  path="/"><Loading/></Route>
            <Route exact  path="/inicio"><Inicio url={base_URL}/></Route>
            <Route exact path="/login"><Login url={base_URL} idUsuario={setUser}/></Route>
            <Route exact path ="/usuario"  url={base_URL} ><Usuario url={base_URL}/></Route>
            <Route exact path ="/registrarse"><Registrarse url={base_URL} idUser={idUser}/></Route>
          </Switch>
        </div>
      </Router>
  );

}

export default App;
