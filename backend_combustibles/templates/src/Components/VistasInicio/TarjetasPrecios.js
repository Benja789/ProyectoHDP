import React from 'react';
import {
    makeStyles, 
    Card, 
    CardContent,
    Typography
} from '@material-ui/core';

const useStyles = makeStyles({
  root: {
    display: 'block',
    padding: '6px',
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
});

const Tarjeta = (props) =>{
  const classes = useStyles();

  return (
    <div className={classes.div}>
        <Card className={classes.root}>
        <CardContent>
            <Typography className={classes.title} color="textSecondary" gutterBottom>Periodo</Typography>
            <Typography variant="h5" component="h2">Zona {props.zona.nombrezona}</Typography>
            <Typography className={classes.pos} color="textSecondary">Tipo de gasolina</Typography>
            <Typography variant="p" component="div">Especial: </Typography>
            <Typography variant="p" component="div">Regular: </Typography>
            <Typography variant="p" component="div">Diesel: </Typography>
        </CardContent>
        </Card>
    </div>
  );
}
export default Tarjeta;