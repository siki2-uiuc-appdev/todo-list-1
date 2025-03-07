class TasksController < ApplicationController
  def index
    matching_tasks = Task.all

    @list_of_tasks = matching_tasks.order({ :created_at => :desc })

    render({ :template => "tasks/index.html.erb" })
  end

  def create
    the_task = Task.new
    the_task.body = params.fetch("query_body")
    the_task.owner_id = @current_user.id
    the_task.status = "next up"

    if the_task.valid?
      the_task.save
      redirect_to("/tasks", { :notice => "Task created successfully." })
    else
      redirect_to("/tasks", { :alert => the_task.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_task = Task.where({ :id => the_id }).at(0)

    # the_task.body = params.fetch("query_body")
    the_task.status = params.fetch("query_status")
    # the_task.owner_id = params.fetch("query_owner_id")

    if the_task.valid?
      the_task.save
      redirect_to("/tasks", { :notice => "Task updated successfully."} )
    else
      redirect_to("/tasks", { :alert => the_task.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_task = Task.where({ :id => the_id }).at(0)

    the_task.destroy

    redirect_to("/tasks", { :notice => "Task deleted successfully."} )
  end
end
