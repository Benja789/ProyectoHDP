import React, {useState, useEffect} from 'react';
import PropTypes from 'prop-types';
import {useForm} from "react-hook-form";
import {Link} from "react-router-dom";
import {
  makeStyles, 
  AppBar, 
  Typography, 
  Button, 
  Avatar, 
  Card, 
  CardContent,
  TextField,
  Tab, 
  Tabs, 
  Menu,
  MenuItem,
  FormHelperText,
  Box,
  Grid
} from '@material-ui/core';
import axios from 'axios';
import Tabla from './VistasUsuario/TablaUsuario'
import Tarjeta from './VistasInicio/TarjetasPrecios'
import Grafico from './VistasInicio/Grafico';
import TablaPeriodo from './VistasInicio/TablaPeriodo';

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
  error:{
      display: 'block',
      margin: theme.spacing(1),
      color:"#FA3227",
  }
}));

const Usuario = (props) => {
  const classes = useStyle()
  const [value, setValue] = useState(0);
  const [usuario, setUsuario] =useState([]);
  const [ultimosDatos, setUltimo] =useState([]);
  const [historial, setHistorial]= useState([]);
  const [periodo, setPeriodo] = useState([]);
  const [graficaCentral, setCentral]= useState();
  const [graficaOccidental, setOccidental]= useState();
  const [graficaOriental, setOriental] =useState();
  const [anchorEl, setAnchorEl] = useState(null);
  const [zonaSeleccionada, setZona]=useState();
  const {register, formState:{errors}, handleSubmit} = useForm();
  const [errorZ, setError] =useState(false);
  const zonas=[
    "Zona Occidental",
    "Zona Central",
    "Zona Oriental"
  ]
  var selectedIndex;

  useEffect(() => {
    document.title="Gestion Combustibles";  
    consultarInicio();
    // eslint-disable-next-line
  },[]);
  
  //Redimensiona el boton
  const handleChange = (event, newValue) => {
    setValue(newValue);
  };  
  
  const getPeriodo =async()=>{
    axios.get(props.url+"/jsonperiodo").then((res)=>{
      setPeriodo(res.data);
    }).catch(err=>{
      window.alert("No se han podido traer los datos relacionados con el periodo");
    })
  }

  //Manda a trare los datos del usuario
  const consultarInicio = async()=>{
    let formData=new FormData();
    formData.append("dui",localStorage["idUsuario"])
    axios.post(props.url+"/jsonconsulta", formData).then((res)=>{
      setUsuario(res.data);
     }).catch(err=>{
      window.alert("Ocurrio un error al traer la informacion del usuario")
    })
    axios.get(props.url+"/jsonpreciosvigentes").then((res)=>{  
      if (res.data.length>0){
        setUltimo(res.data);
      }
    }).catch(err=>{
      window.alert("Ocurrio un error al traer los ultimos calculos")
    })
    axios.post(props.url+"/jsonhistorialusuario", formData).then((res)=>{
      setHistorial(res.data);
    }).catch(err=>{
      window.alert("Ocurrio un error al traer su historial")
    })      
  }
  
  //Manda a traer los datos para las graficas
  const graficasData = async()=>{
    resetear()
    let formData=new FormData();
    formData.append("dui",localStorage["idUsuario"])
    axios.post(props.url+"/jsoncentralusuario", formData).then((res)=>{  
      setCentral(res.data);
    }).catch(err=>{
      window.alert("Ocurrio un error al traer los ultimos calculos")
    })
    axios.post(props.url+"/jsonoccidentalusuario", formData).then((res)=>{  
      setOccidental(res.data);
    }).catch(err=>{
      window.alert("Ocurrio un error al traer los ultimos calculos")
    })
    axios.post(props.url+"/jsonorientalusuario", formData).then((res)=>{  
      setOriental(res.data);
    }).catch(err=>{
      window.alert("Ocurrio un error al traer los ultimos calculos")
    })
    getPeriodo();
  }

  //Cierra sesion
  const cerrarSesion = async() =>{
    localStorage.clear();
    axios.post(props.url+"/jsoncerrarsesion").then((res)=>{

    })
  }

  //Resetea el boton de seleccionar zona
  const resetear =()=>{
    setZona(undefined);
    setError(false);
  }

  //Cierre del menu
  const handleClose =async (event, index) => {
    setAnchorEl(null);
  };
  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };      

  //Almacena el valor de la zona
  const guardarZona =(index)=>{
    setZona(zonas[index]);
  }

  const enviarDatos = async (data)=>{
    if (zonaSeleccionada !== undefined){
      var formData = new FormData();
      formData.append("zona", zonaSeleccionada);
      formData.append("butano",data.butano);
      formData.append("dui",localStorage["idUsuario"]);
      formData.append("fob",data.fob);
      formData.append("marino", data.marino);
      formData.append("mayorista", data.mayorista);
      formData.append("minorista", data.minorista);
      formData.append("unl87", data.unl87);
      formData.append("unl93", data.unl93);
      axios.post(props.url+"/jsongenerarmodelo", formData).then((res)=>{
        window.alert(res.data.resultado);
      }).catch((err)=>{
        window.alert("No se ha podido enviar su modelo, intentelo mas tarde")
      })
    }
    else{
      setError(true);
    }
  }

  return (
    <div className={classes.root}>
      <Grid container="fixed" fullWidth>
        <AppBar color="primary" style={{heigth:'300px'}}position="static">
          <Avatar className={classes.avatar} ></Avatar>
          {usuario[0] !==undefined &&<Typography className={classes.title} variant="h5">Bienvenido a su historial {usuario[0].nombres} {usuario[0].apellidos}
          <br/>
          <Link to="/">
            <Button className={classes.button2}color="secundary" onClick={cerrarSesion}>Salir</Button>
          </Link>
          <br/>
          </Typography>}
        </AppBar>
        <Card className={classes.card}>
          <CardContent>
            <Tabs value={value} onChange={handleChange} aria-label="simple tabs example" align="center">
              <Tab label="Historial de precios" onClick={(event) =>{resetear(); consultarInicio();}} {...a11yProps(0)} />
              <Tab label="Graficos" onClick={graficasData} {...a11yProps(1)} />
              <Tab label="Crear modelos" {...a11yProps(2)} />
            </Tabs>
            <TabPanel value={value} index={0}>
              <Typography style={{display:"block"}} variant="h5">Historial de Ajuste
              </Typography>
              {ultimosDatos.length===0 && <Typography variant="h8">No hay registros </Typography>}
              {ultimosDatos.length!==0 &&<Tarjeta zona={ultimosDatos[1]}/>}
              {ultimosDatos.length!==0 &&<Tarjeta zona={ultimosDatos[0]}/>}
              {ultimosDatos.length!==0 &&<Tarjeta zona={ultimosDatos[2]}/>}
              <br/>
              <br/>
              <Typography variant="h5">Tabla del historial</Typography>
              {historial.length===0 && <Typography variant="h8">No hay registros </Typography>}
              {historial.length !==0 &&<Tabla url ={props.url} prediccion={historial}/>}
            </TabPanel>
            <TabPanel value={value}  index={1}>
              <Grafico zona={graficaOccidental} nombre={"Occidental"}/>
              <br/>
              <Grafico zona={graficaCentral} nombre={"Central"}/>
              <br/>
              <Grafico zona={graficaOriental} nombre={"Oriental"}/>
              <br/>
              <TablaPeriodo periodo={periodo}/>
            </TabPanel>
            <TabPanel value={value} index={2}>
              <Typography variant="h5">Complete los campos, para poder hacer su calculo</Typography>
              <br/>
              <form onSubmit={handleSubmit(enviarDatos)} >
                <Grid container>
                  <Grid item xs={12}>
                    {zonaSeleccionada === undefined &&<Button  aria-controls="simple-menu" aria-haspopup="true" variant="outlined" onClick={handleClick}>Selecciona una zona</Button>}
                    {zonaSeleccionada !== undefined &&<Button  aria-controls="simple-menu" aria-haspopup="true" variant="outlined" onClick={handleClick}>{zonaSeleccionada}</Button>}
                    <Menu
                      id="simple-menu"
                      anchorEl={anchorEl}
                      keepMounted
                      open={Boolean(anchorEl)}
                      onClose={handleClose}>
                      {zonas.map((p,index)=>(
                        <MenuItem 
                          key={index}     
                          selected={index === selectedIndex}
                          onClick={(event)=>{               
                            guardarZona(index);
                            handleClose(event,index);}}
                        >{p}</MenuItem>
                      ))}</Menu>
                      <Button variant="outlined" type ='submit' >Generar modelo</Button>
                      {errorZ ===true &&<FormHelperText className={classes.error}>Seleccione la zona que desea generar modelo</FormHelperText>  }
                    </Grid>
                  </Grid>
                  <br/>
                  <Grid item xs={12} sm={6}>
                    <Typography variant="p">Ingrese el percio del FOB:</Typography>
                  </Grid>
                  <Grid item xs={12} sm={6}>
                    <TextField
                      label="FOB"
                      className={classes.text}
                      name="fob"
                      {...register("fob",{
                        required:{
                          value:true,
                          message:"Campo obligatorio, ingrese el fob"
                        }
                      })}/>
                      <FormHelperText className={classes.error}>{errors?.fob?.message}</FormHelperText>  
                  </Grid>
                  <br/>
                  <Grid item xs={12} sm={6}>
                    <Typography variant="p">Ingrese el precio promedio de 6 meses del Platt´s UNL-87 : </Typography>
                  </Grid>
                  <Grid item xs={12} sm={6}>
                    <TextField
                      label="Platt´s UNL-87 "
                      className={classes.text}
                      name="unl87"
                      {...register("unl87",{
                        required:{
                          value:true,
                          message:"Campo obligatorio, ingrese el UNL - 87"
                        }
                      })}/>
                      <FormHelperText className={classes.error}>{errors?.unl87?.message}</FormHelperText>  
                  </Grid>
                  <br/>
                  <Grid item xs={12} sm={6}>
                    <Typography variant="p">Ingrese el precio promedio de 6 meses del Platt´s UNL-93 : </Typography>
                  </Grid>
                  <Grid item xs={12} sm={6}>
                    <TextField
                      label="Platt´s UNL-93 "
                      className={classes.text}
                      name="unl93" 
                    {...register("unl93",{
                      required:{
                        value:true,
                        message:"Campo obligatorio, ingrese el UNL-93"
                      }
                    })}/>
                    <FormHelperText className={classes.error}>{errors?.unl93?.message}</FormHelperText>  
                  </Grid>
                  <br/>
                  <Grid item xs={12} sm={6}>
                    <Typography variant="p">Ingrese el precio promedio de 6 meses Platt´s butano normal Mt.Belvieu : </Typography>
                  </Grid>
                  <Grid item xs={12} sm={6}>
                    <TextField
                      label="Platt´s butano"
                      className={classes.text}
                      name="butano"
                      {...register("butano",{
                        required:{
                          value:true,
                          message:"Campo obligatorio, ingrese el valor del butano"
                        }
                      })}/>
                      <FormHelperText className={classes.error}>{errors?.butano?.message}</FormHelperText>  
                  </Grid>
                  <br/>
                  <Grid item xs={12} sm={6}>
                    <Typography variant="p">Ingrese el el monto del flete maritimo : </Typography>
                  </Grid>
                  <Grid item xs={12} sm={6}>
                    <TextField
                      label="Flete marino"
                      className={classes.text}
                      name="marino"
                      {...register("marino",{
                        required:{
                          value:true,
                          message:"Campo obligatorio, ingrese el valor del flete marino"
                        }
                      })}/>
                      <FormHelperText className={classes.error}>{errors?.marino?.message}</FormHelperText>  
                  </Grid>
                  <br/>
                  <Grid item xs={12} sm={6}>
                    <Typography variant="p">Ingrese el el monto del margen mayorista : </Typography>
                  </Grid>
                  <Grid item xs={12} sm={6}>
                    <TextField
                      label="Margen mayorista"
                      className={classes.text}
                      name="mayorista"
                      {...register("mayorista",{
                        required:{
                          value:true,
                          message:"Campo obligatorio, ingrese el monto del margen mayorista"
                        }
                      })}/>
                      <FormHelperText className={classes.error}>{errors?.mayorista?.message}</FormHelperText>  
                  </Grid>
                  <br/>
                  <Grid item xs={12} sm={6}>
                    <Typography variant="p">Ingrese el el monto del margen minorista : </Typography>              
                  </Grid>
                  <Grid item xs={12} sm={6}>
                    <TextField
                      label="Margen minorista"
                      className={classes.text}
                      name="minorista"
                      {...register("minorista",{
                        required:{
                          value:true,
                          message:"Campo obligatorio, ingrese el monto del margen minorista"
                        }
                      })}/>
                      <FormHelperText className={classes.error}>{errors?.minorista?.message}</FormHelperText>  
                  </Grid>
                </form>
            </TabPanel>
          </CardContent>
        </Card>
      </Grid>
    </div>
  );
}
export default Usuario;
