import React,{useState, useEffect} from 'react';
import PropTypes from 'prop-types';
import axios from "axios";
import { 
    makeStyles,
    AppBar,
    Tabs,
    Tab,
    Typography,
    Box,
    Toolbar,
    Button
 } from '@material-ui/core';
import {
  Link
} from "react-router-dom";
import Tarjeta  from "./VistasInicio/TarjetasPrecios";
import Tabla from './VistasInicio/Tabla';
import MapaSalvador from '../Media/MapaSalvadorZonas.png';

//Funciones secundarias de la app bara
function TabPanel(props) {
  const { children, value, index, ...other } = props;

  return (
    <div
      role="tabpanel"
      hidden={value !== index}
      id={`simple-tabpanel-${index}`}
      aria-labelledby={`simple-tab-${index}`}
      {...other}
    >
      {value === index && (
        <Box p={3}>
          <Typography>{children}</Typography>
        </Box>
      )}
    </div>
  );
}

TabPanel.propTypes = {
  children: PropTypes.node,
  index: PropTypes.any.isRequired,
  value: PropTypes.any.isRequired,
};

function a11yProps(index) {
  return {
    id: `simple-tab-${index}`,
    'aria-controls': `simple-tabpanel-${index}`,
  };
}

//Estilo css
const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
  },
  button:{
    position: 'absolute',
    width:'10%',
    right: '50px',
    top: '25px',
    background:'#E5ECFF',
  },
  media:{
    display:'block',
    position:'relative',
    width:'40%',
    top: '30%',
    left: '28%',
  },
}));

const Inicio = (props) => {
  const classes = useStyles();
  const [value, setValue] = useState(0);
  const [prediccion, setPrediccion] = useState([]);
  const [periodo, setPeriodo] = useState([]);
  const [zonas, setZonas] = useState([]);

  //Hace una peticion de los periodos e el historial de la tabla 
  const getTablaInicial = async() =>{
    axios.get(props.url+"/jsonhistorial").then((res)=>{
      setPrediccion(res.data);
    })
    axios.get(props.url+"/jsonperiodo").then((res)=>{
      setPeriodo(res.data);
    })
  }

  //Hace una peticion de los precios que se encuentran vigentes
  const getDatosVigentes = async()=>{
    axios.get(props.url+"/jsonpreciosvigentes").then((res)=>{
      const z=res.data;
      setZonas(z);
    })
  }

  //Cambios previos a que la pagina se cargue o se monte el componente
  useEffect(() => {
    document.title="Inicio";   
    getDatosVigentes();
  }, []);

  //Ayuda a dar tamaño a la appbar
  const handleChange = (event, newValue) => {
    setValue(newValue);
  };
  
  //Vista a renderizarse
  return (
    <div className={classes.root}>
      {/*Barra de superior */}
      <AppBar position="static" style={{ background: "#303F9F" }}> 
        <Toolbar className={classes.toolbar}>
          <h1 className={classes.h1} align="center">
          Precios de los combustibles El Salvador
          </h1>
          <Link to="/login">
            <Button className={classes.button} variant="contained" >Iniciar sesion</Button>
          </Link>
          <hr/>
        </Toolbar>
        <Tabs value={value} onChange={handleChange} aria-label="simple tabs example" align="center">
          <Tab label="Precios por zona"  {...a11yProps(0)} />
          <Tab label="Historial de precios" onClick={getTablaInicial}  {...a11yProps(1)} />
          <Tab label="Graficos" {...a11yProps(2)} />
        </Tabs>
      </AppBar>
      <TabPanel value={value} index={0}>
        <img className={classes.media} src={MapaSalvador} alt="Mapa de El Salvador"/>
        <br/>
        <br/>
        {zonas[0] !== undefined && <Tarjeta zona={zonas[0]}/>}
        {zonas[1] !== undefined && <Tarjeta zona={zonas[1]}/>}
        {zonas[2] !== undefined && <Tarjeta zona={zonas[2]}/>}
      </TabPanel>
      <TabPanel value={value} index={1}>
        <Tabla prediccion ={prediccion} periodo={periodo} url ={props.url}/>
      </TabPanel>
      <TabPanel value={value} index={2}>
        Graficos
      </TabPanel>
    </div>
  );
}
export default Inicio;
