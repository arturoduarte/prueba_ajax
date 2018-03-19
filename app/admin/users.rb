ActiveAdmin.register User do
	permit_params :email, :password, :password_confirmation
	
	controller do
		def update
			if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
				params[:user].delete("password")
				params[:user].delete("password_confirmation")
			end
			super
		end
		
		
		def index
			respond_to do |format|
				format.html { super }
				format.csv  { super }
				format.xml  { super }
				format.json { super }
				format.pdf do
					@users = User.all
					render pdf: 'users', layout: 'pdf', template: 'admin/users/index_pdf.html.erb'
				end
			end
		end
	end
	
	
	#para el show
	index do
		column :id
		column :email
		column :created_at
		column :mi_columna do
			'Hola!'
		end
		column :email_provider do |user|
			user.email.split('@').last.capitalize
		end
		column :member_since do |user|
			time_ago_in_words(user.created_at)
		end
		actions
	end
	
	
	#al momento de crear un nuevo usuario desde el active admin
	form do |f|
		inputs 'Agregar un nuevo usuario' do
			input :email
			input :password
			input :password_confirmation
		end
		actions
	end
	
	
	filter :email, as: :select
	filter :email
	filter :current_sign_in_at
	filter :sign_in_count
	filter :created_at
end
