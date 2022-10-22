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
const Neomenu = () => {

    const search = useLocation().search;

    const query = new URLSearchParams(search);
    const [userid, setUserid] = useState("")
    const [selectmenuid, setSelectmenuid] = useState(0)
    const [selectmenuname, setSelectmenuname] = useState("")

    const [open, setOpen] = React.useState(false);

    const handleClickOpen = (mid,mname) => {
      setSelectmenuid(mid);
      setSelectmenuname(mname);
      setOpen(true);
    };





    const handleClose = () => {
      setOpen(false);
    };

    const okhandleClose = async() => {
      await axios.post("http://itoho.ddns.net/api/menues" ,{menu_id: selectmenuid,user_id:localStorage.getItem("userid"),store_id:query.get("shopid")})
        .then(res => {
          console.log({menu_id: selectmenuid,user_id:localStorage.getItem("userid")});
          console.log(res);
          console.log(res.data);
          sessionStorage.removeItem("menulist");
          setOpen(false);
          window.setTimeout(forcelateupdate,2000);



        })

      await axios.post("http://itoho.ddns.net/api/check_complete" ,{user_id:localStorage.getItem("userid"),store_id:query.get("shopid")})
        .then(res => {
          console.log(res.data);
          if(res.data=="100%"){
            window.setTimeout(forcelateupdate,2000);
          }
          setOpen(false);

      })

    };






    axios.get("http://itoho.ddns.net/api/menues?store_id=" + query.get("shopid")+"&user_id="+localStorage.getItem("userid"))
      .then(res => {
        console.log(res);
        console.log(res.data);
        sessionStorage.setItem('menulist',JSON.stringify(res.data));


      })



    console.log(query.get('shopid'));
    let menulistjson="";

    if(sessionStorage.getItem('menulist')!==null){
      menulistjson=JSON.parse(sessionStorage.getItem('menulist'));
    }



    for (let key in menulistjson["recommend"]) {
      menulistjson["recommend"][key].already=false;
      for (let key2 in menulistjson["complete"]) {
          if(menulistjson["recommend"][key].id==menulistjson["complete"][key2].menu_id){
          menulistjson["recommend"][key].already=true;
        }
      }
    }

    for (let key in menulistjson["menues"]) {
      menulistjson["menues"][key].already=false;
      for (let key2 in menulistjson["complete"]) {
          if(menulistjson["menues"][key].id==menulistjson["complete"][key2].menu_id){
          menulistjson["menues"][key].already=true;
        }
      }
    }





    console.debug(menulistjson);

    const [menulist, setMenulist] = useState(menulistjson)



    menulistjson=[
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

    var array=Object.entries(menulist).map(([key, value]) => ({key, value}))
    console.log(array)
    console.log(menulist["menues"])
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

    const lateupdate=function(){
      if(sessionStorage.getItem("firstupdate")==null){
        sessionStorage.setItem("firstupdate","ok");
        window.location.reload();
      }
    }

    const forcelateupdate=function(){
      sessionStorage.setItem("firstupdate","ok");
        window.location.reload();
    }

    window.setTimeout(lateupdate,2000);



    return (
     <div>
      <Grid container style={{padding:"20px"}} spacing={2} alignItems='center'>
          <Grid item xs={12} style={{textAlign:"center", fontSize:"150%"}}>
              <h1>メニューー覧</h1>
          </Grid>

          <Grid item xs={12} style={{textAlign:"center"}}>
              <h1 >おすすめ</h1>
          </Grid>
          <Dialog
            open={open}
            onClose={handleClose}
            aria-labelledby="alert-dialog-title"
            aria-describedby="alert-dialog-description"
          >
            <DialogTitle id="alert-dialog-title">
              {"記録"}
            </DialogTitle>
            <DialogContent>
              <DialogContentText id="alert-dialog-description">
                {selectmenuname}を記録しますがよろしいですか？
              </DialogContentText>
            </DialogContent>
            <DialogActions>
              <Button onClick={handleClose}>いいえ</Button>
              <Button onClick={okhandleClose} autoFocus>
                はい
              </Button>
            </DialogActions>
          </Dialog>


            {menulist["recommend"].map((menu,index) =>
            <Grid item xs={6} md={4} key={menu.id+"rec"}>

              <Card variant="outlined" >
              <CardContent style={{position:"relative"}}>
                <CardMedia
                  component="img"
                  height="194"
                  image={"/"+menu.image_url}
                  alt="Paella dish"
                />


                <Typography variant="h5" component="div"  style={{textAlign:"center"}}>
                  {menu.name}
                </Typography>
                <Typography variant="body2">
                  {menu.price} 円
                  <br /> {menu.already ? "制覇済み":"未制覇"}
                </Typography>
                <Button variant="outlined" onClick={()=>handleClickOpen(menu.id,menu.name)}>
            食べた
          </Button>
              </CardContent>
              {menu.already?
                <img style={checkbox} height="120px" src='https://i0.wp.com/sozaikoujou.com/wordpress/wp-content/uploads/2015/04/th_business_icon_ca_124.png?w=860&ssl=1'/>
                :""

              }
              </Card>

            </Grid>
            )}

          <Grid item xs={12} style={{textAlign:"center"}}>
              <h1 >すべての商品</h1>
          </Grid>

          {menulist["menues"].map((menu,index) =>
            <Grid item xs={6} md={4} key={menu.id}>

            <Card variant="outlined" >
              <CardContent >
                <CardMedia
                  component="img"
                  height="194"
                  image={"/"+menu.image_url}
                  alt="Paella dish"
                />
                 {menu.already?
                <img style={checkbox} height="120px" src='https://i0.wp.com/sozaikoujou.com/wordpress/wp-content/uploads/2015/04/th_business_icon_ca_124.png?w=860&ssl=1'/>
                :""

              }
                <Typography variant="h5" component="div"  style={{textAlign:"center"}}>
                  {menu.name}
                </Typography>
                <Typography variant="body2">
                  {menu.price} 円
                  <br />
                  <br /> <h2>{menu.already? "制覇済み":"未制覇"}</h2>
                </Typography>
                <Button variant="outlined" onClick={()=>handleClickOpen(menu.id,menu.name)}>
            食べた
          </Button>

              </CardContent>

              </Card>

            </Grid>
            )}



      </Grid>
      <div style={{height: "200vh"}}>
        <div style={wrapperDiv} />
        <div style={regularDiv}>
        <Grid container alignItems='center' justifyContent='center'>
          <Grid item xs={6} style={{textAlign:"center"}}>
          <Card variant="outlined" style={{backgroundColor: "yellow"}}>
            <Link to="/shop">
              <CardContent>

              <h1 >店舗一覧</h1>

              </CardContent>
              </Link>
              </Card>
          </Grid>

          <Grid item xs={6} style={{textAlign:"center"}}>
          <Card variant="outlined" style={{backgroundColor: "yellow"}}>
            <Link to="/history?shop_id=1">
              <CardContent>

              <h1 >履歴</h1>

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

export default Neomenu;