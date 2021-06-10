import './App.css';
import React from 'react';
//import axios from "axios";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link  
} from "react-router-dom";
import {
  makeStyles,
  AppBar, 
  Toolbar,
  Button
} from "@material-ui/core";
//import LogoESA from "./Media/Logo El Salvador.png"

//Vistas
import Inicio from "./Components/Inicio";


const base_URL ="prueba";

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
  },
  h1: {
    display: "inline-block",
  },
  button:{
    position: 'absolute',
    //width: '1440px',
    //height: '72px',
    right: '50px',
    top: '25px',
    background:'#E5ECFF',
    //margin: '30px auto',
    //position: 'right',
    //align:'right',
    //width: 'calc(100% - 50px)',
    //height: '200px',
  },
}));

const App=()=> {
  const classes = useStyles();
  return (
      <Router>
        <div >
          {/*Barra de superior */}
          <AppBar position="static" style={{ background: "#2E3B55" }}>
            <Toolbar className={classes.toolbar}>
              <h1 className={classes.h1} align="center">
                Precios de los combustibles El Salvador
              </h1>
              <Button className={classes.button} variant="outlined" color="primary" >Iniciar sesion</Button>
              <hr/>
            </Toolbar>
          </AppBar>

          {/*Seleccion de vistas*/}
          <Switch>
            <Route exact path="/"><Inicio url={base_URL}/></Route>
          </Switch>
        </div>
      </Router>
  );
}

export default App;
