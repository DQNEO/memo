.file   "fizbuz.s"
        .data
msg:    .ascii  "hello world\n"
msgend:  .equ    len, msgend - msg
fiz:   .ascii  "fizz\n"
fizend:  .equ  lenfiz, fizend - fiz
buz:   .ascii  "buz\n"
buzend:  .equ  lenbuz, buzend - buz
fizbuz:   .ascii  "fizbuzz\n"
fizbuzend:  .equ  lenfizbuz, fizbuzend - fizbuz

        .global main
main:
        movl $1,        %ebx
        movl $0x40,     %ecx
        movl $1,   %edx
        movl $4,        %eax # sys_write
        int  $0x80
        movl $1,        %ebx
        movl $fiz,      %ecx
        movl $lenfiz,   %edx
        movl $4,        %eax # sys_write
        int  $0x80
        # print buz
        movl $1,        %ebx
        movl $buz,      %ecx
        movl $lenbuz,   %edx
        movl $4,        %eax
        int  $0x80
        # print fizbuz
        movl $1,        %ebx
        movl $fizbuz,   %ecx
        movl $lenfizbuz,   %edx
        movl $4,        %eax
        int  $0x80
        ret
