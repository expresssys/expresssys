

--用户
create table users(
usId int primary key auto_increment,   --用户id
uname varchar(20),   --用户账号
upwd varchar(50), --密码
urealName varchar(20),   --真实姓名
uaddress  varchar(50) ,--地址
uphone varchar(20),  --手机
utel  varchar(20),--   电话
uemail   varchar(50),    --邮箱
ustatus int ,	--角色       0-用户  1-管理员    
res1  varchar(2000),  --备用字段
 res2  varchar(2000),   --备用字段
 res3  varchar(200),  --备用字段
 res4  varchar(2000)    --备用字段

)

--运输车辆信息
create table car(
  cid int primary key auto_increment,    --车辆编号
  cnumber  varchar(50),   --车牌号
  ctype varchar(50),    --车型
  cbuyDay date ,     --购买日期
  crunNum varchar(50),   --运营证号
  cvolume  double (16,2),--容量(m^3)
  cton   double(16,2),  --吨位
  cstatus int ,     --车辆状态  (0空闲 ，1在途中)
  cisbox  int ,   --是否箱式  (0是，1不是)

spid int ,    --所属单位                                          --
  cremark  varchar(5000),   --备注
  res1 varchar(5000),   --备用字段
  res2 varchar(5000),
  res3  varchar(2000),    --备用字段   
  res4  varchar(2000)    --备用字段

)

alter table car
add constraint FK_shipPoint_car  
foreign key(spid) references shipPoint(spid);
      




--配送单位
create table shipPoint(
 spid  int primary key auto_increment,   --配送id
 spname varchar(100)   ,   --配送点名称
 spperson varchar(20),   --联系人
 sptel varchar(20),  --配送点电话
  spemail  varchar(50),  --联系邮件
  spaddress  varchar(50)  ,--配送点地址
 sptype int ,    --配送点类型 (0配送点, 1代理点)
 sppersonTel varchar(20),   --联系人电话
 spfax varchar(100),   --配送点传真
sparea   varchar(100),   --配送点范围
spremark   varchar(5000),   --备注
res1 varchar(5000),   --备用字段
res2 varchar(5000),
res3  varchar(2000),    --备用字段
res4  varchar(2000)    --备用字段

)

--代理
create table proxy(
 prid int primary key auto_increment,   --id
 prname  varchar(50),   --代理名称
 prtime   varchar(50),  --工作时间
 prprice  double(10,2),    --价格
 prremark  varchar(5000),   --备注
spid int ,--所属单位id                                         --
 res1  varchar(2000),    --备用字段
 res2  varchar(2000),    --备用字段
 res3  varchar(2000)    --备用字段
)


alter table proxy
add constraint FK_shipPoint_proxy  
foreign key(spid) references shipPoint(spid);
  




--配送路线
create table route(
   rid int primary key auto_increment,  --线路id
   rname varchar(100),   --线路名称
   rvia  varchar(2000) ,   --配送线路顺序
   res1  varchar(2000),    --备用字段
   res2  varchar(2000),    --备用字段
   res3  varchar(2000),    --备用字段
   res4  varchar(2000)    --备用字段
)



--司机信息
create table driver(
    did   int primary key auto_increment, --id
    dname varchar(20)  ,--姓名
    dnumber varchar(20),     --驾驶证号
    dphone  varchar(20),     --联系电话
    didCard varchar(20), --身份证
    ddage   int ,--驾龄
    dstatus   int ,   --司机状态(0空闲  ,1在忙)  默认0
 spid  int,    --所属单位                                                   --
    res1  varchar(2000),    --备用字段
    res2  varchar(2000),    --备用字段
    res3  varchar(2000),    --备用字段
    res4  varchar(2000)    --备用字段


)



alter table driver
add constraint FK_shipPoint_driver  
foreign key(spid) references shipPoint(spid);
  

--商品信息
create table goods(
     gid int primary key auto_increment,    --货物编号
     gname varchar(50),   --货物名称
     gcount int ,    --货物数量
     gunit  varchar(50),   --单位
     gprice  double(16,2) ,--货物价值
     gweight double(16,2),   --货物重量(kg)
     gvolume double(16,2),   --货物体积
     gtype    varchar(20),  --货物类别
     gremark varchar(5000),   --备注
                                                     --

     res1  varchar(5000),   --备用字段
     res2    varchar(5000), --备用字段
     res3  varchar(2000),    --备用字段
     res4  varchar(2000)    --备用字段
)

alter table goods
add constraint FK_order_goods  
foreign key(osid) references order(osid);
  



--货物交接表
create  table handover(
   hid int primary key auto_increment,    --id
   hfromSpname  varchar(50),  --初始配送点名称
   htoSpname varchar(50),    --到达配送点名称
   hstartTime Date,    --起始时间
   hendTime　Date ,  --到达时间
   hstatus  int ,   --交接单状态(0未发车，  1已发车，   2已完成)   默认0
cid int ,   --运输车辆id                                                           --
did  int ,-- 司机id                                                          --
osid int ,-- 订单id                                                             --
rid int ,--线路  id                                                        --

   hremark   varchar(5000),  --备注
   res1  varchar(2000),    --备用字段
   res2  varchar(2000) ,
   res3  varchar(2000),    --备用字段
   res4  varchar(2000)    --备用字段

)


alter table handover
add constraint FK_car_handover  
foreign key(cid) references car(cid);
 


alter table handover
add constraint FK_driver_handover  
foreign key(did) references driver(did);
 


alter table handover
add constraint FK_order_handover  
foreign key(osid) references order(osid);
 


alter table handover
add constraint FK_route_handover  
foreign key(rid) references route(rid);
 

--订单表

create table order(
     osid  int primary key auto_increment,   --订单编号
     osendName varchar(20),   --寄件人姓名
     osendTel  varchar(20) , --寄件人电话
     osendAddress  varchar(50),  --寄件人地址
     orecName varchar(20)   --收件人姓名
     orecTel  varchar(20),   --收件人电话
      orecAddress varchar(50),   --收件人地址
      orecCode varchar(20)  ,--收件人邮编
      orecPhone  varchar(20),   --收件人手机号码
      otime Date ,   --订单日期
      oprice   double(10,2),   --配送费
       oinsurePrice  doouble(10,2),    --保价金额
      otype  int ,  --订单类型(0快件, 1慢件,  2大宗)
      ostatus  int ,--订单状态(0未发件, 1已发件, 2已送达)
      ostartTime  Date,   --要求启程时间
      oendTime  Date,    --要求到达时间
      orecSpname   varchar(50),   --接件单位（配送点名)
      oremark  varchar(5000),  --备注

      usId  int,  --用户id                                            --
      spid  int ,-- 所属单位id                                          --
      res1 varchar(2000),    --备用字段
      res2 varchar(2000),    --备用字段
      res3 varchar(2000),     --备用字段
      res4  varchar(2000)   --备用字段


)



alter table order
add constraint FK_users_order  
foreign key(usId) references users(usId);
  

alter table order
add constraint FK_shipPoint_order  
foreign key(spid) references shipPoint(spid);
 


--价格表
create table price(
    pid int primary key auto_increment,  --价格编号
    pfrom varchar(50),   --起始地址
    pto varchar(50),   --终点地址
    pfirstwei   double(16,2),  --首重价格
    prestwei    double(16,2),    --次重价格
    pfirstvol   double(16,2) ,   --首立方价格
    prestvol   double(16,2),   --次立方价格
    pretime   varchar(20),          --预计时间
    res1 varchar(2000),
    res2  varchar(2000),
    res3 varchar(2000),
    res4  varchar(2000)



)


--订单详细
create table orderInfo(
  orderId int primary key auto_increment,
  osid  int,           --
  gid  int ,               --
  res1 varchar(2000)


)
alter table order
add constraint FK_orderInfo_order  
foreign key(osid) references order(osid);


alter table order
add constraint FK_goods_order  
foreign key(gid) references goods(gid);
