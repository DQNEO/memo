.code32
        .text
        .global main
main:
          pushl $0x10           # pushっていうけどどこにデータを格納している?
          popl  %eax
          # exitシステムコール
          movl $1, %eax
          int $0x80
