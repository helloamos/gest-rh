class DashboardController < ApplicationController
	
	before_action :authenticate_user!
	
	layout 'dashboard'
	
	def index
		@employes = Employe.all

		@total_employes = Employe.all.count
		@total_users = User.all.count
		@total_sanctions = Sanction.all.count
		@total_services = Service.all.count
	end

	def unauthorize
		render layout: 'unauthorize'
	end

	

	

	
	#private
	#def complete_company
		#if current_user.superadmin? and current_user.company.blank?
			#redirect_to complete_company_path(current_user)
		#end
	#end

end