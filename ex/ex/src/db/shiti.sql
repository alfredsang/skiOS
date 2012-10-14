CREATE TABLE tb_shiti(id INTEGER primary key autoincrement,tid string,zid string,tName text,tPicAddr string , a1 string, a2 string, a3 string, a4 string, a5 string, tanswer string, tdesc string,chapter string)



CREATE TABLE  tb_shoucang(
    scid INTEGER primary key autoincrement,
    tid number,
    tnum number,
    TNAME VARCHAR2(255),
    CREATE_TIME DATETIME DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime'))
);


CREATE TABLE  tb_cuoti(
    scid INTEGER primary key autoincrement,
    tid number,
    tnum number,
    TNAME VARCHAR2(255),
    CREATE_TIME DATETIME DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime'))
);


insert into tb_shoucang(tid,tnum,tname) values(11,11,'22');

select date(create_time) from tb_shoucang;

1.|第一章:道路交通安全法律、法规和规章|190
2.|第二章:交通信号及其含义|158
3.|第三章:安全行车、文明驾驶知识|153
4.|第四章:恶劣气象和复杂道路条件下的安全驾驶知识|78
5.|第五章:紧急情况时临危处置知识|84
6.|第六章:机动车构造和安全装置、检查和维护基本知识|38
7.|第七章:事故后的自救、急救以及常见危险化学品等知识|24
8.|客车专用试题|57
9.|货车专用试题|68
10.|第十章:轮式自行车机械车专用试题|50
11.|四川地区专题|130
12.|山东地区专题|158
13.|山西地区专题|100
14.|河北地区专题|199
15.|上海地区专题|56
16.|安徽地区专题|45
17.|黑龙江地区专题|216
18.|宁夏地区专题|80
19.|北京地区专题|100



1.1.,道路交通安全法
1.2.,交通安全法实施条例
1.3.,刑法
1.4.,道路交通安全违法行为处理程序规定
1.5.,交通事故处理程序规定
1.6.,机动车驾驶证申领和使用规定
1.7.,机动车登记规定
1.8.,机动车交通事故强制保险条例
2.1.,交通信号灯
2.2.,交通标志
2.3.,交通标线
2.4.,交通警察手势信号
3.1.,安全操作要领
3.2.,驾驶环境对安全行车的影响
3.3.,文明驾驶
3.4.,安全驾驶行为
4.1.,高速公路安全驾驶知识
4.2.,山区道路安全驾驶知识
4.3.,通过桥梁、隧道的安全驾驶知识
4.4.,夜间安全驾驶知识
4.5.,恶劣气象和复杂道路条件下的安全驾驶知识
5.1.,轮胎爆胎时的应急处置
5.2.,转向突然不灵、失控时的应急处置
5.3.,制动突然失灵时的应急处置
5.4.,发动机突然熄火应急处置
5.5.,车辆侧滑时的应急处置
5.6.,车辆碰撞时的应急处置
5.7.,车辆倾翻时的应急处置
5.8.,车辆发生火灾时的应急处置
5.9.,车辆落水后的应急处置
5.10.,高速公路紧急避险
5.11.,遇横风时的应急处置
5.12.,紧急情况处置的原则
6.1.,机动车总体构造常识
6.2.,主要安全装置常识
6.3.,车辆日常检查和维护基本知识
7.1.,伤员自救、急救知识
7.2.,常见危险化学品知识
8.1.,客车专用试题
9.1.,货车专用试题
10.1.,轮式自行机械车专用试题
11.1.,第一节
11.2.,第二节
11.3.,第三节
11.4.,第四节
11.5.,第五节
12.1.,山东专用
13.1.,山西专用
14.1.,河北专用
15.1.,第一节
15.2.,第二节
15.3.,第三节
15.4.,第四节
16.1.,安徽专用
17.1.,第一节
17.2.,第二节
18.1.,宁夏专用
19.1.,北京专用