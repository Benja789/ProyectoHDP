import React, {useState, useEffect} from 'react';
import{
    makeStyles,
    Avatar,
    TextField,
    Button,
    Card, 
    Typography,
    FormControlLabel, 
    Checkbox,
    FormHelperText
}from '@material-ui/core';
import {Link} from "react-router-dom";
import {useForm} from "react-hook-form";
import axios from 'axios';


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
    top: '30%',
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
  },
  error:{
    margin: theme.spacing(2),
    color:"#FA3227",
  }
}));

const Login = (props) =>{
    const classes = useStyle();
    const {register, formState:{errors}, handleSubmit} = useForm();
    const validar = {
        usuario: false,
        password: false,
    }
    const [inicioSesion, setInicio]=  useState({
        idUsuario:"",
        validarse: false,
        correo: false,
        password: false
    });
  
    //Recoge la informacion del inicio de sesion
    const iniciarSesion = (data, e) =>{
        if (errors.usuario === undefined){
            validar.usuario =true;
        }
        if(errors.password === undefined){
            validar.password=true;
        }
        if(validar.usuario && validar.password){
            let formData = new FormData();
            formData.append("usuario", data.usuario);
            formData.append("password", data.password);
            mandarUsuario(formData)
        }
    }

    //Manda la informacion del usuario al servidor
    const mandarUsuario = async(data)=>{
        axios.post(props.url+"/jsoniniciarsesion", data).then(res=>{
            //console.log(res.data)
            setInicio(res.data);
            console.log(inicioSesion);
        }).catch(err=>{
            console.log(err)
        })
    }

    //Elementos secundarios
    useEffect(() => {
        document.title="Iniciar sesion";
      });

    //Renderizado del componente  
    return (
        <div className={classes.div}>
            <Card className={classes.root}>
            <form onSubmit={handleSubmit(iniciarSesion)}>
                    <Avatar className={classes.avatar}></Avatar>
                    <Typography className={classes.title} variant="h5" >
                    Iniciar sesion{inicioSesion.idUsuario}</Typography>
                    <TextField 
                        className={classes.textf}
                        label="Usuario"
                        name="usuario"
                        type="email"
                        {...register("usuario",{
                            required:{
                                value:true,
                                message:"Campo obligatorio, no se puede dejar vacio"
                            }
                        })}/>
                    <FormHelperText className={classes.error}>{errors?.usuario?.message}</FormHelperText>
                    <TextField 
                        className={classes.textf}
                        name="password"
                        type='password'
                        label="Contraseña"
                        {...register("password",{
                            required:{
                                value:true,
                                message:"Campo obligatorio, no se puede dejar vacio"
                            }
                        })}/>
                        <FormHelperText className={classes.error}>{errors?.password?.message}</FormHelperText>
                    <FormControlLabel
                        control={<Checkbox className={classes.fieldBox}name="checkedB" color="primary"/>}
                        label="Recordar Contraseña"/>
                    <div style={{margin:'15px'}}>
                        <Typography variant="p">¿No tienes cuenta? </Typography>
                        <Link to="/">Crear una cuenta</Link>
                    </div>
                    <Button 
                        className={classes.button} 
                        type ='submit' 
                        color='primary' 
                        variant="contained" 
                        onClick={iniciarSesion}
                        >Ingresar</Button> 
                    <Link to ="/">
                        <Button className={classes.button} type ='submit' color='primary' variant="contained" >Cancelar</Button>
                    </Link>
            </form>
            </Card>
        </div>
    );
}

export default Login;
