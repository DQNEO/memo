        /*
         * 文字列の変換を関数にして見る
         * as -a=05_hello.lst  -o 05_hello.o 05_hello.s
         * ld -Ttext 0x0 -e main -o 05_hello 05_hello.o
         */
        .code32
        .text

        .global main
main:

          movl $4, %eax         # AXレジスタにsys_writeシステムコールを指定。
          movl $1, %ebx         # BXレジスタに出力先を標準出力として指定。
          movl $msg,%ecx        # CXレジスタにmsgラベルを設定
          movl $0x42, msg     # msgのデータを16進の0x42つまり文字列Bに書き換える
          movl $len,%edx        # DXレジスタにlenを指定


          # システムコールの実行
          int  $0x80

          mov  $1, %eax
          int  $0x80

        /*
         * 文字列の変換関数。
         */
conv_func:
          movl $0x42, msg     # msgのデータを16進の0x42つまり文字列Bに書き換える
          ret

        .data
          # データはこちらに書いていく。
msg:     .asciz "Z\n"   # 初期値はZと改行コードにしている。
msgend:  len = msgend - msg
