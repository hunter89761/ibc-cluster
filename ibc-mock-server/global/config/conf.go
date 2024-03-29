package config

import (
	"github.com/pelletier/go-toml"
)

type Database struct {
	Host     string `toml:"host"`
	Port     int    `toml:"port"`
	User     string `toml:"user"`
	Password string `toml:"password"`
	DBName   string `toml:"dbname"`
	SSLMode  string `toml:"sslmode"`
}

type Logger struct {
	SavePath     string `toml:"save_path"`    // Path to save the log file
	EncoderType  string `toml:"encoder_type"` // Type of encoder
	EncodeLevel  string `toml:"encode_level"` // Level of encoding
	EncodeCaller string `toml:"encode_caller"`
}

type Config struct {
	Database Database `toml:"Database"`
	Logger   Logger   `toml:"Logger"`
}

var cfg *Config

func GetCfg() *Config {
	return cfg
}

func InitConfig(configPath string) {
	// path depend on the working path
	err := ParseCfg(configPath)
	if err != nil {
		panic(err)
	}
}

func ParseCfg(path string) error {
	config, err := toml.LoadFile(path)
	if err != nil {
		return err
	}

	cfg = &Config{}
	err = config.Unmarshal(cfg)
	if err != nil {
		return err
	}

	return nil
}
