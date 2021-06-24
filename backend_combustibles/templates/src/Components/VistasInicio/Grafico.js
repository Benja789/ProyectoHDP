import React from 'react';
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend
} from 'recharts';
import { 
  makeStyles,
  Typography
} from '@material-ui/core';

const useStyle = makeStyles((theme)=>({
  root:{
    position:'relative',
    margin:'auto',
  },
  grafica:{
    widht:'80%',
    height:'30%',
  }
}))
const Graficos =(props)=>{
  const classes =useStyle();
  return(
    <div className={classes.root}>
      <Typography varian="h4">Zona {props.nombre}</Typography>
      <br/>
      <LineChart width={800} height={300}data={props.zona}
        margin={{ top: 5, right: 30, left: 20, bottom: 5 }}>
        <CartesianGrid strokeDasharray="3 3" />
        <XAxis dataKey="idperiodo" />
        <YAxis dataKey="Especial"/>
        <YAxis dataKey="Regular"/>
        <YAxis dataKey="Diesel"/>
        <Tooltip />
        <Legend />
        <Line type="monotone" dataKey="Especial" stroke="#1D4583" />
        <Line type="monotone" dataKey="Regular" stroke="#C51C14" />
        <Line type="monotone" dataKey="Diesel" stroke="#2B930C" />
      </LineChart>
    </div>
  );
}
export default Graficos;