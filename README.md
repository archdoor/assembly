# assembly
assembly language

获取系统位数:
	getconf LONG_BIT
获取动态库位数:
	readelf -h libxxxx.so

IA-32平台寄存器：
	mmx(多媒体扩展multimedia extension)寄存器(64位)：
		mm0, mm1, mm2, mm3, mm4, mm5, mm6, mm7
	fpu(浮点运算单元)寄存器(80位):
		st0, st1, st2, st3, st4, st5, st6, st7
	sse(流化SIMD扩展)寄存器(128位)：
		xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7

	8个通用寄存器(32位)：
		4个主要用在算术运算指令中:
			eax: 累加器(accumulator，针对操作数和结果数据的)：返回值寄存器
			ebx: 基址寄存器(base，ds段中的数据指针) 
			ecx: 计数器(count，字符串和循环操作的) 
			edx: 数据寄存器(data，I/O指针)
		4个主要用作保存内存地址的指针:
			edi: 扩展基址指针寄存器(base pointer，ss段中栈内数据指针) 
			esi: 源变址寄存器(source index，字符串操作源指针) 
			ebp: 目的变址寄存器(destination index，字符串操作目标指针) 
			esp: 栈指针寄存器(stack pointer，ss段中栈指针)

	6个段寄存器(32位)：
		cs: 代码段寄存器(code segment)
		ds: 数据段寄存器(data segment)
		ss: 栈段寄存器(stack segment)

		es: 附加数据段指针(extra data segment)
		fs: 附加数据段指针(data segment)
		gs: 附加数据段指针(global data segment)

	1个指令指针寄存器：
		eip: 指令指针寄存器(instruction pointer)，存放下次将要执行的指令在代码段的偏移量。

	1个程序状态与控制寄存器：
		eflags: 标志寄存器(flag register)

|31|30|29|28|27|26|25|24|23|22|21|20 |19 |18|17|16|15|14|13|12|11|10|09|08|07|06|05|04|03|02|01|00|
|0 |0 |0 |0 |0 |0 |0 |0 |0 |0 |id|vip|vif|ac|vm|rf|0 |nf|iopl |of|df|if|tf|sf|zf|0 |af|0 |pf|0 |cf|

S(status flag) C(control flag) X(system flag)
X id(id flag)：
X vip(virtual interrupt pending)：
X vif(virtual interrupt flag)：
X ac(alignment check)

32位标志寄存器增加的标志位：
X vm：虚拟8086方式标志(virtual-8086 mode)
	如果该标志的值为1，则表示处理机处于虚拟的8086方式下的工作状态，否则，处理机处于一般保护方式下的工作状态。
X rf：重启动标志(restart flag)
	重启动标志RF用来控制是否接受调试故障。规定：RF=0时，表示“接受”调试故障，否则拒绝之。在成功执行完一条指令后，处理机把RF置为0，当接受到一个非调试故障时，处理机就把它置为1。
X nt：嵌套任务标志(nested task)
	用来控制中断返回指令IRET的执行。具体规定如下：
	1.当NT=0，用堆栈中保存的值恢复EFLAGS、CS和EIP，执行常规的中断返回操作；
	2.当NT=1，通过任务转换实现中断返回。
X iopl：I/O特权标志(I/O privilege level)
	I/O特权标志用两位二进制位来表示，也称为I/O特权级字段。该字段指定了要求执行I/O指令的特权级。如果当前的特权级别在数值上小于等于IOPL的值，那么，该I/O指令可执行，否则将发生一个保护异常。

状态控制标志：
C df：方向标志(direction flag)
	用来决定在串操作指令执行时有关指针寄存器发生调整的方向。
X if：中断允许标志(interrupt enable flag)
	中断允许标志IF是用来决定CPU是否响应CPU外部的可屏蔽中断发出的中断请求。但不管该标志为何值，CPU都必须响应CPU外部的不可屏蔽中断所发出的中断请求，以及CPU内部产生的中断请求。具体规定如下：
	1.当IF=1时，CPU可以响应CPU外部的可屏蔽中断发出的中断请求；
	2.当IF=0时，CPU不响应CPU外部的可屏蔽中断发出的中断请求。
X tf：追踪标志(trap flag)
	当追踪标志TF被置为1时，CPU进入单步执行方式，即每执行一条指令，产生一个单步中断请求。这种方式主要用于程序的调试。
	

状态标志：
S of：溢位标识(overflow flag)
	用于反映有符号数加减运算所得结果是否溢出。
S sf：符号(负号)标志(sign flag)
	用来反映运算结果的正负号，它与运算结果的最高位相同。
S zf：零值标志(zero flag)
	用来反映运算结果是否为0。
S af：辅助进位标志(auxiliary carry flag)
	1.在字操作时，发生低字节向高字节进位或借位时；
	2.在字节操作时，发生低4位向高4位进位或借位时。
S pf：奇偶标志(parity flag)
	用于反映运算结果中“1”的个数的奇偶性。如果“1”的个数为偶数，则PF的值为1，否则其值为0。
S cf：进位标志(carry flag)
	运算结果的最高位产生了一个进位或借位，那么，其值为1，否则其值为0。
