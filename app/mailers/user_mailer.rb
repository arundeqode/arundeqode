class UserMailer < ApplicationMailer
  
  def new_product_email
    @user = params[:user]
    mail(to: @user.email, subject: 'New Product Added To My Site')
  end
end