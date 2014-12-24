class AccountsController < ApplicationController

	def index
		render status: 404 if account_params.nil?
		accounts = Account.find_by_name(account_params) or not_found
		# raise current_user.admin?.inspect
		# raise signed_in.inspect
	end

	def settings
		# raise "xxxx"
	end

private
	def account_params
		params[:account_id]
	end
end
