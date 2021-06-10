import React from 'react';
import PropTypes from 'prop-types';
import { 
    makeStyles,
    AppBar,
    Tabs,
    Tab,
    Typography,
    Box
 } from '@material-ui/core';
import Tarjeta  from "./VistasInicio/TarjetasPrecios";
import Tabla from './VistasInicio/Tabla';
//import MapaSalvador from '../';

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

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
  },
}));

const Inicio = (url) => {
  const classes = useStyles();
  const [value, setValue] = React.useState(0);
  const bull = <span className={classes.bullet}>•</span>;
  const zonas  =[{
    nombre:"Occidental",
    fecha:"fecha",
    precio:"215.2"
  }]

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  return (
    <div className={classes.root}>
      <AppBar position="static"  style={{ background: "#2E3B55" }}> 
        <Tabs value={value} onChange={handleChange} aria-label="simple tabs example" align="center">
          <Tab label="Precios por zona" {...a11yProps(0)} />
          <Tab label="Historial de precios" {...a11yProps(1)} />
          <Tab label="Graficos" {...a11yProps(2)} />
        </Tabs>
      </AppBar>
      <TabPanel value={value} index={0}>

          {/*Precios por zonas impresos*/}
        <Tarjeta zona={zonas}/>
        <Tarjeta />
        <Tarjeta />
      </TabPanel>
      <TabPanel value={value} index={1}>
        Tabla de Historial
        <Tabla />
      </TabPanel>
      <TabPanel value={value} index={2}>
        Graficos
      </TabPanel>
    </div>
  );
}
export default Inicio;
