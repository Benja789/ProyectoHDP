import React from 'react';
import Grid, { GridSpacing } from '@material-ui/core/Grid';
import { createMuiTheme } from '@material-ui/core/styles';


import {
  makeStyles, AppBar, Typography, Button, Avatar, Paper, Tab, Tabs, Table, TableBody, TableCell, 
  TableContainer, TableRow, TableHead,List,ListItem,ListItemText,Divider

} from '@material-ui/core';

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


  Button: {
    position: "relative",
    margin: theme.spacing(3)

  },
  Contenido: {
    flexGrow: 1,

  },
  paperData: {
    
    padding: theme.spacing(1),
    textAlign: 'center',
    color: theme.palette.text.secondary,
    margin: theme.spacing(3),

  },
  table: {
    margin: theme.spacing(5),
    minWidth: 600,


  },
  list:{

    width: '100%',
    maxWidth: 360,
    backgroundColor: theme.palette.background.paper,
  }


}));
const theme = createMuiTheme({
  palette: {
    primary: {
      main: '#3f51b5'
    },
    
  },
});


const Usuario = () => {
  const classes = useStyle()
  const [value, setValue] = React.useState(2);
  const handleChange = (event, newValue) => {
    setValue(newValue);
  };
  function createData(name, calories, fat, carbs, protein) {
    return { name, calories, fat, carbs, protein };
  }

  const rows = [
    createData('Frozen yoghurt', 159, 6.0, 24, 4.0),
    createData('Ice cream sandwich', 237, 9.0, 37, 4.3),
    createData('Eclair', 262, 16.0, 24, 6.0),
    createData('Cupcake', 305, 3.7, 67, 4.3),
    createData('Gingerbread', 356, 16.0, 49, 3.9),
  ];

  

  return (
    <Grid container="fixed" fullWidth>

      <AppBar color="primary" position="static">
        <Typography variant="h4" className={classes.title}  >
          <Avatar className={classes.avatar} ></Avatar>
          Historial de Usuarios
        </Typography>
      </AppBar>


      <div className={classes.Button}>
        <Button variant="contained" color="primary">Ingresar Precio </Button>
        <Button variant="contained" color="primary">Salir </Button>
      </div>



      <Paper className={classes.paper} elevation={10} >

        <Grid>
          <Paper square>
            <Tabs
              value={value}
              indicatorColor="primary"
              textColor="primary"
              onChange={handleChange}
              aria-label="disabled tabs example" >
              <Tab label="Modelo Calculado" />
              <Tab label="Graficos" />
            </Tabs>
          </Paper>

        </Grid>

        <div className={classes.Contenido}>
          <Grid container spacing={3}>
            <Grid item xs>
              <Paper className={classes.paperData}>

                Zona Occidental
                <List component="nav" className={classes.list} aria-label="mailbox folders">
                  <ListItem button>
                    <ListItemText primary="Diesel" />
                  </ListItem>
                  <Divider />
                  <ListItem button divider>
                    <ListItemText primary="Gasolina Regular" />
                  </ListItem>
                  <ListItem button>
                    <ListItemText primary="Gasolina Especial" />
                  </ListItem>
                  <Divider light />
    
                </List>

              </Paper>
            </Grid>
            <Grid item xs>
              <Paper className={classes.paperData}>
                Zona Central
                <List component="nav" className={classes.list} aria-label="mailbox folders">
                  <ListItem button>
                    <ListItemText primary="Diesel" />
                  </ListItem>
                  <Divider />
                  <ListItem button divider>
                    <ListItemText primary="Gasolina Regular" />
                  </ListItem>
                  <ListItem button>
                    <ListItemText primary="Gasolina Especial" />
                  </ListItem>
                  <Divider light />
    
                </List>

                </Paper>
            </Grid>
            <Grid item xs>
              <Paper className={classes.paperData}>
                Zona Oriental
                <List component="nav" className={classes.list} aria-label="mailbox folders">
                  <ListItem button>
                    <ListItemText primary="Diesel" />
                  </ListItem>
                  <Divider />
                  <ListItem button divider>
                    <ListItemText primary="Gasolina Regular" />
                  </ListItem>
                  <ListItem button>
                    <ListItemText primary="Gasolina Especial" />
                  </ListItem>
                  <Divider light />
    
                </List>

                </Paper>
            </Grid>
          </Grid>
          <Grid container spacing={3}>

          </Grid>
        </div>


        <div className={classes.Contenido}>
          <h4>Historial de Ajuste</h4>
          <TableContainer component={Paper}>
            <Table className={classes.table} size="small" aria-label="a dense table">
              <TableHead>
                <TableRow>
                  <TableCell>Dessert (100g serving)</TableCell>
                  <TableCell align="right">Calories</TableCell>
                  <TableCell align="right">Fat&nbsp;(g)</TableCell>
                  <TableCell align="right">Carbs&nbsp;(g)</TableCell>
                  <TableCell align="right">Protein&nbsp;(g)</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {rows.map((row) => (
                  <TableRow key={row.name}>
                    <TableCell component="th" scope="row">
                      {row.name}
                    </TableCell>
                    <TableCell align="right">{row.calories}</TableCell>
                    <TableCell align="right">{row.fat}</TableCell>
                    <TableCell align="right">{row.carbs}</TableCell>
                    <TableCell align="right">{row.protein}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>

        </div>


        <div className={classes.Button}>
          <Button variant="contained" color='primary'>Crear Modelos</Button>
          <Button variant="contained" color="primary">Eliminar Entradas</Button>
        </div>



      </Paper>

    </Grid>


  );
}
export default Usuario;
