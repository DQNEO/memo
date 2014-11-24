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
        movl $lenfiz,   %edx
        movl $4,        %eax    # write system call(sys_write)
        int  $0x80

        # baz
        movl $1,        %ebx
        movl $baz,      %ecx
        movl $lenbaz,   %edx
        movl $4,        %eax    # write system call(sys_write)
        int  $0x80

        pushl  %ebp
        movl %esp, %ebp
        movb $0x00, -1(%ebp) # \0
        movb $0x0A, -2(%ebp) # \n
        movb $0x6f, -3(%ebp) # o
        movb $0x6c, -4(%ebp) # l
        movb $0x6c, -5(%ebp) # l
        movb $0x65, -6(%ebp) # e
        movb $0x68, -7(%ebp) # h

        movl $4,        %eax   # sys_write
        movl $1,        %ebx   # stdout
        leal -7(%ebp),  %ecx   # address of 'h'
        movl $7,        %edx   # len 7
        int  $0x80

        popl  %ebx  # おまじない
        ret
