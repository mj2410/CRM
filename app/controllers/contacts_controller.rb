class ContactsController < ApplicationController
	def new 
		@contact = Contact.new
	end

	def index
		@contact = Contact.new
		@contacts = Contact.all
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to contacts_path(id: @contact)
		else
			@contacts = Contact.all
			render contacts_path
		end
	end

	private def contact_params
		params.require(:contact).permit(:first_name,:last_name,:mobile_number,:phone_number,:address)
	end

	def show
		@contact = Contact.find(params[:id])
	end 

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])

		if @contact.update(contact_params)
			redirect_to contacts_path
		else
			render 'edit'
		end
	end

	def search 
	end

	def results
		if params[:subject][:name].present?
			where_statement = "first_name LIKE ? or last_name LIKE ?"
		else
			where_statement = "first_name = ? or last_name = ?"
		end
		if params[:subject][:number].present?
			where_statement = where_statement + " or phone_number LIKE ? or mobile_number LIKE ?"
		else
			where_statement = where_statement + " or phone_number = ? or mobile_number = ?"
		end	
		if params[:subject][:address].present?
			where_statement = where_statement + " or address LIKE ?"	
		else
			where_statement = where_statement + " or address = ?"
		end

		@contacts = Contact.where(where_statement, "%#{params[:subject][:name]}%", "%#{params[:subject][:name]}%", "%#{params[:subject][:number]}%", "%#{params[:subject][:number]}%", "%#{params[:subject][:address]}%" ).load
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to home_path
	end

end
