class SupportController < ApplicationController
  def new
    @error_messages = []
  end

  def create
    from_email = params[:email]
    message = params[:message]
    
    @error_messages = []
    @error_messages << 'Please enter your email' if from_email.empty?
    @error_messages << 'Please enter your message' if message.empty?

    #No errors, all good
    if @error_messages.empty?
      #Send the message to our support email address
      SupportMailer.contact_support(from_email, message).deliver_now
      #Show success message
      render :success
    #There are errorss
    else
      #Show the user the errors
      render :new
    end

  end
end
