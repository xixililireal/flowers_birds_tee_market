// 连接池 连接数据库
const mysql=require("mysql");
var pool=mysql.createPool({
		host:"127.0.0.1",
		port:3306,
		user:"root",
		password:"",
		database:"fbm",
		connectionLimit:20
});
// 导出连接池
module.exports=pool;