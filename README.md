
# Absence Manager API




## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`DATABASE_NAME=absence_manager_api`

`DATABASE_USER=absence_manager_api`

`DATABASE_PASSWORD=secret`

`DATABASE_HOST=localhost`

`DATABASE_PORT=5432`
## Run Locally

Clone the project

```bash
  git clone https://github.com/ielijose/absence-manager-api.git
```

Go to the project directory

```bash
  cd absence-manager-api
```
### With Ruby (2.7.2)

Install dependencies

```bash
  bundle install
```

Create database

```bash
  rails db:create
```

Run migrations

```bash
  rails db:migrate
```

Run seeds

```bash
  rails db:seed
```

Start the server

```bash
  rails server
```

### With docker-compose

Compose

```bash
  docker-compose up -d
```

  
## Running Tests

To run tests, run the following commands


### With Ruby (2.7.2)

```bash
rails db:prepare:test
rails test
```

### With docker-compose



```bash
docker-compose run -e "RAILS_ENV=test" api rails db:test:prepare
docker-compose run -e "RAILS_ENV=test" api rails test
```
## API Reference

#### Get absences

```http
  GET /api/v1/absences
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `type` | `string` | Type of absence |
| `from` | `date` | Absence start date from |
| `to` | `date` | Absence end date to |
| `page` | `number` | Page number |

 
## Authors

- [@ielijose](https://www.github.com/ielijose)

  
