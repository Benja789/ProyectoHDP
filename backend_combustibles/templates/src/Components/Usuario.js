import React from 'react';

import{
Grid,makeStyles,AppBar,Typography,Button,Avatar,Paper,Tab,Tabs, Box

}from '@material-ui/core';

const useStyle = makeStyles((theme)=>({
    root: {
      margin: theme.spacing(1)
   
    }/*agregar estilo css*/,
    paper:{
      padding: 20,
      height:'100vh',
      width:'90%',
      margin:"20px auto",
   },
   Button:{
     margin:"5%",
     position:"relative",
     float:"right",
     spacing:"8%"
    
   },
 
  
}));


const Usuario = () =>{
    const classes = useStyle()
    const [value, setValue] = React.useState(2);
    const handleChange = (event, newValue) => {
      setValue(newValue);
    };
    
    return(
<Grid container="fixed" fullWidth>

<AppBar position="static">
  
   <Avatar className={classes.avatar} ></Avatar>
    <Typography variant="h4" className={classes.title}  >
      Historial de Usuarios     
    </Typography>  
</AppBar>


<Box m={2} pt={1} >
      <Button variant="contained" color="primary">Ingresar Precio </Button>
      <Button variant="contained" color="primary">Salir </Button>
      </Box>
   
  

  <Paper  className={classes.paper} elevation={15} >

    <Grid>
    <Paper square>
        <Tabs
          value={value}
          indicatorColor="primary"
         textColor="primary"
          onChange={handleChange}
          aria-label="disabled tabs example" >
        <Tab label="Modelo Calculado" />
        <Tab label="Graficos" />
  </Tabs>
</Paper>
 </Grid>
  
  </Paper> 

</Grid>


    );
}
export default Usuario;