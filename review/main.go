package main

import (
	"encoding/json"
	"fmt"
	"os"

	"github.com/gin-gonic/gin"
	"gopkg.in/resty.v1"
)

func main() {

	r := gin.Default()

	r.GET("/", getReview)

	r.Run(":8081")
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

func getReview(c *gin.Context) {

	personServiceURL := os.Getenv("PERSON_SERVICE_URL")

	if personServiceURL == "" {
		personServiceURL = "http://localhost:8080/"
	}

	resp, err := resty.R().Get(personServiceURL)

	if err != nil {
		fmt.Println(err.Error())
		os.Exit(1)
	}

	var reviewer Person

	if err := json.Unmarshal(resp.Body(), &reviewer); err != nil {
		panic(err)
	}

	review1 := Review{
		ReviewID:    1,
		Description: "This is fantastic product. Version v1",
		Stars:       5,
		ReviewerID:  1,
		Reviewer:    reviewer,
	}

	review2 := Review{
		ReviewID:    2,
		Description: "This is cool product but can improve. Version v1",
		Stars:       4,
		ReviewerID:  1,
		Reviewer:    reviewer,
	}

	var reviews []Review

	reviews = append(reviews, review1, review2)

	c.JSON(200, reviews)
}
