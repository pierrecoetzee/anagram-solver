module ApplicationHelper
	def current_user
		return @current_user = User.find(session[:user_id]) if session[:user_id].present?
		nil
	end

	def html(&block)
    	surround(%Q(<!--[if lt IE 7 ]><html lang="#{ I18n.locale }" class="no-js ie6"><![endif]--><!--[if IE 7 ]><html lang="#{ I18n.locale }" class="no-js ie7"><![endif]--><!--[if IE 8 ]><html lang="#{ I18n.locale }" class="no-js ie8"><![endif]--><!--[if IE 9 ]><html lang="#{ I18n.locale }" class="no-js ie9"><![endif]--><!--[if (gt IE 9)|!(IE)]> ><! <![endif]--><html class="no-js" lang="en" xml:lang="#{ I18n.locale }" xmlns='http://www.w3.org/1999/xhtml'><!-- <![endif] -->).html_safe, '</html>'.html_safe, &block)
    end
end
