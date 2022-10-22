import React ,{Component} from 'react';
import Button from '@mui/material/Button';
export default class Todo extends Component{
  constructor(props){
    super(props);
    this.state={
      todos:[],
      name:''
    };
  }

  onInput= (e) => {
    this.setState({
      name:e.target.value
    });
  }

  addTodo = () => {
    const {todos,name}=this.state;
    this.setState({
      todos:[...todos,name]
    });
  }

  removeTodo = (index) => {
    const{todos,name}= this.state;
    this.setState({
      todos: [...todos.slice(0,index),...todos.slice(index+1)]
    });
  }

  render(){
    const {todos} = this.state;
    return (<div>
      <input type="text" onInput={this.onInput} />
      <Button variant="contained" onClick={this.addTodo}>登録</Button>
      <ul>
        {todos.map((todo,index) => <li key= {index}>{todo}<button onClick={()=>{this.removeTodo(index)}}>削除</button></li>)}
      </ul>
    </div>);
  }
}