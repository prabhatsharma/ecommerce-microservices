package main

import (
	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.Default()

	r.GET("/", getRecommendations)

	r.Run(":8083")
}

// Product is a stanard product for sale
type Product struct {
	ID          uint   `json:"id"`
	Description string `json:"description"`
}

func getRecommendations(c *gin.Context) {
	product1 := Product{
		ID:          2,
		Description: "some sample item. Version 6",
	}

	product2 := Product{
		ID:          3,
		Description: "another sample item. Version 6",
	}

	products := []Product{}

	products = append(products, product1, product2)

	c.JSON(200, products)
}
