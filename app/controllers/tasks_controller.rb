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

    def show
        @task = Task.find(params[:id])
    end

    def update
        #TODO fix it Jackson
        task = params[:days_completed]
        @task = Task.update(task_params)
        redirect_to gardens_path
    end

    private
    def task_params

        params.require(:task).permit(:name, :interval, :plant_id, :user_id)
    end
    
end
