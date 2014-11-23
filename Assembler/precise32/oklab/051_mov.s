
        /*
         * mov命令のサンプル
         as -o 051_mov.o 051_mov.s
         ld -Ttext 0x0 -e main -o 051_mov 051_mov.o
         */
        .code32
        .text
        .global main
main:
        /*
        EAX (Extend Accumurator eXtend) は32bit

        32                  16         8       1bit
         0000 0000 0000 0000 0000 0000 0000 0000    %eaxは、32bitの操作をするときに使う
                             0000 0000 0000 0000    %ax は、16bitの操作をするときに使う
                             0000 0000              %ah は、上位8bitの操作に使う
                                       0000 0000    %al は、下位8bitの操作に使う

        */

        /*
        %alレジスタ、つまりEAXレジスタの下位8bitに数値1を入れる
         8bitは1byteであるので、mov命令は、movbと書く。
        */
          movb $0b00000001, %al # 2進数の場合は$0bではじめる。al(Accumurator Low)
          movb $00000001  , %al # 10進数の場合は$ではじめる。
          movb $0x01      , %al # 16進数の場合は$0xではじめる。

        # %ahレジスタ、つまりEAXレジスタの上位8bitに数値3を入れる
          movb $0b00000011, %ah
          movb $00000003  , %ah
          movb $0x03      , %ah



        /* axレジスタの操作。
         32bitのうち、下位16bitを操作する時は、レジスタにaxと指定して使う。
         この場合、16bitは2bytesなので、mov命令は、movwと書く。
         wはwordの略で、wordとは2bytesを表す。
         */
          movw $0b0001000100010001, %ax

        /* eaxレジスタの操作。
          32bitを操作する時は、レジスタにeaxと指定して使う。
          この場合、32bitは4bytesなので、mov命令は、movlと書く。
          lはlongの略で、longとは4bytesを表す。
        */
          # bit  32              16       8      1
          movl $0b11110000111100001111111111111111, %eax

          # 通常は、2進数ではなく16進数で記述する。
          movl $0xf0f0ffff, %eax

          # exitシステムコールを呼ぶ
          movl $0x10, %ebx  # exitに渡す引数
          movl $0x01, %eax  # exit
          int  $0x80

        .data
msg:     .asciz "calc"
med:     len = med - msg
