class TodosController < ApplicationController
    
    def index  
       @todos = Todo.all 
    end
    
    def new
        
        @todo = Todo.new
    end
    
    def create
        @todo = Todo.new(todo_params)
        if @todo.save 
            flash[:notice] = "Create todo successfully"
            redirect_to todo_path(@todo)
        else
            render 'new'
        end
    end
    
    def show
        @todo = Todo.find(params[:id])
    end
    
    def edit
        @todo = Todo.find(params[:id])
    end
    
    def update 
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            flash[:notice] = "Update todo successfully"
            redirect_to todo_path(@todo)
        else
            render 'edit'
        end
    end
    
    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        flash[:notice] = "Delete todo successfully"
        redirect_to todos_path
    end
    
    private
        def todo_params
           params.require(:todo).permit(:name, :description) 
        end
        
end