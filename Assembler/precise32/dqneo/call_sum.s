/**
 * call命令を使うサンプルコード
 *
 */
.file   "call.s"
        .text

        .global main
main:
        pushl %ebp
        movl  %esp, %ebp
        movl  $2,   -8(%ebp)
        movl  $3,   -4(%ebp)
        
        call sum
        movl %eax, %ebx
        
        # exit
        #movl $4,    %ebx  # status value
        movl $0x01, %eax  # sys_exit
        int  $0x80        # system call

sum:
        pushl %ebp
        movl  %esp, %ebp
        movl  12(%ebp), %eax
        movl  8(%ebp),  %edx
        addl  %edx, %eax
        movl  %edx, %eax
        popl  %ebp

        ret
