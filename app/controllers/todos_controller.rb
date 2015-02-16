class TodosController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  def index
      @todos = Todo.all
      #render @todo_items
  end

  def new
  	@todo=Todo.new
  end

  def show
	@todo = Todo.find(params[:id])
  end

  def edit
	@todo = Todo.find(params[:id])
  end

  def create
   @todo=Todo.new(todo_params)
   @todo.user = current_user
   @todo.save
   #redirect_to @todo_item 
   if !@todo.valid?
        flash[:error] = @todo.errors.full_messages.join("<li>").html_safe
   else
		flash[:success] = "Todo added successfully" 
   end  
   	 redirect_to :action => 'index'
  end

  def update
  	@todo = Todo.find(params[:id])
    if @todo.user == current_user
    	if @todo.update(todo_params)
        flash[:success] = "Updated todo"
    		redirect_to todos_path
    	else
    		render 'edit'
    	end
    else
      redirect_to show
      flash[:danger] = "You can't do this"
    end
  end

  def complete
  	params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
       t.update_attribute(:completed, true)
     end
    redirect_to :action => 'index'
  end

  def incomplete
    @todo = Todo.find(params[:id])
      if @todo.user == current_user
        if @todo.completed.nil? || @todo.completed == false
          # @todo.update_attribute(:completed, true)
          @todo.completed = true
        else
          # @todo.update_attribute(:completed, false)
          @todo.completed = false
        end
        @todo.save
      end
    redirect_to show
  end


  def destroy
    @todo = Todo.find(params[:id])
    if @todo.user == current_user
    	
    	@todo.destroy

    	redirect_to todos_path
      else
        redirect_to show
        flash[:danger] = "You can't destroy others todo"
      end
  end



  private
		def todo_params
			params.require(:todo).permit(:todo_item)
		end
end
