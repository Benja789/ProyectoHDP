import React from 'react';
import {
    makeStyles, 
    Card, 
    CardContent,
    Typography,
    TableBody,
    TableCell,
    TableHead,
    TableRow,
    Table,
    Paper,
    TableContainer
} from '@material-ui/core';

const useStyles = makeStyles({
  root: {
    display: 'block',
    },
  div:{
    display:'inline-block',
    width:'30%',
    padding: '6px',
  },
  bullet: {
    display: 'inline-block',
    margin: '0 2px',    
    transform: 'scale(0.8)',
  },
  title: {
    fontSize: 14,
  },
  pos: {
    marginBottom: 12,
  },  
  table: {
    minWidth: "40%",
    //width:'40%',
  },
});

const Tarjeta = (props) =>{
  const classes = useStyles();
  const fechaInicio = new Date(props.zona.inicio);
  const fechaFin = new Date(props.zona.fin);
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

  return (
    <div className={classes.div}>
      <br/>
      <Card className={classes.root}>
      <CardContent>
          <Typography className={classes.title} color="textSecondary" gutterBottom>
            {fechaInicio.getDate()} {meses[fechaInicio.getMonth()]} {fechaInicio.getFullYear()} a 
            {" "+fechaFin.getDate()} {meses[fechaFin.getMonth()]} {fechaFin.getFullYear()} 
          </Typography>
          <Typography variant="h5" component="h2">Zona {props.zona.nombrezona}</Typography>
          <Typography className={classes.pos} color="textSecondary">Tipo de gasolina</Typography>
          <TableContainer component={Paper}>
            <Table className={classes.table} aria-label="simple table"> 
              <TableHead>
                <TableRow>
                  <TableCell >Tipo</TableCell>
                  <TableCell align="left">Precio</TableCell>
                  <TableCell align="left">Variacion</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
              <TableRow key={props.zona.idzona}>           
                <TableCell align="left">Especial</TableCell>
                <TableCell align="left">$ {props.zona.especial}  </TableCell>  
                <TableCell align ="left">$ {props.zona.variacion_e}</TableCell>
              </TableRow>

              <TableRow key={props.zona.idzona}>           
                <TableCell align="left">Regular</TableCell>
                <TableCell align="left">$ {props.zona.regular}</TableCell>  
                <TableCell align ="left">$ {props.zona.variacion_r}</TableCell>
              </TableRow>
              <TableRow key={props.zona.idzona}>           
                <TableCell align="left">Diesel</TableCell>
                <TableCell align="left">$ {props.zona.diesel}</TableCell>  
                <TableCell align ="left">$ {props.zona.variacion_d}</TableCell>
              </TableRow>
            </TableBody>
            
            </Table>
          </TableContainer>
        </CardContent>
        </Card>
    </div>
  );
}
export default Tarjeta;