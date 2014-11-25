/**
 * call命令を使うサンプルコード
 *
 */
.file   "call.s"
        .text

        .global main
main:
        call func_exit

        # exit
        movl $4,    %ebx  # status value
        movl $0x01, %eax  # sys_exit
        int  $0x80        # system call

func_exit:
        movl %edx, %edx  #実際には何もしないのと同じ
