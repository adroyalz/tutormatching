class SessionsController < ApplicationController
  def new
  end
  
  def create 
    person = Person.find_by(email: params[:session][:email])
    @overwatch = params[:id]
    
    if person && person.authenticate(params[:session][:password])
      log_in person
      remember(person)
      params[:session][:remember_me] == '1' ? remember(person) : forget(person)
     # session[:id] = person.id
      if person.admin?
        redirect_to :controller => 'people', :action => 'adminPage', :id => session[:tutor_id]
      else
        redirect_to person               #This code can replace 'person':       :controller => 'people', :action => 'show', :id => session[:tutor_id]
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
    session[:tutor_id] = nil
  end
end
