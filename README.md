# README

## Getting Started
1. Clone Repo
```
git clone https://github.com/k-yomo/jwt_auth_api.git
```

2. boot up docker
```
docker-compose up -d
```

3. prepare db
```
docker-compose exec app rails db:setup
```

## Endpoints
- Create User
```
POST /v1/users 
// request params
{
  "user": {
    "email": "test@example.com",
    "password": "123456",
    "username": "test"
  }
}
```

- Sign In
```
POST /v1/auth/sign_in 
// request params
{
  "auth": {
    "email": "test@example.com",
    "password": "123456"
  }
}
```

- Get User info
```
GET /v1/auth/me
// You need to set JWT token to Bearer Token
```

- Delete User
```
DELETE /v1/users
// You need to set JWT token to Bearer Token
```


