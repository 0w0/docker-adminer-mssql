Official adminer image + mssql extention

Run it:
```
docker run -d --restart=always \
  --name=adminer \
  -p 8080:8080 \
  -e ADMINER_PLUGINS='tables-filter' \
  -e ADMINER_DESIGN='nette' \
  0w0b/adminer-mssql:4.7.0
```
