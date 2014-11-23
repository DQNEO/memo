/*
         * 文字列の変換を関数にして見る
         * 関数は、１つ引数をもらって、その値を出力する。
         * as -a=05_hello.lst  -o 05_hello.o 05_hello.s
         * ld -Ttext 0x0 -e main -o 05_hello 05_hello.o
         */
        .code32
        .text

        .global main
main:

          push $0x43            # 0x43つまり文字列Cをスタックに入れる。これが引数になる。
          call conv_func        # conv_funcラベルに飛ぶ。



          mov  $1, %eax
          int  $0x80

        /*
         * 文字列の変換関数。
         */
conv_func:

          movl %esp, %ebp
          movl 4(%ebp), %edx
          movl %edx, msg

          movl $4,  %eax        # AXレジスタにsys_writeシステムコールを指定。
          movl $1,  %ebx        # BXレジスタに出力先を標準出力として指定。
          movl $msg,%ecx        # CXレジスタにmsgラベルを設定
          movl $len,%edx        # DXレジスタにlenを指定

          int  $0x80            # システムコールの実行
          ret

        .data
          # データはこちらに書いていく。
msg:     .asciz "Z\n"   # 初期値はZと改行コードにしている。
msgend:  len = msgend - msg
        
