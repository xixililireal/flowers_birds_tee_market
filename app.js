//创建服务器
const express=require("express");
// 引入第三方处理post请求
const bodyParser=require("body-parser");
// 路由 
const userRouter=require("./routers/user.js");
var app=express();
app.listen(3001);

//托管静态资源
app.use(express.static("./public"));
app.use(express.static("./public/html"));

// 引用body-parser 处理post请求

app.use(bodyParser.urlencoded({
	extended:false
}));

//将用户路由挂载到 /user下
app.use('/user',userRouter);

