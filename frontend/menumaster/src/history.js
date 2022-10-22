import React ,{Component,useCallback} from 'react';
import axios from "axios";
import {Button,Grid,Box,TextField,Card, Typography, CardContent, CardMedia,CardActions } from '@mui/material';
import {useNavigate} from 'react-router-dom';
import { Link } from "react-router-dom";
export default class Menuhistory extends Component{
  constructor(props){
    super(props);
    let shoplistjson="";
    if(sessionStorage.getItem('shoplist')!==null){
      shoplistjson=JSON.parse(sessionStorage.getItem('shoplist'));
      console.log(shoplistjson)
    }
    

    
    this.state={
      userid:'',
      shoplist:shoplistjson
    }
    sessionStorage.removeItem("firstupdate");
  }

  



  onInput= (e) => {
    this.setState(
      function(state){
        console.log(e.target.value)
        return {
          inputid:e.target.value
        }
      }
    )
    
  }

  sendid = () => {
    const {inputid,id}=this.state;
    const navigate = useNavigate();
    navigate("/shop",);
    this.setState({
      id:this.state.inputid
    }, () => {
      console.log(this.state.id);
      this.handleSubmit();
  },() => {
    const navigate = useNavigate();
    navigate("/shop",);
  } )
   
  }
//  POST ID
  handleSubmit = function() {


    const user = {
      name: this.state.id
    };

    axios.post(`http://itoho.ddns.net/api/users`, { user })
      .then(res => {
        console.log(res);
        console.log(res.data);
      })
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
    sessionStorage.removeItem('menulist');

    var {shoplist}=this.state;
    var array=Object.entries(shoplist).map(([key, value]) => ({key, value}))
    console.log(array)
    array.sort((a,b)=>b.value.score-a.value.score);
    
    return (
     
      <Grid container style={{padding:"20px"}} spacing={2} alignItems='center' justifyContent='center'>

          <Grid item xs={12} style={{textAlign:"center"}}>
              <h1 >近くの店</h1>
          </Grid>
          

          
            {array.map((shop,index) =>
            <Grid item xs={6} md={4} key={index}>

            <Card variant="outlined">
              <CardContent>
                <Typography sx={{ fontSize: 14 }} color="text.secondary" gutterBottom>
                  レストラン
                </Typography>
                <Typography variant="h5" component="div">
                {shop.value.name}
                </Typography>
                <CardMedia
                  component="img"
                  height="194"
                  image={"/"+shop.value.image_url}
                  alt="Paella dish"
                />
                <Typography variant="body2">
                 
                  <br />
                 
                </Typography>
              </CardContent>
              <CardActions>
              <Link to={"/menu?shopid="+shop.value.id}>
              <Button size="small">来店</Button>
              </Link>
              </CardActions>
              </Card>

            </Grid>
            )}
          

          
          
          
          
      </Grid>
  )
  }
}