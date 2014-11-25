/**
 * 文字列定数を使わないhello world
 * Linux i386
 * 実行方法:
 * gcc -o hello hello.s
 * ./hello
 *
 */
.file   "hello.s"
        .data
        //ここからスタート
        .global main
main:
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

        popl  %ebp  # おまじない
        ret
