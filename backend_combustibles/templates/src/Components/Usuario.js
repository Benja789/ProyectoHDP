import React from 'react';

import{
Grid,makeStyles,Toolbar,AppBar,Typography,Button,IconButton,Avatar

}from '@material-ui/core';

const useStyle = makeStyles((theme)=>({
    root: {
   
    }/*agregar estilo css*/, 

}));


const Usuario = () =>{
    const classes = useStyle()
    return(

<AppBar position="static">
  <Toolbar>
    <IconButton edge="start" className={classes.menuButton} color="inherit" aria-label="menu">
      
    </IconButton>
    <Typography variant="h5" className={classes.title}>
      Historial de Usuarios
    </Typography>
    <Avatar className={classes.avatar} ></Avatar>
  </Toolbar>
</AppBar>
    );
}
export default Usuario;