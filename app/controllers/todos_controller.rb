class TodosController < ApplicationController
  def todo
    @todo = Todo.new
    @todos = current_user.todos
  end

  def show
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    render plain: "#{todo.todo_text}"
  end

  def create
    todo = Todo.new(todo_params)
    todo[:user_id] = current_user.id
    if todo.save
      redirect_to root_path
    else
      redirect_to root_path, warning: todo.errors.full_messages.join(",")
    end
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    redirect_to root_path
  end

  def destroy
    id = params[:id]
    Todo.of_user(current_user).find(id).destroy
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:todo_text, :due_date)
  end
end
