class AgentsController < ApplicationController
  def dashboard
  end

  def show
    @agent = Agent.find(params[:id])
    
  end

  def update
    @agent = current_agent
    if @agent.update_attributes(current_agent_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Cannot update..."
    end
    redirect_to dashboard_path
  end

  private
  def current_agent_params
    params.require(:agent).permit(:from, :about, :status, :language, :avatar)
  end
end
