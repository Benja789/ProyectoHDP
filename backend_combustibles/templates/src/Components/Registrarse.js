import React, {useState} from 'react';
import {useForm} from "react-hook-form";
import {
    makeStyles,
    Card,
    CardContent,
    TextField,
    InputLabel,
    InputAdornment,
    Button,
    Input,
    IconButton,
    Grid,
    FormControl,
    Typography,
    FormHelperText
}from '@material-ui/core';
import{
    Visibility,
    VisibilityOff
}from '@material-ui/icons';
import axios  from 'axios';
import { 
    Link,
    Redirect
 } from 'react-router-dom';

const useStyle= makeStyles((theme) =>({
    root: {
       margin:'auto',
       marginTop:'75px',
       display: 'block',
    }, 
    card:{
        margin:'auto',
        width: '550px',
    },
    text:{
        padding: '2px',
        margin: theme.spacing(1),
    },
    div:{
        display:'block',
        position:'absolute',
        minWidth:'200px'
    },
    button:{
        display: 'flex',
        justifyContent: 'center',
        paddingInline:'2px',
        //margin: 'auto',
        margin: theme.spacing(3),
        marginTop:'20px',
        minWidth:'500px',
        
    },
    typography:{
        marginTop:'20px',
        marginLeft:'20px'
    },
    input:{
        display: 'flex',
        padding: '2px',
        width:'400px',
        marginTop:'20px',
        marginLeft:theme.spacing(1),
    },
    formControl:{
        minWidth:'500px', 
        marginTop:'10px',
    },

    textField: {
        marginLeft: theme.spacing(1),
        marginRight: theme.spacing(1),
        width: 400,
    },
    error:{
        display: 'inline',
        margin: theme.spacing(1),
        color:"#FA3227",
    }
}))


const Registrarse = (props) => {
    const classes = useStyle();
    const {register, formState:{errors}, handleSubmit} = useForm();
    const [values, setValues] = useState({
        amount: '',
        password: '',
        weight: '',
        weightRange: '',
        showPassword: false,
      });
    
    const [valuesC, setValuesC] = useState({
        amount: '',
        password: '',
        weight: '',
        weightRange: '',
        showPassword: false,
    });
    const [validarR, setValidarR] =useState({
        Creado: false
    });
    //Contraseña - Visible
    const handleChange = (prop) => (event) => {
        setValues({ ...values, [prop]: event.target.value });
    };

    const handleClickShowPassword = () => {
        setValues({ ...values, showPassword: !values.showPassword });
    };

    const handleMouseDownPassword = (event) => {
        event.preventDefault();
    };

    //Confirmar-Visible
    const handleChangeC = (prop) => (event) => {
        setValuesC({ ...valuesC, [prop]: event.target.value });
    };

    const handleClickShowPasswordC = () => {
        setValuesC({ ...valuesC, showPassword: !valuesC.showPassword });
    };

    const handleMouseDownPasswordC = (event) => {
        event.preventDefault();
    };
    const registrarse =(data)=>{

        if (data.password ===data.passwordConfir){
            //console.log("funciona")
            let formData = new FormData();
            formData.append("dui", data.dui);
            formData.append("nombre", data.nombre);
            formData.append("apellido", data.apellido);
            formData.append("departamento", data.departamento);
            formData.append("municipio", data.municipio);
            formData.append("email", data.email);
            formData.append("password", data.password);
            formData.append("fecha", data.fecha);
            solicitarCuenta(formData);
        }
        else{
            window.alert("Contraseñas no coinciden")
        }
    }
    
    const solicitarCuenta =async(data)=>{
        axios.post(props.url+"/jsonregistrarse", data).then(res=>{
            setValidarR(res.data)
            console.log(validarR.Creado)
            if(validarR.Creado ===false){
                window.alert("Usuario ya existe")
            }
        }).catch(err=>{
            window.alert("Verifique los campos, si el error persiste intentelo mas tarde")
        })
    }

    return ( 
        <div className={classes.root} >
            {validarR.Creado === true && <Redirect to='/login'  />}
            <form onSubmit={handleSubmit(registrarse)} >
                <Card className={classes.card}>
                    <CardContent>
                        <Typography className={classes.typography}variant="h6">Complete los siguientes campos</Typography>
                        <Grid container>
                            <Grid item xs={12} sm={6}>
                                <TextField 
                                    className={classes.text}
                                    label="Nombre"
                                    name="nombre"
                                    {...register("nombre",{
                                        required:{
                                            value:true,
                                            message:"Campo obligatorio, ingrese un nombre"
                                        }})}/>
                                <FormHelperText className={classes.error}>{errors?.nombre?.message}</FormHelperText>
                            </Grid>
                            <Grid item xs={12} sm={6}>
                                <TextField 
                                    className={classes.text}
                                    label="Apellido"
                                    name="apellido"
                                    {...register("apellido",{
                                        required:{
                                            value:true,
                                            message:"Campo obligatorio, ingrese un apellido"
                                        }})}/>
                                <FormHelperText className={classes.error}>{errors?.apellido?.message}</FormHelperText>
                            </Grid>
                            <Grid item xs={12} sm={6}>
                                <TextField 
                                    className={classes.text}
                                    label="Correo Electronico"
                                    type="email"
                                    name="email"
                                    {...register("email",{
                                        required:{
                                            value:true,
                                            message:"Campo obligatorio, ingrese un correo"
                                        }})}/>
                                <FormHelperText className={classes.error}>{errors?.email?.message}</FormHelperText>
                            </Grid>
                            <Grid item xs={12} sm={6}>
                                <TextField
                                    label="DUI"
                                    type="number"
                                    className={classes.text}
                                    name="dui"
                                    {...register("dui",{
                                        required:{
                                            value:true,
                                            message:"Campo obligatorio, solo se permiten numeros"
                                        },
                                        minLength:{
                                            value:9,
                                            message:"Longuitud minima de 9"
                                        },
                                        maxLength:{
                                            value:9,
                                            message:"Longuitud maxima de 9"
                                        }})}/>
                                <FormHelperText className={classes.error}>{errors?.dui?.message}</FormHelperText> 
                            </Grid>
                            <Grid item xs={12}>
                                <FormControl className={classes.formControl} >
                                    <InputLabel style={{marginLeft: '8px'}} >Contraseña</InputLabel>
                                    <Input 
                                    className={classes.input}
                                    name="password"
                                    id="standard-adornment-password"
                                    type={values.showPassword ? 'text' : 'password'}
                                    onChange={handleChange('password')}
                                    endAdornment={
                                        <InputAdornment position="end">
                                        <IconButton
                                            aria-label="toggle password visibility"
                                            onClick={handleClickShowPassword}
                                            onMouseDown={handleMouseDownPassword}>
                                            {values.showPassword ? <Visibility /> : <VisibilityOff />}
                                        </IconButton>
                                        </InputAdornment>}
                                    {...register("password",{
                                        required:{
                                            value:true,
                                            message:"Campo obligatorio, no se puede dejar vacia la contraseña"
                                        },
                                        minLength:{
                                            value:8,
                                            message:"Longuitud minimia de 8"
                                        },
                                        maxLength:{
                                            value:20,
                                            message:"Longuitud maxima de 20"
                                        }})}/>
                                    <FormHelperText className={classes.error}>{errors?.password?.message}</FormHelperText> 
                                </FormControl>
                            </Grid>
                            <Grid item xs={12}>        
                                <FormControl className={classes.formControl} >
                                    <InputLabel style={{marginLeft: '8px'}} >Confirmar contraseña</InputLabel>
                                    <Input 
                                        className={classes.input}
                                        name="passwordConfir"
                                        id="standard-passwordConf"
                                        type={valuesC.showPassword ? 'text' : 'password'}
                                        onChange={handleChangeC('password')}
                                        endAdornment={
                                            <InputAdornment position="end">
                                            <IconButton
                                                aria-label="toggle password visibility"
                                                onClick={handleClickShowPasswordC}
                                                onMouseDown={handleMouseDownPasswordC}>
                                                {valuesC.showPassword ? <Visibility /> : <VisibilityOff />}
                                            </IconButton>
                                            </InputAdornment>}
                                        {...register("passwordConfir",{
                                            required:{
                                                value:true,
                                                message:"Campo obligatorio, no se puede dejar vacia la confirmacion de contraseña"
                                            },
                                            minLength:{
                                                value:8,
                                                message:"Longuitud minimia de 8"
                                            },
                                            maxLength:{
                                                value:20,
                                                message:"Longuitud maxima de 20"
                                            }})}/>
                                    <FormHelperText className={classes.error}>{errors?.passwordConfir?.message}</FormHelperText> 
                                </FormControl>
                            </Grid>
                            <Grid item xs={12} sm={6}>
                                <TextField 
                                    className={classes.text}
                                    label="Departamento"
                                    name="departamento"
                                    {...register("departamento", {
                                        required:{
                                            value:true,
                                            message:"Campo obligatorio, ingrese el departamento"
                                        }})}/>
                                <FormHelperText className={classes.error}>{errors?.departamento?.message}</FormHelperText> 
                            </Grid>
                            <Grid item xs={12} sm={6}>
                                <TextField 
                                    className={classes.text}
                                    label="Municipio"
                                    name="municipio"
                                    {...register("municipio", {
                                        required:{
                                            value:true,
                                            message:"Campo obligatorio, ingrese el municipio"
                                        }})}/>
                                <FormHelperText className={classes.error}>{errors?.municipio?.message}</FormHelperText> 
                            </Grid>
                            <Grid item xs={12}>
                                <br/>
                                <TextField
                                    id="date"
                                    name="fecha"
                                    label="Fecha de nacimiento"
                                    type="date"
                                    defaultValue="2021-06-12"
                                    className={classes.textField}
                                    InputLabelProps={{shrink: true,}}
                                    {...register("fecha",{
                                        required:{
                                            value:true,
                                            error:"Fecha obligatoria"
                                        }
                                    })}/>
                                    <FormHelperText className={classes.error}>{errors?.fecha?.message}</FormHelperText> 
                                </Grid>
                        </Grid>
                    </CardContent>
                    <Button 
                    className={classes.button}
                    type ='submit' 
                    color='primary' 
                    variant="contained">Registrarse</Button>
                    <Link to="/login">
                        <Button 
                            className={classes.button}
                            color='primary' 
                            variant="contained">Cancelar</Button>
                    </Link>
                </Card>
            </form>
        </div>
     );
}
 
export default Registrarse;