import React ,{Component,useCallback} from 'react';
import axios from "axios";
import {Button,Grid,Box,TextField } from '@mui/material';
import {Navigate} from 'react-router-dom';

export default class Login extends Component{
  constructor(props){
    super(props);
    this.state={
      submitted:false,
      inputid:'',
      id:''
    };
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

  sendid = (e) => {
    e.preventDefault();
    const {inputid,id}=this.state;
    this.setState({
      id:this.state.inputid
    }, () => {
      console.log(this.state.id);
      this.handleSubmit()
    })
   
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
        sessionStorage.setItem('shoplist',JSON.stringify(res.data));
        localStorage.setItem('userid',this.state.id);
        console.log("navigate");
        this.setState({submitted: true});
        window.location.href="/shop";
        
      })
  }



  render(){
    const {id}=this.state;
   
    return (
      
      <Grid container alignItems='center' justifyContent='center' direction="column">
          <Grid item xs={12}>
              <p>IDを入力してください</p>
          </Grid>
          <Grid item xs={12}>
            <TextField id="outlined-basic" label="ID" variant="outlined" onInput={this.onInput}/>
          </Grid>
          <Grid item xs={12}>
            <Button variant="contained" onClick={this.sendid}>ログイン</Button>
          </Grid>
          
      </Grid>
  )
  }
}