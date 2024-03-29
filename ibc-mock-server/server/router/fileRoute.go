package router

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetSlot() gin.HandlerFunc {
	fn := func(c *gin.Context) {
		var err error

		if err != nil {
			c.JSON(http.StatusOK, struct{}{})
		} else {
			c.JSON(http.StatusOK, NewEvmosMock())
		}
	}
	return gin.HandlerFunc(fn)
}

func NewEvmosMock() Provider {
	return Provider{
		Type: "evmos",
		Value: Config{
			Key:            "default",
			ChainID:        "evmos-1",
			RPCAddr:        "http://192.167.10.12:26657",
			AccountPrefix:  "evmos",
			KeyringBackend: "test",
			GasAdjustment:  1.2,
			GasPrices:      "0.01aevmos",
			Debug:          true,
			Timeout:        "20s",
			OutputFormat:   "json",
			SignModeStr:    "direct",
		},
	}
}
