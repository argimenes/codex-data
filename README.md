# codex-data
The new (and converted) Codex standoff documents can be found in the ```/data``` directory.

The new Codex editing environment is available at SPEEDY-TS repo: https://github.com/argimenes/speedy-ts

In the near future I will export the entities, traits, properties, and meta-relations from the old Codex Neo4j database, and these files will be kept in a directory I will call ```graphs```.

## phext experiment

You can browse codex via the phext monolith!

```cd phext
sq 1337
```

### Fetch

http://127.0.0.1:1337/api/v2/select?c=1.1.1/1.1.1/1.1.1&p=codex

### Update

http://127.0.0.1:1337/api/v2/update?c=1.1.1/1.1.1/1.1.1&p=codex&s=content

### Delete

http://127.0.0.1:1337/api/v2/delete?c=1.1.1/1.1.1/1.1.1&p=codex