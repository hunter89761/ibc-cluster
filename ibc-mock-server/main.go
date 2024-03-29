package main

import (
	"fmt"
	"github.com/ibc-mock-server/global"
	"github.com/ibc-mock-server/global/config"
	"github.com/ibc-mock-server/server"
	"os"
	"os/signal"
	"syscall"
)

var (
	httpAddr = ":8432"

	configPath = "./server.toml"
)

func main() {
	fmt.Println("this is a ibc-mock-server")

	config.InitConfig(configPath)
	global.LoggerSetup()
	go server.StartIBCRegisterServer(httpAddr)

	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	global.Logger.Info("stop signal received.")
}
