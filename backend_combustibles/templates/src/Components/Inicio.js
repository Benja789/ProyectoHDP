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

  const getTablaInicial = async() =>{
    axios.get(props.url+"/jsonprediccion").then((res)=>{
      const prediccion = res.data;
      console.log(prediccion);
    })
  }


  const handleChange = (event, newValue) => {
    setValue(newValue);

  };
  
  return (
    <div className={classes.root}>
      {/*Barra de superior */}
      <AppBar position="static"  style={{ background: "#2E3B55" }}> 
        <Toolbar className={classes.toolbar}>
          <h1 className={classes.h1} align="center">
          Precios de los combustibles El Salvador
          </h1>
          <Button className={classes.button} variant="outlined" color="primary" >Iniciar sesion
            <Link to="/login"></Link>
          </Button>
          <hr/>
        </Toolbar>
        <Tabs value={value} onChange={handleChange} aria-label="simple tabs example" align="center">
          <Tab label="Precios por zona" {...a11yProps(0)} />
          <Tab label="Historial de precios" {...a11yProps(1)} />
          <Tab label="Graficos" {...a11yProps(2)} />
        </Tabs>
      </AppBar>
      <TabPanel value={value} index={0}>
        {/*Precios por zonas impresos*/}
        <Tarjeta />
        <Tarjeta />
        <Tarjeta />
      </TabPanel>
      <TabPanel value={value} onClick={getTablaInicial} index={1}>
        Tabla de Historial
        <Tabla />
      </TabPanel>
      <TabPanel value={value} index={2}>
        Graficos
      </TabPanel>
    </div>
  );
}
export default Inicio;
