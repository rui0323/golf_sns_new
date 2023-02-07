class ApplicationController < ActionController::Base
  def application
     @customer = Customer.find(params[:id])
  end
end
