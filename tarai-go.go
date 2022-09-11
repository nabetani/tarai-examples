package main

import (
	"fmt"
	"os"
	"strconv"
)

func tarai(x int32, y int32, z int32) int32 {
	if x > y {
		return tarai(tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y))
	} else {
		return y
	}
}

func atoiArg(lim int, ix int32, fallback int32) int32 {
	if len(os.Args) < lim {
		return fallback
	}
	n, err := strconv.Atoi(os.Args[ix])
	if err != nil {
		panic(err)
	}
	return int32(n)
}

func main() {
	x := atoiArg(4, 1, 14)
	y := atoiArg(4, 2, 7)
	z := atoiArg(4, 3, 0)

	fmt.Printf("tarai(%d, %d, %d) = %d\n", x, y, z, tarai(x, y, z))
}
