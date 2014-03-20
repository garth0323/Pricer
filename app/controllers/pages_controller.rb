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
  
  def optin
  end
  
  def optinresult
    @subscribers = params[:subscribers]
    @template = params[:template_price]
    @optin_setup_fee = optin_setup
    @optin_price = 0
    @optin_sends = 0
    @optin_result = optin_price
  end
  
  private
   
    def email_price
     
      if @frequency.to_i < 1
        flash[:error] = "You must choose the frequency."
        redirect_to email_path
      elsif @frequency.to_i < 3
        @setup_fee = 250
        if @email.to_i < 10000
          flash[:error] = "Must be more than 10,000 emails."
          redirect_to root_path
        elsif @email.to_i >= 10000 && @email.to_i < 50000
          ((@email.to_i / 1000) * @frequency.to_i * 80)
        elsif @email.to_i >= 50000 && @email.to_i < 75000
          ((@email.to_i / 1000) * @frequency.to_i * 50)
        elsif @email.to_i >= 75000 && @email.to_i < 100000
          ((@email.to_i / 1000) * @frequency.to_i * 40)
        else #more than 100000 emails
          ((@email.to_i / 1000) * @frequency.to_i * 35)
        end
      else
        @setup_fee = 150
        if @email.to_i < 10000
          flash[:error] = "Must be more than 10,000 emails."
          redirect_to root_path
        elsif @email.to_i >= 10000 && @email.to_i < 50000
          ((@email.to_i / 1000) * @frequency.to_i * 70)
        elsif @email.to_i >= 50000 && @email.to_i < 75000
          ((@email.to_i / 1000) * @frequency.to_i * 45)
        elsif @email.to_i >= 75000 && @email.to_i < 100000
          ((@email.to_i / 1000) * @frequency.to_i * 35)
        else #more than 100000 emails
          ((@email.to_i / 1000) * @frequency.to_i * 30)
        end
      end
    end
  
  def optin_price
    if @subscribers.to_i <= 500
      @optin_price = 25
      @optin_sends = 2500
    elsif @subscribers.to_i > 500 && @subscribers.to_i < 2500
      @optin_price = 45
      @optin_sends = 12500
    elsif @subscribers.to_i > 2500 && @subscribers.to_i < 5000
      @optin_price = 65
      @optin_sends = 25000
    elsif @subscribers.to_i > 5000 && @subscribers.to_i < 10000
      @optin_price = 110
      @optin_sends = 50000
    else
      @optin_price = 140
      @optin_sends = 75000
    end
  end
  
  def optin_setup
    if @template == 'custom'
      750
    else
      99
    end
  end
end
