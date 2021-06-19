import './App.css';
import React from 'react';
import axios from "axios";
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

class App extends React.Component {
  
  constructor(props){
    super(props);
    this.state={
      zonas :{
        idzona :"",
        nombrezona:"",
      },
      loading : true,
      timeout: 0,
      vigentes:{
        idzona: "",
        idgasolina: "",
        precio: 0,
        variacion: 0,
      },
    }
  }
 
  getDatosVigentes = async()=>{
    axios.get(base_URL+"/jsonzonas").then((res)=>{
      const z=res.data;
      this.setState({zonas :z})
    })
    axios.get(base_URL+"/jsonvigentes").then((res)=>{
      this.setState({vigentes: res.data})
    })
  }

  async componentDidMount(){
    this.getDatosVigentes()
  }
  
  render(){
    return (
        <Router>
          <div >
            {/*Seleccion de vistas*/}
            <Switch>
              {/*Peticion onload={getDatos}*/}
              <Route exact  path="/"><Loading/></Route>
              <Route exact  path="/inicio"><Inicio url={base_URL} state={this.state}/></Route>
              <Route exact path="/login"><Login /></Route>
              <Route exact path ="/usuario"><Usuario/></Route>
            </Switch>
          </div>
        </Router>
    );
  }
}

export default App;
