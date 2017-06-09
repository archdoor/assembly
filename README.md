# assembly
assembly language

获取系统位数:
	getconf LONG_BIT
获取动态库位数:
	readelf -h libxxxx.so

IA-32平台寄存器：
	8个通用寄存器：
		4个主要用在算术运算指令中:
			eax: 累加器(accumulator，针对操作数和结果数据的)
			ebx: 基址寄存器(base，ds段中的数据指针) 
			ecx: 计数器(count，字符串和循环操作的) 
			edx: 数据寄存器(data，I/O指针)
		4个主要用作保存内存地址的指针:
			edi: 扩展基址指针寄存器(base pointer，ss段中栈内数据指针) 
			esi: 源变址寄存器(source index，字符串操作源指针) 
			ebp: 目的变址寄存器(destination index，字符串操作目标指针) 
			esp: 栈指针寄存器(stack pointer，ss段中栈指针)

	6个段寄存器：
		cs: 代码段寄存器(code segment)
		ss: 栈段寄存器(stack segment)
		ds: 数据段寄存器(data segment)

		es: 附加数据段寄存器(extra data segment)
		fs: 指向当前活动线程的TEB结构(data segment)
		gs: 全局段寄存器(global segment)

	1个程序状态与控制寄存器：
		eflags: 标志寄存器(flag register)
	1个指令指针寄存器：
		eip: 指令指针寄存器(instruction pointer)
