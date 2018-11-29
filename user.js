// 路由
const express=require("express");
const pool=require("../pool.js");

// 创建空路由器
var router=express.Router();

// 判断用户登录信息，返回结果

router.post("/login",(req,res)=>{
		var $uname=req.body.uname;
		var $upwd=req.body.upwd;
		if(!$uname){
			res.send("uname 不存在");
			return;
		}
		if(!$upwd){
			res.send("upwd 不存在");
			return;
		}
		var sql="select * from fbm_user where uname=? and upwd=?";
		pool.query(sql,[$uname,$upwd],(err,result)=>{
				if(err) throw err;
				if(result.length>0){
					res.send("1");  // 有响应1
				}else{
					res.send("0"); // 没有响应0
				}
		});
});

// 判断用户名是否被占用
router.get("/loginUname",(req,res)=>{
		var $uname=req.query.uname;
		if(!$uname){
			res.send("uname 不存在");
			return;
		}
		var sql="select * from fbm_user where uname=?";
		pool.query(sql,[$uname],(err,result)=>{
			if(err) throw err;
			if(result.length>0){
				res.send("1");// 被占用响应1
			}else{
				res.send("0");// 没被占用响应0
			}
		});
});

// 用户注册
router.post("/register",(req,res)=>{
		var $uname=req.body.uname;
		var $upwd=req.body.upwd;
		var $email=req.body.email;
		var $phone=req.body.phone;
		if(!$uname){
			res.send("uname 不存在");
			return;
		}
		if(!$upwd){
			res.send("upwd 不存在");
			return;
		}
		var sql="insert into fbm_user values(null,?,?,?,?,null,null,null)";
		pool.query(sql,[$uname,$upwd,$email,$phone],(err,result)=>{
				if(err) throw err;
				if(result.affectedRows>0){
					res.send("1"); // 有一列受影响，响应1
				}else{
					res.send("0"); // 没有一列受影响，响应0
				}
		});
});

// 判断注册用户名是否被占用
router.get("/registerUname",(req,res)=>{
		var $uname=req.query.uname;
		if(!$uname){
			res.send("uname 不存在");
			return;
		}
		var sql="select * from fbm_user where uname=?";
		pool.query(sql,[$uname],(err,result)=>{
			if(err) throw err;
			if(result.length>0){
				res.send("0");// 用户名被占用 响应0
			}else{
				res.send("1");// 用户名没被占用 响应 1
			}
		});
});

// 判断注册邮箱是否被注册
router.get("/registerEmail",(req,res)=>{
		var $email=req.query.email;
		if(!$email){
			res.send("email 不存在");
			return;
		}
		var sql="select * from fbm_user where email=?";
		pool.query(sql,[$email],(err,result)=>{
			if(err) throw err;
			if(result.length>0){
				res.send("0");// 邮箱被占用 响应0
			}else{
				res.send("1");// 邮箱没被占用 响应 1
			}
		});
});

// 判断注册手机号是否被注册
router.get("/registerPhone",(req,res)=>{
		var $phone=req.query.phone;
		if(!$phone){
			res.send("phone 不存在");
			return;
		}
		var sql="select * from fbm_user where phone=?";
		pool.query(sql,[$phone],(err,result)=>{
			if(err) throw err;
			if(result.length>0){
				res.send("0");// 邮箱被占用 响应0
			}else{
				res.send("1");// 邮箱没被占用 响应 1
			}
		});
});

// 用户列表
router.get('/list',(req,res)=>{
	  var sql="select * from fbm_user";
	  pool.query(sql,(err,result)=>{
			if(err) throw err;
			if(result.length>0){
				res.send(result);
			}else{
				res.send("0");  // 如果没有获取到数据，响应0
			}
	  });
});

// 用户删除
router.post("/delete_user",(req,res)=>{
		var $uid=req.body.uid;
		if(!$uid){
			res.send("uid 不存在");
			return;
		}
		var sql="delete from fbm_user where uid=?";
		pool.query(sql,[$uid],(err,result)=>{
			if(err) throw err;
			if(result.affectedRows>0){
				res.send("1");
			}else{
				res.send("0");
			}
		});
});

// 获取用户信息
router.get("/update",(req,res)=>{
		var $uid=req.query.uid;
		if(!$uid){
			res.send("uid 不存在");
			return;
		}
		var sql="select * from fbm_user where uid=?";
		pool.query(sql,[$uid],(err,result)=>{
				if(err) throw err;
				if(result.length>0){
					res.send(result);
				}else{
					res.send("0");
				}
		});
});

// 用户更新 update
router.post("/updateUser",(req,res)=>{
		var $uid= req.body.uid;
		console.log($uid);
		var $uname= req.body.uname;
		var $upwd= req.body.upwd;
		var $email= req.body.email;
		var $phone= req.body.phone;
//		var $avatar= req.body.avatar;
		var $userName= req.body.userName;
		var $gender= req.body.gender;
		if(!$uid){
			res.send("uid 不存在");
			return;
		}
		var sql="update fbm_user set uname=?,upwd=?,email=?,phone=?,userName=?,gender=? where uid=?";
		pool.query(sql,[$uname,$upwd,$email,$phone,$userName,$gender,$uid],(err,result)=>{
			if(err) throw err;
			if(result.affectedRows>0){
				res.send("1");
			}else{
				res.send("0");
			}
		});
});
// 分页
router.post("/paging",(req,res)=>{
	var $pno=parseInt(req.body.pno);
	console.log($pno);
	var $count=parseInt(req.body.count);
	if(!$pno||$pno<0){
		$pno=0;
	}
	if(!$count){
		$count=2;
	}
	var sql="select * from fbm_user limit ?,?";
	
	pool.query('select * from fbm_user limit ?,?',[$pno,$count],(err,result)=>{
			
			if(err) throw err;
			
			if(result.length>0){
				res.send(result);
				
			}else{
				res.send("0");
			}
	});
});
// 导出路由
module.exports=router;