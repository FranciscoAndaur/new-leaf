class GardensController < ApplicationController

    def garden
       @garden = Garden.find_by(user_id: current_user.id)
    end

    private

    
  

end
