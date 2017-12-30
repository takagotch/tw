class OmniauthCallbackControoler < Devise::OmniauthCallbacksController
	def all
   	  user = User.form_omniauth(request.env["omniauth.auth"])

	  if user.persisted?
	    flash.notice = "login!"
	    sign_in_and_redirect user
	  else
	    session["devise.user_attributes"] = user.attributes
	    redirect_to new_user_registration_url
	  end
	end

	alias_method :twitter, :all
end

