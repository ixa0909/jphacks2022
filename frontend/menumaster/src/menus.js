import React ,{Component,useCallback} from 'react';
import axios from "axios";
import {Button,Grid,Box,TextField,Card, Typography, CardContent, CardMedia } from '@mui/material';
import {useNavigate} from 'react-router-dom';
import { Link } from "react-router-dom";
export default class Shops extends Component{
  constructor(props){
    super(props);
    let shoplistjson="";
    if(sessionStorage.getItem('shoplist')!==null){
      shoplistjson=JSON.parse(sessionStorage.getItem('shoplist'));
    }
    shoplistjson=[
      {
        "name":"1号店",
        "score":100
      },
     {
        "name":"2号店",
        "score":300
      },
     {
        "name":"3号店",
        "score":600
      },
     {
        "name":"4号店",
        "score":200
      },
    ]

    
    this.state={
      userid:'',
      shoplist:shoplistjson
    }
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

    axios.post(`https://jsonplaceholder.typicode.com/users`, { user })
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

    var {shoplist}=this.state;
    var array=Object.entries(shoplist).map(([key, value]) => ({key, value}))
    console.log(array)
    array.sort((a,b)=>b.value.score-a.value.score);
    
    return (
     
      <Grid container style={{padding:"50px"}} spacing={2} alignItems='center' justifyContent='center'>

          <Grid item xs={12} style={{textAlign:"center"}}>
              <h1 >近くの店</h1>
          </Grid>
          

          
            {array.map((shop,index) =>
            <Grid item xs={6}>

            <Card variant="outlined">
              <CardContent>
                <Typography sx={{ fontSize: 14 }} color="text.secondary" gutterBottom>
                  Word of the Day
                </Typography>
                <Typography variant="h5" component="div">
                  belent
                </Typography>
                <CardMedia
                  component="img"
                  height="194"
                  image="https://2.bp.blogspot.com/-8e0uXTq3_kY/VIhO71OvUrI/AAAAAAAApjs/J9lzC2aJE6c/s800/food_gyudon.png"
                  alt="Paella dish"
                />
                <Typography variant="body2">
                  well meaning and kindly.
                  <br />
                  {'"a benevolent smile"'}
                </Typography>
              </CardContent>
              
              </Card>

            </Grid>
            )}
          

          
          
          
          
      </Grid>
  )
  }
}