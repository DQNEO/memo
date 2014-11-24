	.file	"printf.c"
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC1:
	.string	"foo\n"
	.text
	.globl	main
	.type	main, @function

main:
.LFB0:
	.cfi_startproc

        # print 1
        pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
        movl $0x01, %ebx  # ebsに値をセット
	movl	$.LC0, (%esp)
	movl	%ebx, 4(%esp) # printfに渡す引数
	call	printf
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4

        # print foo
        pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
        movl $0x02, %ebx  # ebsに値をセット
	movl	$.LC1, (%esp)
	movl	%ebx, 4(%esp) # printfに渡す引数
	call	printf
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4

	ret
	.cfi_endproc
