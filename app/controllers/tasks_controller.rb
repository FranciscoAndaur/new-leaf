class TasksController < ApplicationController
  
    def new
        @task = Task.new
    end

    def create
        byebug 
        flash[:plant_id]
        @task = Task.new(task_params)
        if @task.save
            # redierct to plant page belonging to the garden
            bybug
            redirect_to gardens_path
        else
            
        end
        
    end
    private
    def task_params

        params.require(:task).permit(:content, :start_date, :plant_id, :user_id)
    end
    
end
