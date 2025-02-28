require 'prometheus_exporter/middleware'
require 'prometheus_exporter/instrumentation'

# Додаємо middleware для збору метрик запитів
Rails.application.middleware.unshift PrometheusExporter::Middleware

# Запускаємо збір метрик ActiveRecord
PrometheusExporter::Instrumentation::ActiveRecord.start

# Запускаємо збір метрик Sidekiq (якщо використовуєш)
