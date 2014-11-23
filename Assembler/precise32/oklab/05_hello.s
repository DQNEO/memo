
        /*
         * 文字の変更
         * as -o hello.o hello.s
         * ld -o hello -e main hello.o
         */
        .code32
        .text

        .global main
main:

          movl $4, %eax         # AXレジスタにsys_writeシステムコールを指定。
          movl $1, %ebx         # BXレジスタに出力先を標準出力として指定。
          movl $msg,%ecx        # CXレジスタにmsgラベルを設定
          movl $0x41, msg     # msgのデータを16進の0x41つまり文字列Aに書き換える
          movl $len,%edx        # DXレジスタにlenを指定


          # システムコールの実行
          int  $0x80

        #  ret
          mov  $1, %eax
          int  $0x80

        .data
          # データはこちらに書いていく。
msg:     .asciz "Z\n"
msgend:  len = msgend - msg
