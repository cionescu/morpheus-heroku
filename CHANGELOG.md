# Change Log

## 0.6.0
- Rails 7 replaced `ActiveRecord::Base.connection_config` with `ActiveRecord::Base.connection_db_config` so we handle both

## 0.5.1

- Bring back `Bundler.with_clean_env` if `Bundler.with_unbundled_env` is not defined

## 0.5.0

- Replace `Bundler.with_clean_env` with `Bundler.with_unbundled_env` (fix deprecation warning)

## 0.4.1

_Fixes_

- Use the app name when generating the download url for the backup

## 0.4.0

- Email Scrambler

_Fixes_

- Fix `Failed to create the file tmp/latest.dump` [@rcsm, #1]
- Perform a git fetch before trying to update the remote

## 0.1.0

- Fetch and Load Postgres Backup DB from Heroku.
- Deploy to Heroku production.
- Config through the initializer.
