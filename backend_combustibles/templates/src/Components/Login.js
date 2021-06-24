import React, {useState, useEffect} from 'react';
import{
    makeStyles,
    Avatar,
    TextField,
    Button,
    Card, 
    Typography,
    IconButton,
    FormHelperText,
    Input,
    FormControl,
    InputLabel,
    InputAdornment
}from '@material-ui/core';
import{
    Visibility,
    VisibilityOff
}from '@material-ui/icons'
import {
    Link,
    Redirect
} from "react-router-dom";
import {useForm} from "react-hook-form";
import axios from 'axios';


const useStyle = makeStyles((theme)=>({
 root: {
     width: '350px',
     display: 'block',
     margin:'auto',
     marginTop:'200px',
     //position: 'center',
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
    margin: theme.spacing(3),
    minWidth:'300px'
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
        correo: true,
        password: true,
        primera:0
    });
    const [values, setValues] = useState({
        amount: '',
        password: '',
        weight: '',
        weightRange: '',
        showPassword: false,
      });

      const handleChange = (prop) => (event) => {
        setValues({ ...values, [prop]: event.target.value });
      };
    
      const handleClickShowPassword = () => {
        setValues({ ...values, showPassword: !values.showPassword });
      };
    
      const handleMouseDownPassword = (event) => {
        event.preventDefault();
      };

      
      useEffect(() => {
        document.title="Iniciar sesion";  
      },[]);

  
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
            setInicio(res.data);
            console.log(res.data);
        }).catch(err=>{
            window.alert("Algo ha salido mal, intentelo más tarde");   
            console.log(err)        
        })
    }

    //Renderizado del componente  
    return (
        <div className={classes.root}>
            <form onSubmit={handleSubmit(iniciarSesion)}>
                <Card>
                    <Avatar className={classes.avatar}></Avatar>
                    <Typography className={classes.title} variant="h5" >
                    Iniciar sesion</Typography>
                    <TextField 
                        id="outlined-error-helper-text"
                        className={classes.textf}
                        label="Usuario"
                        name="usuario"
                        type="email"
                        //variant="outlined"
                        {...register("usuario",{
                            required:{
                                value:true,
                                message:"Campo obligatorio, no se puede dejar vacio"
                            }
                        })}/>
                    <FormHelperText className={classes.error}>{errors?.usuario?.message}</FormHelperText>
                    {(inicioSesion.correo===false &&inicioSesion.primera===1 )&& <FormHelperText className={classes.error}>No existe el correo</FormHelperText>}
                    <FormControl>
                        <InputLabel style={{marginLeft: '15px'}} >Contraseña</InputLabel>
                        <Input 
                        className={classes.textf}
                        name="password"
                        id="standard-adornment-password"
                        type={values.showPassword ? 'text' : 'password'}
                        onChange={handleChange('password')}
                        endAdornment={
                            <InputAdornment position="end">
                              <IconButton
                                aria-label="toggle password visibility"
                                onClick={handleClickShowPassword}
                                onMouseDown={handleMouseDownPassword}
                              >
                                {values.showPassword ? <Visibility /> : <VisibilityOff />}
                              </IconButton>
                            </InputAdornment>
                          }
                        {...register("password",{
                            required:{
                                value:true,
                                message:"Campo obligatorio, no se puede dejar vacio"
                            }
                        })}/>
                    </FormControl>
                        <FormHelperText className={classes.error}>{errors?.password?.message}</FormHelperText>
                        {(inicioSesion.correo===true && inicioSesion.password === false ) && <FormHelperText className={classes.error}>Contraseña erronea</FormHelperText>}
                    <div style={{margin:'15px'}}>
                        <Typography variant="p">¿No tienes cuenta? </Typography>
                        <Link to="/registrarse">Crear una cuenta</Link>
                    </div>
                    <Button 
                        className={classes.button} 
                        type ='submit' 
                        color='primary' 
                        variant="contained" 
                        onClick={iniciarSesion}
                        >Ingresar</Button> 
                    {inicioSesion.validarse === true && <Redirect to="/usuario"/>}
                    <Link to ="/">
                        <Button className={classes.button} type ='submit' color='primary' variant="contained" >Cancelar</Button>
                    </Link>
                </Card>
            </form>

        </div>
    );
}

export default Login;
