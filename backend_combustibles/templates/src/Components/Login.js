import React  from 'react';


/*import "../VistasLogin/Login.css";
class  Login extends Component{
    render(){
        return(

<div className="containerPrincipal">
    <div className="containerPrincipal">
        <div className = "form-group">
            <label>Usuario: </label>
            <br />

            <input
                type= "text"
                className = "form-control" />
                <br />
                <label> Contraseña</label>
                <br />
            <input
                type= "password"
                className="form-control" />
                <br/>
                <button className="btn btn-primary"> Iniciar Secion </button>
                </div>
                </div>
                </div>
                
                
           
        );
    }

}*/


import{
    Grid,
    makeStyles,Paper,typograf
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
    const paperStyle={padding:20,heigth:'70vh',width:280,MARGIN:"20px auto"}
    return (
        <Grid>
            <Paper elevation={10} style={paperStyle}>
        Ingresar

            </Paper>
        </Grid>

     
    );
}


export default Login;
