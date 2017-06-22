.section .data
value1:
	.byte 0x34, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
value2:
	.int 2

.section .text
.global _start
_start:
	fbld value1
	fimul value2
	fbstp value1

	movl $1, %eax
	movl $0, %ebx
	int $0x80
