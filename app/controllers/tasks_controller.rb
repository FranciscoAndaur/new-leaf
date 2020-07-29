class TasksController < ApplicationController
  
    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            # redierct to plant page belonging to the garden
            redirect_to @task.plant
        else
            render :new
        end
        
    end
    private
    def task_params

        params.require(:task).permit(:content, :start_date, :plant_id, :user_id)
    end
    
end
