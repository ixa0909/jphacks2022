import React ,{Component,useCallback} from 'react';
import axios from "axios";
import {Button,Grid,Box,TextField,Card, Typography, CardContent, CardMedia, Fab, Badge } from '@mui/material';
import {useNavigate} from 'react-router-dom';
import { Link } from "react-router-dom";
export default class Complete extends Component{
  constructor(props){
    super(props);
    this.state={
      userid:'',
    }
  }

  


  render(){
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

    
    return (
      <div>
        <div id="particles-js"></div>
      <div id="wrapper">
      この中にコンテンツが入ります。
      </div>
        </div>
      
        )
  }
      
}