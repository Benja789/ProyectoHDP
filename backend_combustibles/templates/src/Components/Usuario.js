import React, {useState} from 'react';
import PropTypes from 'prop-types';
import {Link} from "react-router-dom";
import {
  makeStyles, 
  AppBar, 
  Typography, 
  Button, 
  Avatar, 
  Paper, 
  Tab, 
  Tabs, 
  Box,
  Grid
} from '@material-ui/core';
import Tabla from './VistasInicio/Tabla'
import Tarjeta from './VistasInicio/TarjetasPrecios'
import Grafico from './VistasInicio/Grafico';

function a11yProps(index) {
  return {
    id: `simple-tab-${index}`,
    'aria-controls': `simple-tabpanel-${index}`,
  };
}

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


const useStyle = makeStyles((theme) => ({
  root: {
    main:"#ff3d00"
  },
  paper: {
    padding: 20,
    height: '115vh',
    width: '90%',
    margin: "20px auto",
  },
  avatar:{
    display: 'flex',
    //backgroundColor:'#3055a7',
    margin: theme.spacing(4),
  },
  button: {
    margin: theme.spacing(1)
  },
  title:{

  },
}));

const Usuario = () => {
  const classes = useStyle()
  const [value, setValue] = React.useState(0);
  const [periodoUsuario, setPeriodo] =useState();
  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  const rows =[{
    idprediccion:1,
    idperiodo_id:12,
    fechainicio:"2021/07/12",
    fechafin:"2021/09/1",
    idzona_id:"ZORI",
    idgasolina_id:"RE02",
    precio:2.3,
    variacion:0.1
  }]
  
  const tarjeta={
    idzona: "ZCEN",
    nombrezona: "Central",
    idperiodo: 37,
    inicio: "2021/05/18",
    fin: "2021/05/31",
    especial: 3.7,
    regular: 3.51,
    diesel: 3.03,
    variacion_e: 0.06,
    variacion_r: 0.06,
    variacion_d: 0.11
  }

  return (
    <div className={classes.root}>
      <Grid container="fixed" fullWidth>
        <AppBar color="primary" position="static">
          <Avatar className={classes.avatar} ></Avatar>
          <Typography className={classes.title} variant="h5">Bienvenido a su historial
          <Button color="secundary">Ingresar Precio</Button>
          <Link to="/">
            <Button color="secundary">Salir</Button>
          </Link>
          </Typography>
        </AppBar>
        <Paper className={classes.paper} elevation={10} >
          <Tabs value={value} onChange={handleChange} aria-label="simple tabs example" align="center">
            <Tab label="Historial de precios" {...a11yProps(0)} />
            <Tab label="Graficos" {...a11yProps(1)} />
          </Tabs>
          <TabPanel value={value} index={0}>
            <Typography variant="h5">Historial de Ajuste
            <Button className={classes.button} color="primary">Crear Modelo</Button>
            <Button className={classes.button} color="primary">Eliminar</Button>
            </Typography>
            <Tarjeta zona={tarjeta}/>
            <Tarjeta zona={tarjeta}/>
            <Tarjeta zona={tarjeta}/>
            <br/>
            <br/>
            <Tabla prediccion={rows}/>
          </TabPanel>
          <TabPanel value={value} index={1}>
            <Grafico/>
          </TabPanel>
        </Paper>
      </Grid>
    </div>
  );
}
export default Usuario;
