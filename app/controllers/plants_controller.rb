class PlantsController < ApplicationController
    before_action :find_plant, only: [:show, :edit, :update, :destroy]
    def new
        @plant = Plant.new
        
    end

    def show
        @task = Task.new
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
       
        @plant.destroy
        # remove current plant 
       
        redirect_to gardens_path
        # redirect to currentusers garden
    end
    
    private

    def find_plant
        @plant = Plant.find(params[:id])
    end
    
    def plant_params
        params.require(:plant).permit(:plant_type, :nickname, :size, :water_ammount, :garden_id)
    end
    
end
