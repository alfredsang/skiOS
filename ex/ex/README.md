# 更新内容

## 2012-09-09
增加了skiOS/ex/ex/src/resource/psd/jk_main.psd,第一次做ps，还成，就是把现有内容用ps重新摆放一番

TODO:
关联出是否已收藏过--可做可不做
select tid,zid,tName, tanswer,  a1, a2, a3, a4,tdesc from tb_shiti a left join tb_shoucang on a.zid = b.tname....

filterLeftRotation |  filterHorizontalFlip

#章节做分类
- 阅读
- 模拟
- 测试
- 错误题库

## db


 
### tb_shiti结构说明

｜－ id －｜－tid －｜－zid －｜－ tName |- tPicAddress －｜－ a1 －a5 －｜－ tanswer －｜－ tdesc －｜

- id          自增id
- tid         章节-带点
- zid         章节-数值
- tName       试题内容
- tPicAddress 图片地址
- a1          试题选项
- a2          试题选项
- a3          试题选项
- a4          试题选项
- tanswer     答案
- tdesc       答案解释或提示

### tb_shoucang结构说明

- scid        自增id
- tid         章节-带点100100
- tnum        当前次编号（当前次有用）
- TNAME       题目名称
- CREATE_TIME 


### sql记录

    drop TABLE tb_shiti;
    CREATE TABLE tb_shiti(id INTEGER primary key autoincrement,tid string,zid string,tName text,tPicAddress string , a1 string, a2 string, a3 string, a4 string, a5 string, tanswer string, tdesc string);

    insert into tb_shiti(tid,zid,tName, tanswer,  a1, a2, a3, a4,tdesc)  values('1.1.1.1','100100','机动车驾驶人、行人违反道路交通安全法律、法规关于道路通行规定的行为，属于___。','n2','违章行为', '违法行为','过失行为','过错行为','=====违反道路交通安全法律、法规=====明显的是违法，题干已暗示了是=====违法=====行为。');

    CREATE TABLE tb_shoucang(    scid INTEGER primary key autoincrement,
    tid number,    tnum number,    TNAME VARCHAR2(255),    CREATE_TIME TIMESTAMP DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime')))


 
 

rails generate scaffold iLog appname:string appVersion:string filename:string linename:integer loglevel:string logcategoryname:string logcontent:text

在rails里，id和创建的时间戳是默认生成。所以上面的语句足够了。




## 模式

typedef enum {
    PatternModel_Seq = 0,//顺序练习
    PatternModel_Random = 1,//随机练习
    PatternModel_Chapter = 2,//章节练习
    PatternModel_Exam = 3,//模拟考试-交卷，收藏
} MyPatternModel;

- 自由模式
    --顺序练习
    --随机练习
    --章节练习
- 答题模式
    --模拟考试

## 公共设置

下拉

- 答题后直接跳到下一页
- 答题后显示答案
- 答题后显示解释信息
- 答题模式，自由|答题

##功能设计

### 顺序练习
1------最后

### 随机练习
产生随机数（1--最后）

#### 查出所有随机题的id，然后仍然按照id去查题，这样效率更好



### 章节练习
分类

### 模拟考试
-交卷，收藏，限时

### 我的错题


### 我的收藏


查看答案
收藏里，移除此题，取消收藏，查看答案

 
- [清空考试痕迹按钮]




题号：原型-翻转动画

半模式--让你看题一半，连蒙带猜的去答题

任意2题比较，

收集错题号--server

                   
                   
                   
- 完成试题总数 

从NSUserDefault中取SHITI_COUNT_NUMBER


                                
                                             
                                             
### 颜色说明
- 没答过的题是黑色，题号是绿色
- 答过的题和题号都是橙色
                                                          
## TODO

### 点击之后0.5s后跳到下一个题目（放到配置项，默认不跳）
### 下拉的时候，提供关闭按钮
### 修改下拉动画
### 顺序情况下，保留最后一次题号
### 顺序情况下，保留答题记录，有用户控制是否情况
### 所有的收藏和错题统一出口


##顺序练习
###1 进入时如果有状态，需要提示是否继续/是否重新开始
###2 全部题目，显示750道题目和未答题状态
###3 题目详解增加关闭按钮
###4 默认手动触发进入下一题，可设置自动进入下一题
###5 手动收藏功能、错题自动进入错题库

##随机练习
###1 每次进入重新随机题目
###2 手动收藏功能、错题自动进入错题库

...

