module StoreIndexCounter

	private

	def count_increment
		if session[:index_counter] != nil
			session[:index_counter] += 1
		else 
			session[:index_counter] = 1
		end 
	end

	def reset_counter
		session[:index_counter] = 0
	end
end 