class PlantsController < ApplicationController

    def new
        @plant = Plant.new
    end
     
    def create
        @plant = Plant.new(plant_params)
        if @plant.save
            redirect_to gardens_path
        else
            render :new
        end
    end

    def destroy
        # find current plant
        # remove current plant 
        # redirect to currentusers garden
    end
    
    private
    
    def plant_params
        params.require(:plant).permit(:plant_type, :nickname, :size, :water_ammount, :garden_id)
    end
    
end
