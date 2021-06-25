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
    Button, 
    Menu, 
    CardContent,
    MenuItem,
    Card
 } from '@material-ui/core';
import {
  Link
} from "react-router-dom";
import Tarjeta  from "./VistasInicio/TarjetasPrecios";
import Tabla from './VistasInicio/Tabla';
import MapaSalvador from '../Media/MapaSalvadorZonas.png';
import Grafico from './VistasInicio/Grafico';
import TablaPeriodo from './VistasInicio/TablaPeriodo';

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
  card: {
    padding: 20,
    width: '90%',
    margin: "20px auto",
  },
  button:{
    position: 'absolute',
    width:'10%',
    right: '50px',
    top: '25px',
    background:'#E5ECFF',
  },
  paper: {
    padding: 20,
    height: '115vh',
    width: '90%',
    margin: "20px auto",
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
  const [anchorEl, setAnchorEl] = useState(null);
  const [nuevoPeriodo, setNuevoPeriodo] = useState();
  var selectedIndex;
  const meses = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
  ];
  const [central, setCentral]=useState([]);
  const[occidental, setOccidental]=useState([]);
  const[oriental, setOriental]=useState([]);

  //Obtiene los datos de la zona central
  const datosGrafica =async()=>{
    axios.get(props.url+"/jsongraficacentral").then((res)=>{
      setCentral(res.data)
    }).catch(err=>{
      window.alert("No se han podido traer los datos para la grafica de central");
    });
    axios.get(props.url+"/jsongraficaoccidental").then((res)=>{
      setOccidental(res.data)
    }).catch(err=>{
      window.alert("No se han podido traer los datos para la grafica de occidental");
    })
    axios.get(props.url+"/jsongraficaoriental").then((res)=>{
      setOriental(res.data)
    }).catch(err=>{
      window.alert("No se han podido traer los datos para la grafica de oriental");
    })
    getPeriodo();
  }

  //Hace una peticion de los periodos e el historial de la tabla 
  const getTablaInicial = async() =>{
    axios.get(props.url+"/jsonhistorial").then((res)=>{
      setPrediccion(res.data);
    }).catch(err =>{
      window.alert("No se han podido traer los datos de la tabla");
    })
    getPeriodo();
    
  }

  //Hace una peticion de los precios que se encuentran vigentes
  const getDatosVigentes = async()=>{
    axios.get(props.url+"/jsonpreciosvigentes").then((res)=>{
      setZonas(res.data);
    }).catch(err=>{
      window.alert("Los datos de los precios vigentes no se han podido traer")
    })
  }

  //Cambios previos a que la pagina se cargue o se monte el componente
  useEffect(() => {
    document.title="Inicio";  
    getDatosVigentes();
    // eslint-disable-next-line
  },[]);

  //Ayuda a dar tamaño a la appbar
  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  //Ancho del menu
  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };    

  const getPeriodo =async()=>{
    axios.get(props.url+"/jsonperiodo").then((res)=>{
      setPeriodo(res.data);
    }).catch(err=>{
      window.alert("No se han podido traer los datos relacionados con el periodo");
    })
  }

  // solicitar un periodo en especifico
  const seleccionarPeriodo = async(formData)=>{
    axios.post(props.url+"/jsonhistorial", formData).then(res=>{
      setNuevoPeriodo(res.data);
      
    }).catch(err =>{
      window.alert("Algo salio mal, no se ha podido traer el periodo seleccionado")
    })
  }
  
  //Metodo que se encarga de crear un objeto para mandarlo al servidor
  const periodoN = (index) =>{
    let formData = new FormData();
    formData.append("idperiodo", periodo[index].idperiodo);
    formData.append("fechainicio", periodo[index].fechainicio);
    formData.append("fechafin", periodo[index].fechafin);
    seleccionarPeriodo(formData);
  }

  //Metodo que se encarga de resetear la tabla
  const resetear = ()=>{
    setNuevoPeriodo(undefined);
  }
  //Cierre del menu
  const handleClose =async (event, index) => {
    setAnchorEl(null);
  };

  
  //Vista a renderizarse
  return (
    <div className={classes.root}>
      {/*Barra de superior */}
      <AppBar position="static" style={{ background: "#303F9F",height:'100px'}}> 
        <Toolbar className={classes.toolbar}>
          <h1 className={classes.h1} align="center">
          Precios de los combustibles El Salvador
          </h1>
          <Link to="/login">
            <Button className={classes.button} variant="contained" >Iniciar sesion</Button>
          </Link>
          <hr/>
        </Toolbar>
      </AppBar>

      <Card className={classes.card}>
        <CardContent>
        <Tabs value={value} onChange={handleChange} aria-label="simple tabs example" align="center">
          <Tab label="Precios por zona"  {...a11yProps(0)} />
          <Tab label="Historial de precios" onClick={getTablaInicial}  {...a11yProps(1)} />
          <Tab label="Graficos" onClick={datosGrafica} {...a11yProps(2)} />
        </Tabs>
        <TabPanel value={value} index={0}>
          <img className={classes.media} src={MapaSalvador} alt="Mapa de El Salvador"/>
          <br/>
          <br/>
          {zonas[1] !== undefined && <Tarjeta zona={zonas[1]}/>}
          {zonas[0] !== undefined && <Tarjeta zona={zonas[0]}/>}
          {zonas[2] !== undefined && <Tarjeta zona={zonas[2]}/>}
        </TabPanel>
        <TabPanel value={value} index={1}>
          <Typography variant="h5">Tabla del historial de los precios</Typography>
          <Button  aria-controls="simple-menu" aria-haspopup="true" variant="outlined" onClick={handleClick}>Selecciona Periodo</Button>
          <Button  aria-controls="simple-menu" aria-haspopup="true" variant="outlined" onClick={resetear}>Mostrar tabla inicial</Button>
          <Menu
            id="simple-menu"
            anchorEl={anchorEl}
            keepMounted
            open={Boolean(anchorEl)}
            onClose={handleClose}>
            {periodo.map((p,index)=>(
              <MenuItem 
                key={p.idperiodo}     
                selected={index === selectedIndex}
                onClick={(event)=>{
                  periodoN(index);
                  handleClose(event,index);}}
              >{
                new Date(p.fechainicio).getDate() + " "+meses[new Date(p.fechainicio).getMonth()] + " " + new Date(p.fechainicio).getFullYear()} - 
                {" "+new Date(p.fechafin).getDate() + " "+meses[new Date(p.fechafin).getMonth()] + " " + new Date(p.fechafin).getFullYear()} 
              </MenuItem>
            ))}
          </Menu>
          {nuevoPeriodo === undefined && <Tabla prediccion={prediccion}/>}
          {nuevoPeriodo!== undefined && <Tabla prediccion={nuevoPeriodo}/>}
        
        </TabPanel>
        <TabPanel value={value} index={2}>
          <Grafico zona={occidental} nombre={"Occidental"}/>
          <br/>
          <Grafico zona={central} nombre={"Central"}/>
          <br/>
          <Grafico zona={oriental} nombre={"Oriental"}/>
          <TablaPeriodo periodo={periodo}/>
        </TabPanel>
        </CardContent>
        </Card>
    </div>
  );
}
export default Inicio;
