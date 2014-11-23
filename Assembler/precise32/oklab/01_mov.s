# gcc 01_mov.s -o a ; ./a ; echo $?
        .code32
        .text
        .global main
main:
        # exitシステムコールを呼ぶ
        movl $0x02, %ebx  # exitに渡す引数
        addl $0x03, %ebx  # 加算
        movl $0x01, %eax  # exit
        int  $0x80
