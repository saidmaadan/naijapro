class Agents::SessionsOrRegistrationsController < ApplicationController
    def new
    end
   
    private
   
    def resource_name
      :agent
    end
    helper_method :resource_name
   
    def resource
      @resource ||= Agent.new
    end
    helper_method :resource
   
    def devise_mapping
      @devise_mapping ||= Devise.mappings[:agent]
    end
    helper_method :devise_mapping
   
    def resource_class
      Agent
    end
    helper_method :resource_class
end