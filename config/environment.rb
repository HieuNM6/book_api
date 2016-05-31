# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.

Rails.application.configure do
	config.middleware.insert_before 0, "Rack::Cors" do
		allow do
			# In development, we don't care about the origin.
			origins '*'
			# Reminder: On the following line, the 'methods' refer to the 'Access-
			# Control-Request-Method', not the normal Request Method.
			resource '*', :headers => :any, :methods => [:get, :post, :options, :delete, :put, :patch], credentials: true
		end
	end
end
Rails.application.initialize!
