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
  MenuItem
} from '@material-ui/core';

const useStyles = makeStyles({
  table: {
    minWidth: 650,
  },
});

const Tabla = (props) =>{
  const classes = useStyles();
  const prediccion = props.prediccion;
  const periodo = props.periodo;

  const [anchorEl, setAnchorEl] = React.useState(null);

  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  return (
  <div>
    <Button aria-controls="simple-menu" aria-haspopup="true" onClick={handleClick}>Selecciona Periodo</Button>
    <Menu
      id="simple-menu"
      anchorEl={anchorEl}
      keepMounted
      open={Boolean(anchorEl)}
      onClose={handleClose}>
      {periodo.map((p)=>(
        <MenuItem id={p.idperiodo} onClick={handleClose}>{p.fechainicio} a {p.fechafin}</MenuItem>
      ))}
      
    </Menu>
    <TableContainer component={Paper}>
      <Table className={classes.table} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Zona</TableCell>
            <TableCell align="right">Tipo Combusitible</TableCell>
            <TableCell align="right">Precio</TableCell>
            <TableCell align="right">Variacion</TableCell>
            <TableCell align="right">Fecha Inicio</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {prediccion.map((row) => (
            <TableRow key={row.idprediccion}>             
              {/*Zonas */}
              {row.idzona_id ==="ZORI" && <TableCell align ="left">Oriental</TableCell>}
              {row.idzona_id ==="ZOCC" && <TableCell align ="left">Occidental</TableCell>}
              {row.idzona_id ==="ZCEN" && <TableCell align ="left">Central</TableCell>}             
              {/*Gasolinas */}
              {row.idgasolina_id ==="DI03" && <TableCell align="right">Disiel</TableCell>}
              {row.idgasolina_id ==="RE02" && <TableCell align="right">Regular</TableCell>}
              {row.idgasolina_id ==="ES01" && <TableCell align="right">Super</TableCell>}
              <TableCell align="right">{row.precio}</TableCell>
              {row.variacion >0 && <TableCell style={{color:'#B03A2E',}} align="right">{row.variacion}</TableCell>}
              {row.variacion <0 && <TableCell style={{color:'#1D8348',}} align="right">{row.variacion}</TableCell>}
              {row.variacion ===0 && <TableCell align="right">{row.variacion}</TableCell>}
              <TableCell align="right">{row.idperiodo_id}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  </div>
  );
}
export default Tabla;