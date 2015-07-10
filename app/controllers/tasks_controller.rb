class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  respond_to :html
 
 
  def index
  @tasks = current_user.tasks
  respond_with(@tasks)
  end
 

  def show
      respond_with(@task)
  end


  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end


  def create
    @task = current_user.tasks.new(task_params)
    @task.save
    respond_with(@task)
  end
   

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:content)
    end
end 

