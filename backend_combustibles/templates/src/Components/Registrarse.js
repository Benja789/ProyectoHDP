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
    FormControl,
    Typography
}from '@material-ui/core';
import{
    Visibility,
    VisibilityOff
}from '@material-ui/icons'
import { Link } from 'react-router-dom';

const useStyele= makeStyles((theme) =>({
    root: {
       margin:'auto',
       marginTop:'20%',
       display: 'block',
    }, 
    card:{
        margin:'auto',
        width: '510px',
        height:'580px',
    },
    text:{
        padding: '2px',
        margin: theme.spacing(1),
    },
    button:{
        display: 'flex',
        justifyContent: 'center',
        paddingInline:'2px',
        margin: 'auto',
        marginTop:'10px',
        minWidth:'400px',
        
    },
    typography:{
        marginTop:'20px',
        marginLeft:'20px'
    },
    input:{
        display: 'flex',
        padding: '2px',
        maxWidth:'450px',
        marginTop:'20px',
        marginLeft:theme.spacing(1),
    },
    formControl:{
        maxWidth:'450px', 
        marginTop:'10px',
    },
}))

const Registrarse = (props) => {
    const classes = useStyele();
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
    return ( 
        <div className={classes.root} >
            <form >
                <Card className={classes.card}>
                    <CardContent>
                        <Typography className={classes.typography}variant="h6">Complete los siguientes campos</Typography>
                        <br/>
                        <TextField 
                            className={classes.text}
                            label="Nombre"/>
                        <TextField 
                            className={classes.text}
                            label="Apellido"
                            />
                        <br/>
                        <TextField 
                            className={classes.text}
                            label="Correo Electronico"/>
                        <TextField 
                            className={classes.text}
                            label="DUI"/>
                        <br/>
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
                                message:"Campo obligatorio, no se puede dejar vacio"
                            }
                        })}/>
                    </FormControl>
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
                                    message:"Campo obligatorio, no se puede dejar vacio"
                                }})}
                        />
                    </FormControl>
                        <TextField 
                            className={classes.text}
                            label="Departamento"/>
                        <TextField 
                            className={classes.text}
                            label="Municipio"/>
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