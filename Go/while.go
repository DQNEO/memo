package main

import "fmt"

func main() {
    sum := 1
    for ; sum < 1000; {
        sum += sum
    }
    fmt.Println(sum)

    sum2 := 1
    for sum2 < 100 {
        sum2 += sum2
    }
    fmt.Println(sum2)
}

