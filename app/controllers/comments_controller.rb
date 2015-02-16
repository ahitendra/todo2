class CommentsController < ApplicationController

	def new
		@comment=Comment.new
	end

	def create
		@todo = Todo.find(params[:todo_id])
		@todo.user = current_user
		@comment = Comment.new(body: comment_params[:body])
		@comment.todo_id = @todo.id
		@comment.user = current_user
		@comment.Commenter = current_user.full_name
		@comment.save
		if !@comment.valid?
			flash[:error] = @comment.errors.full_messages.join("<li>").html_safe
		end
		redirect_to todo_path(@todo)
	end

	def destroy
		@todo = Todo.find(params[:todo_id])
			@comment = @todo.comments.find(params[:id])
			if @todo.user == current_user

				@comment.destroy

				redirect_to todos_path(@todo)
			else
				redirect_to todos_path(@todo)
				flash[:danger] = "You can't destroy others todo"
		end
	end


	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
