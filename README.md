Docker setup

build container

`docker-compose build
`

run migrations

`docker-compose run web rails db:migrate
`

run application

`docker-compose up
`

run grafana

`docker run -d -p 3001:3000 grafana/grafana
`

