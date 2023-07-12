# Snippets

## Marp

```bash
marp --allow-local-files --title PostgREST --author "Daniel Knibbe" --pdf --pdf-notes true Präsentation.md
```

## Insert User and Tasks

### Insert User

```bash
curl --location 'http://0.0.0.0:3000/users' \
--header 'Prefer: return=none' \
--header 'Content-Type: application/json' \
--data '{
  "id": "8258e632-9aa1-472d-bb20-7118564685d5",
  "name": "Daniel Knibbe"
}'
```

### Get Users

```bash
curl --location 'http://0.0.0.0:3000/users' \
--header 'Accept: application/json'
```

### Insert Tasks

```bash
curl --location 'http://0.0.0.0:3000/todos' \
--header 'Prefer: return=none' \
--header 'Content-Type: application/json' \
--data '[
    {
        "user_id": "8258e632-9aa1-472d-bb20-7118564685d5",
        "task": "Go Cycling",
        "done": false
    },
    {
        "user_id": "8258e632-9aa1-472d-bb20-7118564685d5",
        "task": "Plan your vacation",
        "done": false
    },
    {
        "user_id": "8258e632-9aa1-472d-bb20-7118564685d5",
        "task": "Create Slides",
        "done": true
    }
]'
```

### Get Tasks

```bash
curl --location 'http://0.0.0.0:3000/todos' \
--header 'Accept: application/json'
```

### Get done tasks

```bash
curl --location 'http://0.0.0.0:3000/todos?done=eq.true' \
--header 'Accept: application/json'
```
