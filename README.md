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

### 6. 