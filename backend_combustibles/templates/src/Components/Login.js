import React  from 'react';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';

import{
    Grid,
    makeStyles,Paper,Avatar,TextField,Button
}from '@material-ui/core';

const useStyle = makeStyles((theme)=>({
 root: {

 },
 


}));

/*const Login = () =>{

    return (

        <div>
<Typografy variant = "h5">Usuarios</Typografy>
        </div>
    );
}*/

const Login = () =>{
    const paperStyle={padding: 20,height:'60vh',width:'25%',margin:"20px auto"}
    const avatarStyle ={backgroundColor:'#3055a7'}
    return (
        <Grid>
            <Paper elevation={10} style={paperStyle}>
                <Grid align = 'center'>
                <Avatar style = {avatarStyle}></Avatar>
                 <h1>Iniciar Secion</h1>

                </Grid>

                <TextField label="Usuario" placeholder='Ingrese Usuario' fullWidth required/>
               
                <TextField label="Contraseña" placeholder='Ingrese Contraseña' type='password' fullWidth required/>
          
    <FormControlLabel
        control={
          <Checkbox     
            name="checkedB"
            color="primary"
          />
        }
        label="Recordar Contraseña"
      />

      <Button type ='submit' color='primary' variant="contained" fullWidth>Ingresar</Button> 

            </Paper>
        </Grid>

     
    );
}


export default Login;
