class OmniauthCallbacksController < Devise::OmniauthCallbacksController
   
    def facebook
      # You need to implement the method below in your model (e.g. app/models/agent.rb)
      @agent = Agent.from_omniauth(request.env["omniauth.auth"])
  
      if @agent.persisted?
        sign_in_and_redirect @agent, event: :authentication #this will throw if @agent is not activated
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      else
        flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
        redirect_to new_agent_registration_url
        # session["devise.facebook_data"] = request.env["omniauth.auth"]
        # redirect_to new_agent_registration_url
      end
    end

    def google_oauth2
      @agent = Agent.from_omniauth(request.env['omniauth.auth'])
      if @agent.persisted?
        sign_in_and_redirect @agent, event: :authentication
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      else
        # session["devise.google_oauth2_data"] = request.env["omniauth.auth"]
        # redirect_to new_agent_registration_url
        flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
        redirect_to new_agent_registration_url
      end 
    end
  
    def failure
      # flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
      # redirect_to new_agent_registration_url
      redirect_to root_path
    end
end