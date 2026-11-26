CREATE TABLE IF NOT EXISTS watchdog_state (key TEXT PRIMARY KEY, value TEXT NOT NULL, updated_at INTEGER NOT NULL);
CREATE TABLE IF NOT EXISTS watchdog_events (id INTEGER PRIMARY KEY AUTOINCREMENT, timestamp INTEGER NOT NULL, event TEXT NOT NULL, details TEXT);
CREATE TABLE IF NOT EXISTS watchdog_observations (minute INTEGER PRIMARY KEY, status TEXT NOT NULL CHECK(status IN ('online','offline','unknown','suspended')));
CREATE TABLE IF NOT EXISTS watchdog_hourly (hour INTEGER PRIMARY KEY, online_minutes INTEGER NOT NULL DEFAULT 0, offline_minutes INTEGER NOT NULL DEFAULT 0, unknown_minutes INTEGER NOT NULL DEFAULT 0, suspended_minutes INTEGER NOT NULL DEFAULT 0);
CREATE TABLE IF NOT EXISTS watchdog_daily (day INTEGER PRIMARY KEY, online_minutes INTEGER NOT NULL DEFAULT 0, offline_minutes INTEGER NOT NULL DEFAULT 0, unknown_minutes INTEGER NOT NULL DEFAULT 0, suspended_minutes INTEGER NOT NULL DEFAULT 0);
CREATE TABLE IF NOT EXISTS watchdog_incidents (id INTEGER PRIMARY KEY AUTOINCREMENT, started_at INTEGER NOT NULL, ended_at INTEGER, recovery_attempts INTEGER NOT NULL DEFAULT 0, recovery_failures INTEGER NOT NULL DEFAULT 0, automatically_recovered INTEGER NOT NULL DEFAULT 0);
CREATE INDEX IF NOT EXISTS watchdog_incidents_started ON watchdog_incidents(started_at);
CREATE TABLE IF NOT EXISTS watchdog_discord (key TEXT PRIMARY KEY, value TEXT NOT NULL, updated_at INTEGER NOT NULL);
