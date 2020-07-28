class GardensController < ApplicationController

    def garden
        # should show the user their garden if they have one
        byebug
       @garden = Garden.find_by(user_id: current_user.id)
        #other wise create new garden
        byebug
        if !!@garden
            byebug
            redirect_to garden_path
        else
            # page rendered says you currently have no plants in your garden
            # maybe have a garden created as you sign up
            # render a page that allows you either add a plant remove a plant /homebutton/ logoutbutton 
            redirect_to new_garden_path
        end    
    end

    def new
        @garden = Garden.new
        # one of these has to build out the form
        @garden.plants.build
        @garden.plants.build
        @garden.plants.build
    end
    def create
        @garden = Garden.new(garden_params)
    end

    private

    def garden_params
        # waterammount <<< new spelling
        # needs to have nested attributes for plant
        params.require(:garden).permit(:garden_name,:plant_pop, plants_attributes:[:plant_type, :nickname, :size, :water_ammount])
    end
  

end
