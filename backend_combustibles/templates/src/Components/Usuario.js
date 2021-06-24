import React, {useState, useEffect} from 'react';
import PropTypes from 'prop-types';
import {Link} from "react-router-dom";
import {
  makeStyles, 
  AppBar, 
  Typography, 
  Button, 
  Avatar, 
  Card, 
  CardContent,
  Tab, 
  Tabs, 
  Box,
  Grid
} from '@material-ui/core';
import axios from 'axios';
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
  card: {
    padding: 20,
    width: '90%',
    margin: "20px auto",
  },
  avatar:{
    display: 'flex',
    top: 15,
    //backgroundColor:'#3055a7',
    margin: theme.spacing(2),
  },
  button:{
    display:'inline-block',
    width: '190px',
    marginLeft:'75%',
    //right: 100,
  },
  button1: {
    display:'inline-block',
    position: "absolute",
    top: 30,
    right: 100,
    margin: '4px',
    align: 'right',
    background:'#E5ECFF',
  },
  button2: {
    display:'inline-block',
    position: "absolute",
    top: 30,
    right: 30,
    margin: '4px',
    align: 'right',
    background:'#E5ECFF',
  },
  title:{
    display: 'inline-block',
    postion:'right',
    margin: '-38px 0 0 65px',
  },
}));

const Usuario = (props) => {
  const classes = useStyle()
  const [value, setValue] = useState(0);
  const [usuario, setUsuario] =useState([]);
  const [ultimosDatos, setUltimo] =useState([]);
  const [historial, setHistorial]= useState([])
  const handleChange = (event, newValue) => {
    setValue(newValue);
  };  

  
  const consultarInicio = async()=>{
    let formData=new FormData();
    formData.append("dui",localStorage["idUsuario"])
    axios.post(props.url+"/consulta", formData).then((res)=>{
        setUsuario(res.data);
      }).catch(err=>{
        window.alert("Ocurrio un error al traer la informacion del usuario")
      })
    axios.post(props.url+"/ultimoscalculos", formData).then((res)=>{
      if(res.data.descripcion){
        setUltimo(res.data);
      }
    }).catch(err=>{
      window.alert("Ocurrio un error al traer los ultimos calculos")
    })
    axios.post(props.url+"/historialusuario", formData).then((res)=>{
      setHistorial(res.data);
    }).catch(err=>{
      window.alert("Ocurrio un error al traer su historial")
    })      
  }
  useEffect(() => {
    document.title="Gestion Combustibles";  
    consultarInicio();
    console.log(localStorage["idUsuario"])
    // eslint-disable-next-line
  },[]);


  const cerrarSesion = async() =>{
    localStorage.clear();
    axios.post(props.url+"/jsoncerrarsesion").then((res)=>{

    })
  }

  return (
    <div className={classes.root}>
      <Grid container="fixed" fullWidth>
        <AppBar color="primary" style={{heigth:'300px'}}position="static">
          <Avatar className={classes.avatar} ></Avatar>
          {usuario[0] !==undefined &&<Typography className={classes.title} variant="h5">Bienvenido a su historial {usuario[0].nombres} {usuario[0].apellidos}
          <br/>
          {localStorage["idUsuario"] === "10000001" &&<Button className={classes.button1} color="secundary">Ingresar Precio</Button>}
          <Link to="/">
            <Button className={classes.button2}color="secundary" onClick={cerrarSesion}>Salir</Button>
          </Link>
          <br/>
          </Typography>}
        </AppBar>
        <Card className={classes.card}>
          <CardContent>
            <Tabs value={value} onChange={handleChange} aria-label="simple tabs example" align="center">
              <Tab label="Historial de precios" {...a11yProps(0)} />
              <Tab label="Graficos" {...a11yProps(1)} />
              <Tab label="Crear modelos" {...a11yProps(1)} />
            </Tabs>
            <TabPanel value={value} index={0}>
              <Typography style={{display:"block"}} variant="h5">Historial de Ajuste
              <Button className={classes.button} align="right" color="primary">Eliminar</Button>
              </Typography>
              {ultimosDatos.length===0 && <Typography variant="h8">No hay registros </Typography>}
              {ultimosDatos.length!==0 &&<Tarjeta zona={ultimosDatos[1]}/>}
              {ultimosDatos.length!==0 &&<Tarjeta zona={ultimosDatos[0]}/>}
              {ultimosDatos.length!==0 &&<Tarjeta zona={ultimosDatos[2]}/>}
              <br/>
              <br/>
              <Typography variant="h5">Tabla del historial</Typography>
              <br/>
              {historial.length===0 && <Typography variant="h8">No hay registros </Typography>}
              {historial.length !==0 &&<Tabla prediccion={historial}/>}
            </TabPanel>
            <TabPanel value={value} index={1}>
              <Grafico/>
            </TabPanel>
            <TabPanel value={value} index={1}>
            </TabPanel>
          </CardContent>
        </Card>
      </Grid>
    </div>
  );
}
export default Usuario;
