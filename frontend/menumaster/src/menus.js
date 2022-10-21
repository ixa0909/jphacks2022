import React ,{Component,useCallback} from 'react';
import axios from "axios";
import {Button,Grid,Box,TextField,Card, Typography, CardContent, CardMedia, Fab, Badge } from '@mui/material';
import {useNavigate} from 'react-router-dom';
import { Link } from "react-router-dom";
export default class Menus extends Component{
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

    //sticky reyout
    let regularDiv = {
      textAlign: "center",
      position: "fixed",
      left: "0",
      bottom: "20px",
      height: "80px",
      width: "100%",
  }
    let wrapperDiv = {
      display: 'block',
      padding: '20px',
      height: '80px',
      width: '100%',
    }

    let checkbox = {
      position:"absolute",
      top:"25px",
      left:"25px"
    }
    
    return (
     <div>
      <Grid container style={{padding:"20px"}} spacing={2} alignItems='center' justifyContent='center'>
          <Grid item xs={12} style={{textAlign:"center", fontSize:"150%"}}>
              <h1>メニューー覧</h1>
          </Grid>

          <Grid item xs={12} style={{textAlign:"center"}}>
              <h1 >おすすめ</h1>
          </Grid>
          

          
            {array.map((shop,index) =>
            <Grid item xs={6} md={4}>

            <Card variant="outlined">
              <CardContent style={{position:"relative"}}>
              
              <CardMedia
                  
                  component="img"
                  height="294"
                  image="https://2.bp.blogspot.com/-8e0uXTq3_kY/VIhO71OvUrI/AAAAAAAApjs/J9lzC2aJE6c/s800/food_gyudon.png"
                  alt="Paella dish"
                />
                <img style={checkbox} height="120px" src='https://i0.wp.com/sozaikoujou.com/wordpress/wp-content/uploads/2015/04/th_business_icon_ca_124.png?w=860&ssl=1'/>
                <Typography variant="h5" component="div"  style={{textAlign:"center"}}>
                  牛丼
                </Typography>
                <Typography variant="body2">
                  well meaning and kindly.
                  <br />
                  {'"a benevolent smile"'}
                </Typography>
              </CardContent>
              
              </Card>

            </Grid>
            )}
          
          <Grid item xs={12} style={{textAlign:"center"}}>
              <h1 >すべての商品</h1>
          </Grid>
          
          {array.map((shop,index) =>
            <Grid item xs={6}>

            <Card variant="outlined" >
              <CardContent >
                <CardMedia
                  component="img"
                  height="194"
                  image="https://2.bp.blogspot.com/-8e0uXTq3_kY/VIhO71OvUrI/AAAAAAAApjs/J9lzC2aJE6c/s800/food_gyudon.png"
                  alt="Paella dish"
                />
                <Typography variant="h5" component="div"  style={{textAlign:"center"}}>
                  牛丼
                </Typography>
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
      <div style={{height: "200vh"}}>
        <div style={wrapperDiv} />
        <div style={regularDiv}>
        <Grid container alignItems='center' justifyContent='center'>
          <Grid item xs={4} style={{textAlign:"center"}}>
          <Card variant="outlined" style={{backgroundColor: "yellow"}}>
            <Link to="/login">
              <CardContent>
              
              <h1 >おすすめ</h1>
             
              </CardContent>
              </Link>
              </Card>
          </Grid>
          <Grid item xs={4} style={{textAlign:"center"}}>
          <Card variant="outlined" style={{backgroundColor: "yellow"}}>
            <Link to="/login">
              <CardContent>
              
              <h1 >おすすめ</h1>
             
              </CardContent>
              </Link>
              </Card>
          </Grid>
          <Grid item xs={4} style={{textAlign:"center"}}>
          <Card variant="outlined" style={{backgroundColor: "yellow"}}>
            <Link to="/login">
              <CardContent>
              
              <h1 >おすすめ</h1>
             
              </CardContent>
              </Link>
              </Card>
          </Grid>
          
        </Grid>

        </div>
      </div>
        
      </div>
      
      
  )


  }
}