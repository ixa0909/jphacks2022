import React ,{Component,useCallback} from 'react';
import axios from "axios";
import {Button,Grid,Box,TextField,Card, Typography, CardContent, CardMedia,CardActions } from '@mui/material';
import {useNavigate} from 'react-router-dom';
import { Link } from "react-router-dom";
function Prounce(props)  {

  const {id}=this.state;

    if (localStorage.getItem("userid")==null){
      return (
        
        <Grid container alignItems='center' justifyContent='center' direction="column">
          
          <Link to="/login">
          <Grid item xs={12}>
              <h1>ログインする</h1>
          </Grid>
          </Link>
          <Grid item xs={12}>
            <p>ログインされていません</p>
          </Grid>
        </Grid>
        
      );
    }

    var {shoplist}=this.state;
    var array=Object.entries(shoplist).map(([key, value]) => ({key, value}))
    console.log(array)
    array.sort((a,b)=>b.value.score-a.value.score);

  return(
  <div>
    <div className='language-name'>aaaaa</div>
    
  </div>
  )
}
export default Prounce;