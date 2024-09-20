class WelcomeController < ApplicationController
  def index
    # render plain: "Hello World"
    render :welcome
  end

  def check_db
    begin
      ActiveRecord::Base.connection.execute("SELECT 1")
      render plain: "Database connected successfully!"
    rescue ActiveRecord::NoDatabaseError
      render plain: "Database does not exist.", status: :internal_server_error
    rescue ActiveRecord::ConnectionNotEstablished
      render plain: "Could not establish a connection to the database.", status: :internal_server_error
    rescue StandardError => e
      render plain: "An error occurred: #{e.message}", status: :internal_server_error
    end
  end
end
