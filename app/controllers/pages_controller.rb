class PagesController < ApplicationController
  def home
  end
  
  def about 
  end
  
  def email
  end
  
  def result
    @email = params[:amount]
    @frequency = params[:frequency]
    @setup_fee = 0
    @result = email_price
  end
  
  private
   
    def email_price
     
      if @frequency.to_i < 1
        flash[:error] = "You must choose the frequency."
        redirect_to root_path
      elsif @frequency.to_i < 3
        @setup_fee = 250
        if @email.to_i < 10000
          flash[:error] = "Must be more than 10,000 emails."
          redirect_to root_path
        elsif @email.to_i >= 10000 && @email.to_i < 50000
          ((@email.to_i / 1000) * @frequency.to_i * 80)
        elsif @email.to_i >= 50000 && @email.to_i < 75000
          ((@email.to_i / 1000) * @frequency.to_i * 80)
        elsif @email.to_i >= 75000 && @email.to_i < 100000
          ((@email.to_i / 1000) * @frequency.to_i * 80)
        else #more than 100000 emails
          ((@email.to_i / 1000) * @frequency.to_i * 80)
        end
      else
        @setup_fee = 150
        if @email.to_i < 10000
          flash[:error] = "Must be more than 10,000 emails."
          redirect_to root_path
        elsif @email.to_i >= 10000 && @email.to_i < 50000
          ((@email.to_i / 1000) * @frequency.to_i * 80)
        elsif @email.to_i >= 50000 && @email.to_i < 75000
          ((@email.to_i / 1000) * @frequency.to_i * 80)
        elsif @email.to_i >= 75000 && @email.to_i < 100000
          ((@email.to_i / 1000) * @frequency.to_i * 80)
        else #more than 100000 emails
          ((@email.to_i / 1000) * @frequency.to_i * 80)
        end
      end
    end
end
