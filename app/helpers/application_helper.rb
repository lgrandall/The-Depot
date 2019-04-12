module ApplicationHelper

	def render_if(condition, template)
		if condition
			render template
		end
	end
end
