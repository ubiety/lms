# config/initializers/datadog-tracer.rb

Rails.configuration.datadog_trace = {
  enabled: Rails.env.test? ? false : true,
  auto_instrument: true,
  auto_instrument_redis: true,
  default_service: 'lms'
}
