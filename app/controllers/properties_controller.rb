class PropertiesController < ApplicationController

    def new
        @property = current_agent.properties.build
      end
    
    def create
        @property = current_agent.properties.build(property_params)
        if @property.save
            redirect_to edit_property_path(@property), notice: "Save..."
        else
            redirect_to request.referrer, flash: {error: @property.errors.full_messages }
        end
    end

    def edit
    end

    def show
        @property = Property.find(params[:id])
    end
    private

    def property_params
        params.require(:property).permit(:title, :summary)
    end

end
