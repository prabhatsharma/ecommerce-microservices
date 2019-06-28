package main

import (
	"encoding/json"
	"os"

	"github.com/gin-gonic/gin"
	"gopkg.in/resty.v1"
)

func main() {

	r := gin.Default()

	r.GET("/product", getProduct)

	r.Run(":8082")
}

// Product is a stanard product for sale
type Product struct {
	ID          uint   `json:"id"`
	Description string `json:"description"`
}

// Review is a product review by a customer
type Review struct {
	ReviewID    uint   `json:"review_id"`
	Description string `json:"decsription"`
	Stars       uint   `json:"stars"`
	ReviewerID  uint   `json:"reviewer_id"`
	Reviewer    Person `json:"reviewer"`
}

// Person is a customer
type Person struct {
	UID        uint   `json:"uid"`
	PersonName string `json:"uname"`
}

func getProduct(c *gin.Context) {

	reviewServiceURL := os.Getenv("REVIEW_SERVICE_URL")

	if reviewServiceURL == "" {
		reviewServiceURL = "http://localhost:8081/review"
	}

	resp, err := resty.R().Get(reviewServiceURL)

	if err != nil {
		os.Exit(1)
	}

	var reviews []Review

	if err := json.Unmarshal(resp.Body(), &reviews); err != nil {
		panic(err)
	}

	recommendationURL := os.Getenv("RECOMMENDATION_SERVICE_URL")

	if recommendationURL == "" {
		recommendationURL = "http://localhost:8083/recommendation"
	}

	resp1, err1 := resty.R().Get(recommendationURL)

	var recommendations []Product

	if err1 := json.Unmarshal(resp1.Body(), &recommendations); err1 != nil {
		panic(err1)
	}

	if err1 != nil {
		os.Exit(1)
	}

	c.JSON(200, gin.H{
		"product_id":      1,
		"description":     "This product can make you fly. It gives you wings. It can even make you a coffee. It's the best invention since sliced bread.",
		"review":          reviews,
		"recommendations": recommendations,
	})
}
