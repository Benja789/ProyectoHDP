import React, {useState} from 'react';
import { 
  makeStyles,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableRow,
  Paper,
  TableContainer,
  Button, 
  Menu,
  Typography,
  MenuItem
} from '@material-ui/core';
import axios from "axios";

//Estilo css
const useStyles = makeStyles({
  table: {
    minWidth: 650,
  }, 
  button:{
    display:'block',
    position: 'absolute',
    width:'40%',
    right: '20px',
    top: '150px',
    //background:'#E5ECFF',
  },
});

const Tabla = (props) =>{
  const classes = useStyles();
  const prediccion = props.prediccion;
  const periodo = props.periodo;
  const [selectedIndex, setSelectedIndex] = React.useState(1);
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
  const [anchorEl, setAnchorEl] = useState(null);
  const [periodoElegido, setPeriodoElegido] =useState({
    idperiodo:"",
    fechainicio:"",
    fechafin:""
  })

  //Ancho del menu
  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const crearPeriodo =(index)=>{
    setPeriodoElegido(periodoElegido,periodo[index]);
  }

  // solicitar un periodo en especifico
  const seleccionarPeriodo = async(index)=>{
    //console.log(props.periodo[index]);
    let formData = new FormData();
    formData.append("idperiodo", periodoElegido.idperiodo);
    formData.append("fechainicio", periodoElegido.fechainicio);
    formData.append("fechafin", periodoElegido.fechafin);
    
    axios({
      method: "POST",
      url: props.url+"/jsonhistorial",
      headers:{
        "Content-Type": "multipart/form-data",
      },
      data: periodo[index],
    });
  }

  //Cierre del menu
  const handleClose = (event, index) => {
    setAnchorEl(null);
    seleccionarPeriodo();
  };

  //Renderizado del componente
  return (
  <div>
    <Typography variant="h5">Tabla del historial de los precios</Typography>
    <Button className={classes.button} aria-controls="simple-menu" aria-haspopup="true" onClick={handleClick}>Selecciona Periodo</Button>
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
            seleccionarPeriodo(event,index);
            handleClose(event,index);}}
        >{
          new Date(p.fechainicio).getDate() + " "+meses[new Date(p.fechainicio).getMonth()] + " " + new Date(p.fechainicio).getFullYear()} - 
          {" "+new Date(p.fechafin).getDate() + " "+meses[new Date(p.fechafin).getMonth()] + " " + new Date(p.fechafin).getFullYear()} 
        </MenuItem>
      ))}
    </Menu>
    <TableContainer component={Paper}>
      <Table className={classes.table} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell >Fecha Inicio</TableCell>
            <TableCell align="left">Fecha Fin</TableCell>
            <TableCell align="left">Zona</TableCell>
            <TableCell align="left">Tipo Combusitible</TableCell>
            <TableCell align="right">Precio</TableCell>
            <TableCell align="right">Variacion</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {prediccion.map((row) => (
            <TableRow key={row.idprediccion}>           
              <TableCell align="left">
                {new Date(row.fechainicio).getDate()} {meses[new Date(row.fechainicio).getMonth()]} {new Date(row.fechainicio).getFullYear()}
              </TableCell>
              <TableCell align="left">
              {new Date(row.fechafin).getDate()} {meses[new Date(row.fechafin).getMonth()]} {new Date(row.fechafin).getFullYear()}
              </TableCell>  
              {/*Zonas */}
              {row.idzona_id ==="ZORI" && <TableCell align ="left">Oriental</TableCell>}
              {row.idzona_id ==="ZOCC" && <TableCell align ="left">Occidental</TableCell>}
              {row.idzona_id ==="ZCEN" && <TableCell align ="left">Central</TableCell>}             
              {/*Gasolinas */}
              {row.idgasolina_id ==="DI03" && <TableCell align="left">Disiel</TableCell>}
              {row.idgasolina_id ==="RE02" && <TableCell align="left">Regular</TableCell>}
              {row.idgasolina_id ==="ES01" && <TableCell align="left">Super</TableCell>}
              <TableCell align="right">$ {row.precio}</TableCell>
              {row.variacion >0 && <TableCell style={{color:'#B03A2E',}} align="right">$ {row.variacion}</TableCell>}
              {row.variacion <0 && <TableCell style={{color:'#1D8348',}} align="right">$ {row.variacion}</TableCell>}
              {row.variacion ===0 && <TableCell align="right">{row.variacion}</TableCell>}
             
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  </div>
  );
}
export default Tabla;