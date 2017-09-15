# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

if !Rails.env.development?
  Rails.logger = Le.new('291ece5e-34d1-4e42-9763-463a8196fd58')
else
  Rails.logger = Le.new('291ece5e-34d1-4e42-9763-463a8196fd58', local: true)
end
