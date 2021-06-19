import React, {useState, useEffect, useRef} from 'react';
import {
    makeStyles,
    CircularProgress,
} from '@material-ui/core';
import {Redirect} from 'react-router-dom';

const useStyles = makeStyles(theme => ({
  root: {
    display: 'flex',
    alignItems: 'center',
  },
  circular:{
    position: 'absolute',
    top: '50%',
    left: '50%',
    margin: '-25px 0 0 -25px',
  },
  wrapper: {
    margin: theme.spacing(1),
    position: 'relative',
  },
}));

export default function CircularIntegration() {
  const classes = useStyles();
  const [loading, setLoading] = useState(false);
  const[primera, setPrimera] =useState(false);
  const timer = useRef();

  useEffect(() => {
    handleButtonClick();
  });
/*
  useEffect(() => {
    handleButtonClick();
    return () => {
      clearTimeout(timer.current);
    };
  }, []);*/

  const handleButtonClick = () => {
    if (!loading) {
      setLoading(true);
      timer.current = setTimeout(() => {
        setLoading(false);
        setPrimera(true);
      }, 500);
    }
  };

  return (
    <div className={classes.root}>
        {loading && <CircularProgress className={classes.circular}/>}
        {primera && <Redirect to='/inicio'  />}
    </div>
  );
}