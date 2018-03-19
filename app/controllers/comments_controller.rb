class CommentsController < ApplicationController
	def create
		@company = Company.find(params[:company_id])
		@comment = Comment.new(content:params[:comment][:content], user: current_user)
		@company.comments << @comment
		@comment.save
		# redirect_to @post
		# por defecto busca un js con el mismo nombre del método y dentro de la carpeta comments(cuando el form es remoto)
	end
end
