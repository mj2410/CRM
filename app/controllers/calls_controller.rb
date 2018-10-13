class CallsController < ApplicationController
	def create 
		@contact = Contact.find(params[:contact_id])
		@call = @contact.calls.create(call_params)
		redirect_to contact_path(id: @contact)
	end

	private def call_params
		params.require(:call).permit(:description,:date_time,:rank)
	end

	def destroy 
		@contact = Contact.find(params[:contact_id])
		@call = Call.find(params[:id])
		@call.destroy
		redirect_to contact_path(@contact)
	end

	def update
		@contact = Contact.find(params[:contact_id])
		@call = Call.find(params[:id])
		@call.update(call_params)
		redirect_to contact_path(@contact)
	end

end
