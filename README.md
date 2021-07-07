# Crisroad-of-study-FPGA  
VHDL+FPGA，不定时更新  

### 1. Full adder  
##### 全加器  
|文件名|实现方式|  
|--|--|  
|add1.vhd|逻辑语句|  
|add2.vhd|`with elect when`语句|  
|add3.vhd|`when else`语句|  
|add4.vhd|`if elsif else`语句|  
|add5.vhd|`case when`语句|  
|add6.vhd|`when else`语句|  

### 2. 7-Segment Display  
##### 数码管显示 
7位共阳数码管显示0-9  
<kbd>bi</kbd>灭灯输入，<kbd>lt</kbd>测试输入

### 3. D Flip-flop  
##### D触发器  
在时钟上升沿保持与输入信号同步

### 4. JK Flip-flop 
##### JK触发器  
时钟上升沿触发，<kbd>j</kbd>、<kbd>k</kbd>输入00保持不变，<kbd>j</kbd>、<kbd>k</kbd>输入01输出0，<kbd>j</kbd>、<kbd>k</kbd>输入10输出1，<kbd>j</kbd>、<kbd>k</kbd>输入11输出反转  
<kbd>sd</kbd>置位输入，<kbd>rd</kbd>复位输入

### 5. Decimal Counter 
##### 十进制计数器  
<kbd>clr</kbd>异步清零，<kbd>ld</kbd>同步置数，<kbd>ep</kbd>、<kbd>et</kbd>高电平开始时钟上升沿计数，<kbd>c</kbd>进位输出
|文件名|功能|  
|--|--|  
|divcnt.vhd|例化| 
|frediv1.vhd|分频|  
|tencounter1.vhd|计数|  

### 6. Hexadecimal Counter  
##### 十六进制计数器  
<kbd>clr</kbd>异步清零，<kbd>ld</kbd>同步置数，时钟上升沿计数
|文件名|功能|  
|--|--|  
|divcnt.vhd|例化| 
|frediv1.vhd|分频|  
|STcounter1.vhd|计数+数码管译码显示|  

### 7. Traffic Light
##### 交通灯
<kbd>rst</kbd>复位，<kbd>El</kbd>、<kbd>Wl</kbd>、<kbd>Sl</kbd>、<kbd>Nl</kbd>为东西南北四方向LED，依次为绿灯、黄灯、红灯，高电平亮，<kbd>second</kbd>、<kbd>tensecond</kbd>为读秒数码管个位与十位  
东西工作状态相同，南北工作状态相同，东西绿灯60秒，南北绿灯35秒，所有黄灯3秒，数码管显示绿灯和黄灯剩余时间  
建立状态机，S1南北绿灯，S2南北黄灯，S3东西绿灯，S4东西黄灯  
注意signal与variable的区别，signal在process结束后赋值，variable在process中立即赋值  
|文件名|功能|  
|--|--|  
|divcnt.vhd|例化| 
|frediv1.vhd|分频|  
|trafficlight1.vhd|计时、数码管显示、状态机控制LED|  

### 8. Digital Clock
##### 数字钟
<kbd>cho</kbd>时钟校准，<kbd>cmo</kbd>分钟校准，校准时每秒加1，<kbd>cso</kbd>秒钟归零，<kbd>buzzero</kbd>蜂鸣器输出，<kbd>tensecondo</kbd>、<kbd>secondo</kbd>、<kbd>tenminuteo</kbd>、<kbd>minuteo</kbd>、<kbd>tenhouro</kbd>、<kbd>houro</kbd>为秒钟十位、秒钟个位、分钟十位、分钟个位、时钟十位、时钟个位数码管显示  
分频为1Hz（考虑演示进行了调整）、500Hz、1kHz，1Hz进入计时，秒钟校准优先级最高，往后依次是时钟校准和分钟校准，判断秒钟和分钟是否为指定数字控制蜂鸣器输出  
|文件名|功能|  
|--|--|  
|buzzer1.vhd|蜂鸣器控制，判断秒钟分钟是否为指定数字| 
|digdecoder1.vhd|数码管显示，六个数码管一起完成|  
|digdecoder2.vhd|数码管显示，单个数码管| 
|digitalclock1.vhd|例化，digdecoder1、main1、无蜂鸣器| 
|digitalclock2.vhd|例化，digdecoder2、main2、无蜂鸣器| 
|digitalclock3.vhd|例化，digdecoder2、main2、有蜂鸣器| 
|frediv1.vhd|仅有2Hz分频| 
|frediv2.vhd|2Hz、500Hz、1kHz分频| 
|main1.vhd|每位分别计数| 
|main2.vhd|时分秒分别计数、二进制转BCD| 

### 9. Responder  
##### 抢答器  
<kbd>judgi</kbd>裁判，<kbd>cmpi</kbd>四位选手，<kbd>buzo</kbd>蜂鸣器，<kbd>so</kbd>秒个位，<kbd>tso</kbd>秒十位，<kbd>digo</kbd>选手号码  


### 10. Electronic Organ
##### 电子琴
|文件名|功能|  
|--|--|  
|buzzer1.vhd|蜂鸣器控制| 
|electronicorgan1.vhd|例化|  
|frediv2.vhd|分频| 