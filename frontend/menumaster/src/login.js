import React ,{Component} from 'react';
import axios from "axios";
import {Button,Grid,Box,TextField } from '@mui/material';

const baseURL = "https://jsonplaceholder.typicode.com/posts";
export default class Login extends Component{
  constructor(props){
    super(props);
    this.state={
      loginned:false,
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

  sendid = () => {
    const {inputid,id}=this.state;
    this.setState({
      id:this.state.inputid
    }, () => {
      console.log(this.state.id);
      this.handleSubmit();
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