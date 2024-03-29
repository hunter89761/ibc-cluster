package server

import (
	"github.com/gin-gonic/gin"
	"github.com/ibc-mock-server/global"
	"github.com/ibc-mock-server/server/mid"
	"github.com/ibc-mock-server/server/router"
	"net/http"
)

type DAServer struct {
	s *http.Server
}

func StartIBCRegisterServer(addr string) {
	r := gin.Default()
	r.Use(mid.Cors())
	r.Use(mid.ZapLogger(global.Logger), mid.ZapRecovery(global.Logger, true))
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})

	r.GET("/evmos", router.GetSlot())
	//
	//r.POST("/datahub/v1/getBlobsByTxHash/:txhash", GetBlobsByTxHash())
	//r.POST("/datahub/v1/getRecentBTxHashByFrom/:address", GetRecentBTxHashByFrom())
	//r.POST("/datahub/v1/getRecentBTxHashByTo/:address", GetRecentBTxHashByTo())
	//r.POST("/datahub/v1/getRecentBTxHashByNamespace/:version/:namespaceid", GetRecentBTxHashByNamespace())

	r.Run(addr) // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
