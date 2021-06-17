import React,{useState} from 'react';
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
import {Link} from "react-router-dom";
import Tarjeta  from "./VistasInicio/TarjetasPrecios";
import Tabla from './VistasInicio/Tabla';
//import MapaSalvador from '../';

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

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
  },
  button:{
    position: 'absolute',
    right: '50px',
    top: '25px',
    background:'#E5ECFF',
  },
}));

const Inicio = (props) => {
  const classes = useStyles();
  const [value, setValue] = useState(0);
  const [zonas, setZonas]= useState([]);
  const [prediccion, setPrediccion] = useState([]);
  const [periodo, setPeriodo] = useState([]);

  const getTablaInicial = async() =>{
    axios.get(props.url+"/jsonprediccion").then((res)=>{
      setPrediccion([...prediccion, ...res.data]);
    })
    axios.get(props.url+"/jsonperiodo").then((res)=>{
      setPeriodo([...periodo, ...res.data]);
    })
  }

  const getZonas = async()=>{
    axios.get(props.url+"/jsonzonas").then((res)=>{
      const z=res.data;
      setZonas([...zonas, ...z]);
    })
  }

  const handleChange = (event, newValue) => {
    setValue(newValue);

  };
  
  return (
    <div className={classes.root} onLoad={getZonas}>
      {/*Barra de superior */}
      <AppBar position="static" onLoad ={getZonas} style={{ background: "#2E3B55" }}> 
        <Toolbar className={classes.toolbar}>
          <h1 className={classes.h1} align="center">
          Precios de los combustibles El Salvador
          </h1>
          <Link to="/login">
            <Button className={classes.button} variant="outlined" color="primary" >Iniciar sesion</Button>
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
        {/*Precios por zonas impresos*/}
        {zonas.map((z) =>(
          <Tarjeta zona={z} />
        ))}
      </TabPanel>
      <TabPanel value={value} index={1}>
        Tabla de Historial
        <Tabla prediccion ={prediccion} periodo={periodo}/>
      </TabPanel>
      <TabPanel value={value} index={2}>
        Graficos
      </TabPanel>
    </div>
  );
}
export default Inicio;
