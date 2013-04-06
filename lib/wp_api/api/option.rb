module WpApi
	module Api
		module Option
			def getOptions(options = [])
				@connection.call('wp.getOptions', @blog_id, @wp_username, @wp_password, options)
			end

			def setOptions(options = {})
				@connection.call('wp.setOptions', @blog_id, @wp_username, @wp_password, options)
			end
		end
	end
end