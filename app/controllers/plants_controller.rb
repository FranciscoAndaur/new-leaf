class PlantsController < ApplicationController

    def new
        @plant = Plant.new
    end
     
    def create
        @plant = Plant.new(plant_params)
        if @plant.save
            redirect_to garden_path
        else
            render :new
        end
    end
    
    private
    
    def plant_params
        params.require(:plant).permit(:plant_type, :nickname, :size, :water_amount, :garden_id)
    end
    
end
