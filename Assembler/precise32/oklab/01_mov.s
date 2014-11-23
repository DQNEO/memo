# usage:
# gcc 01_mov.s ; ./a.out ; echo $?
        .code32
        .text
        .global main
main:
        # ecxに値をセットして演算する
        movl $0x02, %ecx  # exitに渡す引数
        addl $0x03, %ecx  # 加算

        # exitシステムコールを呼ぶ
        movl %ecx,  %ebx  # ecxの値をebxにコピー(exitの引数をセット9
        movl $0x01, %eax  # exit
        int  $0x80
