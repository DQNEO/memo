/**
 * exitシステムコールを呼ぶだけのコード
 *
 */
.file   "exit.s"
        .text

        .global main
main:
        # call sys_exit
        movl $3,    %ebx  # ステータスコードを3にセット
        movl $0x01, %eax  # sys_exit
        int  $0x80        # system call
