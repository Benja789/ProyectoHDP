import React, {useEffect} from 'react';
import{
    makeStyles,
    Avatar,
    TextField,
    Button,
    Card, 
    CardContent,
    Typography,
    FormControlLabel, 
    Checkbox,
    CardActions
}from '@material-ui/core';
import {Link} from "react-router-dom";


const useStyle = makeStyles((theme)=>({
 root: {
     width:'50%',
     display: 'inline-block',
     padding: '6px',
     position: 'center',
 },
 avatar:{
    backgroundColor:'#3055a7'
 },
 paper:{
    padding: 20,
    height:'60vh',
    width:'25%',
    margin:"20px auto",
 },
 bullet: {
    display: 'inline-block',
    margin: '0 2px',
    transform: 'scale(0.8)',
  },
 button:{
    display: 'block',
    margin:"20px auto",
     
 }
}));

const Login = () =>{
    const classes = useStyle();
    const bull = <span className={classes.bullet}>•</span>;

    useEffect(() => {
        document.title="Iniciar sesion";
      });

    return (
        <Card className={classes.root}>
            <CardContent>
                <Avatar className={classes.avatar}></Avatar>
                <Typography className={classes.title} variant="h5" gutterBottom>
                Iniciar sesion</Typography>
                <TextField label="Usuario"></TextField>
                <br/>
                <TextField label="Contraseña"></TextField>
            </CardContent>
            <CardActions>
                <FormControlLabel
                    control={<Checkbox name="checkedB" color="primary"/>}
                    label="Recordar Contraseña"/>
                <Button className={classes.root} type ='submit' color='primary' variant="contained" fullWidth>Ingresar</Button> 
                <br/>
                <Link to ="/">
                    <Button className={classes.button} type ='submit' color='primary' variant="contained" fullWidth>Cancelar</Button>
                </Link>
            </CardActions>
        </Card>
        
    );
}

export default Login;
