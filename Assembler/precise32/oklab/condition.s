.file "condition.s"
        .data
stri:      .ascii  "yes\n\0"
length:  .equ    len,    length - stri
        .global main
main:
                movb    $5,     %al
                cmpb    $5,     %al # alレジスタと数値5を比較する。比較結果はeflagsに格納される。
                je      f_print         # もしequalだったらjump

        ret

f_print:
        movl $4, %eax
        movl $1, %ebx
        movl $stri, %ecx
        movl $len, %edx
        int $0x80
        ret
