.file   "fiz.s"
        .data
#文字列を定義
fiz:   .ascii  "fiz\n"
#文字列長を計算
fizend:  .equ  lenfiz, fizend - fiz

baz:   .ascii  "baz\n"
bazend:  .equ  lenbaz, bazend - baz
        //ここからスタート
        .global main
main:
        # fiz
        movl $1,        %ebx
        movl $fiz,      %ecx
        movl $lenfiz,      %edx
        movl $4,        %eax    # write system call(sys_write)
        int  $0x80

        # baz
        movl $1,        %ebx
        movl $baz,      %ecx
        movl $lenbaz,   %edx
        movl $4,        %eax    # write system call(sys_write)
        int  $0x80
ret
