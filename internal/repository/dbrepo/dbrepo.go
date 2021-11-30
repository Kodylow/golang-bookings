package dbrepo

import (
	"database/sql"

	"github.com/kodylow/golang-bookings/internal/config"
	"github.com/kodylow/golang-bookings/internal/repository"
)

type postgresDBRepo struct {
	App *config.AppConfig
	DB  *sql.DB
}

type testDBRepo struct {
	App *config.AppConfig
	DB *sql.DB
}

//NewPostgresRepo returns a new postgres db repo
func NewPostgresRepo(conn *sql.DB, a *config.AppConfig) repository.DatabaseRepo {
	return &postgresDBRepo{
		App: a,
		DB:  conn,
	}
}

//NewTestingsRepo returns a db repo for testing
func NewTestingsRepo(a *config.AppConfig) repository.DatabaseRepo {
	return &testDBRepo{
		App: a,
	}
}
