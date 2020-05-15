	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 19, 3
	.globl	_partition
	.align	4, 0x90
_partition:                             ## @partition
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbx
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbx, -16
	movl	%edx, %r11d
	movl	%esi, %r9d
	movslq	%ecx, %rcx
	movsbl	(%rdi,%rcx), %r10d
	movslq	%r11d, %rbx
	movb	(%rdi,%rbx), %al
	movb	%al, (%rdi,%rcx)
	movb	%r10b, (%rdi,%rbx)
	movl	%r9d, %edx
	jmp	LBB0_1
	.align	4, 0x90
LBB0_4:                                 ## %if.end
                                        ##   in Loop: Header=BB0_1 Depth=1
	incl	%edx
LBB0_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	%r11d, %edx
	jge	LBB0_5
## BB#2:                                ## %if.cond
                                        ##   in Loop: Header=BB0_1 Depth=1
	movslq	%edx, %rcx
	movsbl	(%rdi,%rcx), %eax
	cmpl	%r10d, %eax
	jge	LBB0_4
## BB#3:                                ## %if.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	movb	(%rdi,%rcx), %r8b
	movslq	%r9d, %rsi
	movb	(%rdi,%rsi), %al
	movb	%al, (%rdi,%rcx)
	movb	%r8b, (%rdi,%rsi)
	incl	%r9d
	jmp	LBB0_4
LBB0_5:                                 ## %while.end
	movslq	%r9d, %rcx
	movb	(%rdi,%rcx), %dl
	movb	(%rdi,%rbx), %al
	movb	%al, (%rdi,%rcx)
	movb	%dl, (%rdi,%rbx)
	movl	%ecx, %eax
	popq	%rbx
	retq
	.cfi_endproc

	.globl	_quicksort
	.align	4, 0x90
_quicksort:                             ## @quicksort
	.cfi_startproc
## BB#0:                                ## %if.cond
	pushq	%rbp
Ltmp2:
	.cfi_def_cfa_offset 16
	pushq	%r15
Ltmp3:
	.cfi_def_cfa_offset 24
	pushq	%r14
Ltmp4:
	.cfi_def_cfa_offset 32
	pushq	%rbx
Ltmp5:
	.cfi_def_cfa_offset 40
	pushq	%rax
Ltmp6:
	.cfi_def_cfa_offset 48
Ltmp7:
	.cfi_offset %rbx, -40
Ltmp8:
	.cfi_offset %r14, -32
Ltmp9:
	.cfi_offset %r15, -24
Ltmp10:
	.cfi_offset %rbp, -16
	movl	%edx, %ebp
	movl	%esi, %ebx
	movq	%rdi, %r15
	cmpl	%ebp, %ebx
	jge	LBB1_2
## BB#1:                                ## %if.body
	movl	%ebp, %eax
	subl	%ebx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	sarl	%ecx
	addl	%ebx, %ecx
	movq	%r15, %rdi
	movl	%ebx, %esi
	movl	%ebp, %edx
	callq	_partition
	movl	%eax, %r14d
	leal	-1(%r14), %edx
	movq	%r15, %rdi
	movl	%ebx, %esi
	callq	_quicksort
	leal	1(%r14), %esi
	movq	%r15, %rdi
	movl	%ebp, %edx
	callq	_quicksort
LBB1_2:                                 ## %if.end
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbx
Ltmp11:
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
Ltmp12:
	.cfi_def_cfa_offset 64
Ltmp13:
	.cfi_offset %rbx, -16
	movaps	L_.str1+16(%rip), %xmm0
	movaps	%xmm0, 16(%rsp)
	movaps	L_.str1(%rip), %xmm0
	movaps	%xmm0, (%rsp)
	movl	$6778724, 32(%rsp)      ## imm = 0x676F64
	leaq	(%rsp), %rbx
	xorl	%esi, %esi
	movl	$34, %edx
	movq	%rbx, %rdi
	callq	_quicksort
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	_printf
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbx
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%s\n"

	.align	4                       ## @.str1
L_.str1:
	.asciz	"thequickbrownfoxjumpsoverthelazydog"


.subsections_via_symbols
