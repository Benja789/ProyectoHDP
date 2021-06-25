import React from 'react';
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
  
const TablaPeriodo = (props) => {
    const classes = useStyles();
    const periodo = props.periodo;
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
                  <TableCell >ID</TableCell>
                  <TableCell >Fecha Inicio</TableCell>
                  <TableCell align="left">Fecha Fin</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {periodo.map((row, index) => (
                  <TableRow key={row.idprediccion}>           
                    <TableCell align="left">{row.idperiodo}</TableCell>
                    <TableCell align="left">
                      {new Date(row.fechainicio).getDate()} {meses[new Date(row.fechainicio).getMonth()]} {new Date(row.fechainicio).getFullYear()}
                    </TableCell>
                    <TableCell align="left">
                    {new Date(row.fechafin).getDate()} {meses[new Date(row.fechafin).getMonth()]} {new Date(row.fechafin).getFullYear()}
                    </TableCell>                    
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>
        </div>
    );

}
 
export default TablaPeriodo;