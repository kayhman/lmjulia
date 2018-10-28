package main
// go build exp.o
// ./exp
import (
	"fmt"
	"time"
)

var fact = []float64{1.0, 1.0, 2.0, 6.0, 24.0, 120.0, 720.0, 5040.0, 40320.0, 362880.0, 3628800.0, 39916800.0, 479001600.0, 6227020800.0, 87178291200.0, 1307674368000.0, 20922789888000.0, 355687428096000.0, 6402373705728000.0, 121645100408832000.0}

func myExp(n int) float64 {
	e := 0.0
	for i := 0 ; i < n ; i++ {
		e += 1.0 / fact[i]
	}
	return e
}

func main() {
	start := time.Now()
	e := 0.0
	for i := 0 ; i < 1000000 ; i++ {
		e += myExp(20)
	}
	fmt.Printf("Time :%s\n", time.Since(start).String())
	fmt.Printf("e: %.20f\n", e/1000000.0)
}
