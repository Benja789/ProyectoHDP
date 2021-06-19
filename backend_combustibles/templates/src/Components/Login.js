import React, {useState,useEffect} from 'react';
import{
    makeStyles,
    Avatar,
    TextField,
    Button,
    Card, 
    Typography,
    FormControlLabel, 
    Checkbox
}from '@material-ui/core';
import {Link} from "react-router-dom";
import {useForm} from "react-hook-form";


const useStyle = makeStyles((theme)=>({
 root: {
     width: '350px',
     display: 'inline-block',
     //padding: '6px',
     position: 'center',
 },
 avatar:{
    display: 'flex',
    backgroundColor:'#3055a7',
    margin: theme.spacing(4),
 },
 title:{
    display: 'block',
    postion:'right',
    margin: '-70px 0 0 95px',
 },
 button:{
    display: 'flex',
//    margin:"20px auto",     
    margin: theme.spacing(3),
    minWidth:'300px'
 },
 div:{
    position: 'absolute',
    top: '40%',
    left: '44%',
    margin: '-100px 0 0 -100px',
 },
 textf:{
    display:'flex',
    position: 'relative',
    margin: theme.spacing(2),
    minWidth:'300px'
  },
  fieldBox:{
    transform: "scale(0.8)",
    margin: theme.spacing(1),
  }
}));

const Login = () =>{
    const classes = useStyle();
    const {register, formState:{errors}, handleSubmit} = useForm();
    const [entradas, setEntradas] = useState({
        nombre:'',
        contraseña:''
    });

    const iniciarSesion = (data, e) =>{
        console.log(data)
        setEntradas([...entradas, ...data]);
        //console.log(entradas)
    }

    useEffect(() => {
        document.title="Iniciar sesion";
      });

    return (
        <div className={classes.div}>
            <Card className={classes.root}>
            <form onSubmit={handleSubmit(iniciarSesion)}>
                    <Avatar className={classes.avatar}></Avatar>
                    <Typography className={classes.title} variant="h5" >
                    Iniciar sesion</Typography>
                    <TextField 
                        className={classes.textf}
                        label="Usuario"
                        {...register("usuario",{
                            required:{
                                value:true,
                                message:"Campo obligatorio"
                            }
                        })}/>
                    <p>{errors?.nombre?.message}</p>
                    <TextField 
                        className={classes.textf}
                        label="Contraseña"
                        {...register("contraseña",{
                            required:{
                                value:true,
                                message:"Campo obligatorio"
                            }
                        })}/>
                        <p>{errors?.nombre?.message}</p>
                    <FormControlLabel
                        control={<Checkbox className={classes.fieldBox}name="checkedB" color="primary"/>}
                        label="Recordar Contraseña"/>
                    <Button 
                        className={classes.button} 
                        type ='submit' 
                        color='primary' 
                        variant="contained" 
                        onClick={iniciarSesion}
                        >Ingresar</Button> 
                    <Link to ="/inicio">
                        <Button className={classes.button} type ='submit' color='primary' variant="contained" >Cancelar</Button>
                    </Link>
            </form>
            </Card>
        </div>
    );
}

export default Login;
