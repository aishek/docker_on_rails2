class HealthcheckController < ApplicationController
  def show
    ActiveRecord::Base.connection.execute 'SELECT 1'
    client = Redis.new(
      url: ENV.fetch('REDIS_URL', 'redis://localhost:6379'),
      port: 6379
    )
    client.info

    render plain: 'ok'
  end
end
