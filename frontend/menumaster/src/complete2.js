import React ,{Component,useCallback} from 'react';
import axios from "axios";
import {Button,Grid,Box,TextField,Card, Typography, CardContent, CardMedia, Fab, Badge } from '@mui/material';
import {useNavigate} from 'react-router-dom';
import { Link } from "react-router-dom";
export default class Complete2 extends Component{
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
        <div id='particles-js' className="js-container container"></div>

        <div className='complete-wrapper'>
          <div className="checkmark-circle">
            <div className="background"></div>
            <div className="checkmark draw"></div>
          </div>
          <h1>Congratulations!</h1>
          <p>You are all set. Well done!</p>
          <button className="submit-btn" type="submit">Continue</button>
        </div>
      </div>
    )
  }

}