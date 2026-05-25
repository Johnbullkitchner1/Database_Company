This is not a real company nor is it real individuals

Docker Postgres setup
---------------------

I added a Docker Compose setup to run a Postgres database and an init SQL that seeds the same data from `manBull.sql`.

- Files added:
	- `docker-compose.yml`
	- `postgres/init_postgres.sql` (Postgres-compatible schema + data)
	- `scripts/check_db.sh` (helper to run verification queries)

Run instructions:

1. Start Postgres in the background:

```bash
cd /Users/voidWitcher_/Desktop/Database_Company
docker compose up -d
```

2. Wait a few seconds for initialization, then run the check script:

```bash
./scripts/check_db.sh
```

3. To stop and remove containers:

```bash
docker compose down
```

If you prefer MySQL instead, tell me and I can add a MySQL compose configuration and converted SQL.
