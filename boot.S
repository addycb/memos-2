/*
 * boot.S for memos-2
 *
 */
	.globl stack
	
	.bss
	.align 0x1000
	.comm stack, 0x1000 /* setup 4KB stack area in bss */

	.data
	
	.text
	
	.globl _start

gdt:
	.word 0,0,0,0
	.word 0x7fff     	
	.word  0x0000                 
	.word  0x9A00
	.word  0x00C0
	.word  0x7fff
	.word  0x0000
	.word  0x9200
	.word  0x00C0

_start:
	jmp real_start

	/* Multiboot header -- Safe to place this header in 1st page for GRUB */
	.align 4
	.long 0x1BADB002 /* Multiboot magic number */
	.long 0x00000003 /* Align modules to 4KB, req. mem size */
			 /* See 'info multiboot' for further info */
	.long 0xE4524FFB /* Checksum */

real_start:
	lgdt gdt_ptr
	ljmp $0x08, $1f
	
loop:
	jmp loop
