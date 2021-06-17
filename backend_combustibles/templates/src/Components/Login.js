import React  from 'react';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import{
    Grid,
    makeStyles,Paper,Avatar,TextField,Button
}from '@material-ui/core';
import {Link} from "react-router-dom";


const useStyle = makeStyles((theme)=>({
 root: {

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
 button:{
    margin:"20px auto",
     
 }
}));

const Login = () =>{
    const classes = useStyle();

    return (
        <Grid>
            <Paper className={classes.paper} elevation={10} >
                <Grid align = 'center'>
                    <Avatar className={classes.avatar}></Avatar>
                    <h1>Iniciar Secion</h1>
                </Grid>
                <TextField label="Usuario" placeholder='Ingrese Usuario' fullWidth required/>               
                <TextField label="Contraseña" placeholder='Ingrese Contraseña' type='password' fullWidth required/>          
                <FormControlLabel
                    control={
                    <Checkbox     
                        name="checkedB"
                        color="primary"
                    />}
                    label="Recordar Contraseña"
                />
                <Button type ='submit' color='primary' variant="contained" fullWidth>Ingresar</Button> 
                <Link to ="/">
                    <Button className={classes.button}type ='submit' color='primary' variant="contained" fullWidth>Cancelar</Button>
                </Link>
            </Paper>
        </Grid> 
    );
}

export default Login;
