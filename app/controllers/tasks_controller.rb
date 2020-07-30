class TasksController < ApplicationController
  
    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task.interval = params[:interval]
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

    def destroy
        @task = Task.find(params[:id])
          @task.delete  
        redirect_to @task.plant
    end

    def update
        @task = Task.find(params[:id])
        @task.complete
        redirect_to @task.plant
    end

    private
    def task_params

        params.require(:task).permit(:name, :interval, :plant_id, :user_id)
    end
    
end
