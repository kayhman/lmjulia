package main

import (
	"fmt"
)

func getName() (string, error) {
	return "pierre", nil
}

func hello() error {
	name, err := getName()
	if err != nil {
		fmt.Printf("Failed to get name: %s", err)
		return err
	}
	fmt.Printf("coucou %s\n", name)
	return nil
}

func sweetDreamHello() {
	name, err := getName()
	returnWithError(err, "Failed to get name: %s", err)
	fmt.Printf("coucou %s\n", name)
	return nil
}

func main() {
	err := hello()
	if err != nil {
		fmt.Printf("Failed to greet you")
		return
	}
	
}

func sweetDreamMain() {
	err := hello()
	returnWithError(err, "Failed to greet you", err)
}
