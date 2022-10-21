import logo from './logo.svg';
import './App.css';
import React from 'react';
import PersonList from './Post';
import Todo from './todo';
import { BrowserRouter, Routes, Route, useNavigate  } from "react-router-dom";
import Login  from './login';
import Shops from './shops';
import Prounce from './shopfunc'
import Menus from './menus';
import Complete from './complete';
import Complete2 from './complete2';
function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path={`/todo/`} element={<Todo />} />
        <Route path={`/register/`} element={<PersonList />} />
        <Route path={`/login/`} element={<Login />} />
        <Route path={`/shop/`} element={<Shops />} />
        <Route path={`/menu/`} element={<Menus />} />
        <Route path={`/complete/`} element={<Complete />} />
        <Route path={`/complete2/`} element={<Complete2 />} />
        <Route path={`/test/`} element={<Prounce />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
