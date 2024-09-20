class DashboardController < ApplicationController
  before_action :require_login

  def index
    render plain: "Hello Dashboard"
  end
end
