class GardensController < ApplicationController

    def index

        @garden = Garden.find_by(user_id: current_user.id)
       
    end

    def show
        @garden = Garden.find_by(user_id: params[:id])
    end

    private

    # def garden_params
    #     # waterammount <<< new spelling
    #     # needs to have nested attributes for plant
    #     params.require(:garden).permit(:garden_name,:plant_pop)
    # end
  

end
