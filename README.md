# README

# 🏙 Optimal City

Контейнеризованное Ruby on Rails приложение, упакованное в Docker.
Работает на Ruby 3.3, Bundler 2.6.3, сервер — Puma.

## ⚡ Быстрый старт
## Сборка образа
```docker build -t optimal-city-image .```

## Запуск контейнера
```docker run -d --name optimal-city-cont -p 3000:3000 optimal-city-image```

## Логи (посмотреть что там творится)
```docker logs -f optimal-city-cont```


После запуска приложение будет доступно тут 👉 http://localhost:3000 (нет, шучу)

# ⚙️ Что внутри

### Ruby 3.3

### Bundler 2.6.3

### Rails (production mode)

### Puma как веб-сервер

### Node.js + Yarn для ассетов

### PostgreSQL драйвер (libpq-dev)
