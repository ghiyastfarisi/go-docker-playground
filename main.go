package main

import (
	"log"

	"github.com/gin-gonic/gin"
)

func main() {
	log.Println("welcome to go docker playground")
	r := gin.New()
	// for healtcheck purpose
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"hello":   "world",
			"name":    "moeghifar",
			"version": "1.0.2",
			"message": "yeay! should working restart",
		})
	})
	r.Run()
}
