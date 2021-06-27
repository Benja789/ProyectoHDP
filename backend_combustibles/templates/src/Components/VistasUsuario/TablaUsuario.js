import React from 'react';
import { useForm } from 'react-hook-form';
import { 
  makeStyles,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableRow,
  TextField,
  FormHelperText,
  Paper,
  Button,
  TableContainer
} from '@material-ui/core';
import axios from 'axios';
//Estilo css
const useStyles = makeStyles((theme) => ({
  table: {
    minWidth: 650,
  },
  error:{
      display: 'block',
      margin: theme.spacing(1),
      color:"#FA3227",
  },
  button:{
    display:'inline-block',
    width: '190px',
  }, 
}));

const Tabla = (props) =>{
  const classes = useStyles();
  const prediccion = props.prediccion;
  const {register, formState:{errors}, handleSubmit} = useForm();
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
  
  //Eliminar el periodo
  const eliminarPeriodo = async(data)=>{
    if (data.eliminar>0){
      let formData = new FormData();
      formData.append("id",prediccion[data.eliminar-1].idprediccion);
      axios.post(props.url+"/jsoneliminardato",formData).then((res)=>{
        window.alert("Dato eliminado correctamente")
      }).catch(err=>{
        window.alert("Algo ha salido mal no se pudo eliminar, intentelo más tarde");   
    })
    }
  }

  //Renderizado del componente
  return (
    <div>
      <br/>
        <form onSubmit={handleSubmit(eliminarPeriodo)}>
          <TextField
            label="ID periodo"
            type="number"
            className={classes.text}
            name="eliminar"
            {...register("eliminar",{
                required:{
                    value:true,
                    message:"Campo obligatorio, si desea eliminar un dato"
                }})}/>
          <FormHelperText className={classes.error}>{errors?.eliminar?.message}</FormHelperText> 
          <Button 
              className={classes.button}
              type ='submit' 
              variant='outlined'>Eliminar periodo</Button>
        </form>
      <br/>
      <TableContainer component={Paper}>
        <Table className={classes.table} aria-label="simple table">
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell >Fecha Inicio</TableCell>
              <TableCell align="left">Fecha Fin</TableCell>
              <TableCell align="left">Zona</TableCell>
              <TableCell align="left">Tipo Combusitible</TableCell>
              <TableCell align="right">Precio</TableCell>
              <TableCell align="right">Variacion</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {prediccion.map((row,index) => (
              <TableRow key={row.idprediccion}>           
                <TableCell>{index+1}</TableCell>
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
                {row.idgasolina_id ==="DI03" && <TableCell align="left">Diesel</TableCell>}
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