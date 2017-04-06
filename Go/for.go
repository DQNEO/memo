package main
import "fmt"

func main() {
    sum := 0
    for i:= 1 ; i <+ 10 ;i++ {
        sum += i
    }
    fmt.Printf("sum = %v\n", sum)
}
