class PropertiesController < ApplicationController

    def new
        @property = current_user.properties.build
      end
    
    def create
        @property = current_user.properties.build(property_params)
        if @property.save
            redirect_to edit_property_path(@property), notice: "Save..."
        else
            redirect_to request.referrer, flash: {error: @property.errors.full_messages }
        end
    end

    def edit
    end
end
