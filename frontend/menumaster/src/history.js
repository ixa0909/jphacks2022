import React ,{Component,useCallback,useState} from 'react';
import axios from "axios";
import {Button,Grid,Box,TextField,Card, Typography, CardContent, CardMedia, Fab, Badge } from '@mui/material';
import {useNavigate,useLocation } from 'react-router-dom';
import { Link } from "react-router-dom";
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
const Menuhistory = () => {

    const search = useLocation().search;

    const query = new URLSearchParams(search);
    const [userid, setUserid] = useState("")
    const [historytree, setHistorytree] = useState()

    const [open, setOpen] = React.useState(false);
    axios.get("http://itoho.ddns.net/api/history?store_id=" + query.get("shopid")+"&user_id="+localStorage.getItem("userid"))
    .then(res => {
      console.log(res);
      console.log(res.data);
      sessionStorage.setItem('shoplist',JSON.stringify(res.data));

      
    })
    

    

    return (
      
     <div>
       <Grid container alignItems='center' justifyContent='center' direction="column">
         
          <Grid item xs={10}>
              <h1>一覧</h1>
          </Grid>
          {historytree}
          
        </Grid>
        
        
      </div>
      
      
  )


  
}

export default Menuhistory;