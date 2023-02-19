class ApplicationController < ActionController::Base
  def application
     @customer = Customer.find(params[:id])
  end


   def ensure_sign_in_customer
    if current_customer.blank?
      redirect_to root_path
    end
   end

    def ensure_sign_in_admin
    if current_admin.blank?
      redirect_to root_path
    end
    end

end
