class AgentsController < ApplicationController
  def dashboard
  end

  private
  def current_agent_params
    params.require(:agent).permit(:from, :about, :status, :language, :avatar)
  end
end
