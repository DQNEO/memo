// http://d.hatena.ne.jp/naoya/20070924/1190653790
#include <stdio.h>

int add(int x, int y)
{
    asm(
        "movl 8(%ebp), %eax;"
        "addl 12(%ebp), %eax"
        );
}

int main ()
{
    printf("%d\n", add(3, 5));
    return 0;
}
