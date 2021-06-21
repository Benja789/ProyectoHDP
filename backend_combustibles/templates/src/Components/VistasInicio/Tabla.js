import React, {useState} from 'react';
import { 
  makeStyles,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableRow,
  Paper,
  TableContainer
} from '@material-ui/core';

//Estilo css
const useStyles = makeStyles({
  table: {
    minWidth: 650,
  }, 
  button:{
    display:'block',
    position: 'absolute',
    width:'400px',
    minWidth:'40%',
    right: '20px',
    top: '150px',
    background:'#E5ECFF',
  },
});

const Tabla = (props) =>{
  const classes = useStyles();
  const prediccion = props.prediccion;
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

  //Renderizado del componente
  return (
    <div>
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