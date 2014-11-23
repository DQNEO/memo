        /*
         * GASでのHelloWorldプログラム
         */
        .code32
        .text
        .globl main
main:

          /*
           * mov命令によりデータをレジスタに設定する。
           * movl 入力先 出力先
           */
          movl $4, %eax         # AXレジスタに数値4を設定
          movl $1, %ebx         # BXレジスタに数値1を設定
          movl $msg,%ecx        # CXレジスタにmsgラベルを設定
          movl $5, %edx         # DXレジスタに数値5を指定

          # システムコールの実行
          int  $0x80

          ret

        .data

          # データはこちらに書いていく。
msg:     .ascii "hello"
