package main

import "github.com/gin-gonic/gin"

func main() {

	r := gin.Default()

	r.GET("/", getPerson)

	r.Run(":8080")
}

func getPerson(c *gin.Context) {

	c.JSON(200, gin.H{
		"uid":   1,
		"uname": "Prabhat Sharma v2",
	})
}
