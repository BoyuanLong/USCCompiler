	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 19, 3
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r14
Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%rbx
Ltmp2:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
Ltmp3:
	.cfi_def_cfa_offset 48
Ltmp4:
	.cfi_offset %rbx, -32
Ltmp5:
	.cfi_offset %r14, -24
Ltmp6:
	.cfi_offset %rbp, -16
	movabsq	$9363768820586272, %rax ## imm = 0x21444C524F5720
	movq	%rax, 5(%rsp)
	movabsq	$5717073776924706120, %rax ## imm = 0x4F57204F4C4C4548
	movq	%rax, (%rsp)
	movl	$10, %ebx
	movsbl	1(%rsp), %eax
	addl	$32, %eax
	movsbl	%al, %ebp
	leaq	L_.str(%rip), %r14
	jmp	LBB0_1
	.align	4, 0x90
LBB0_2:                                 ## %while.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_printf
	decl	%ebx
LBB0_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	testl	%ebx, %ebx
	jg	LBB0_2
## BB#3:                                ## %while.end
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%c\n"

L_.str1:                                ## @.str1
	.asciz	"HELLO WORLD!"


.subsections_via_symbols
