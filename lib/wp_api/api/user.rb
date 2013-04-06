module WpApi
	module Api
		module User

			def getUsersBlogs
				@connection.call('wp.getUsersBlogs', @wp_username, @wp_password)
			end

			def getUser(user_id, fields = [])
	      return_fields = merge_fields_with_default_user_fields(fields)
				@connection.call('wp.getUser', @blog_id, @wp_username, @wp_password, user_id, return_fields)
			end

			def getUsers(filter = {}, fields = [])
				filter = {
	        #:role => 'admin',
	        #:who => 'authors',
	        #:number => 10,
	        #:offset => 0,
	        :orderby => 'user_id',
	        :order => 'asc'
	      }.merge(filter)

	      return_fields = merge_fields_with_default_user_fields(fields)
				@connection.call('wp.getUsers', @blog_id, @wp_username, @wp_password, filter, return_fields)
			end

			def getProfile(fields = [])
	      return_fields = merge_fields_with_default_user_fields(fields)
				@connection.call('wp.getProfile', @blog_id, @wp_username, @wp_password, user_id, return_fields)
			end

			def editProfile(content = {})
				@connection.call('wp.editProfile', @blog_id, @wp_username, @wp_password, content)
			end

			def getAuthors
				@connection.call('wp.getAuthors', @blog_id, @wp_username, @wp_password)
			end

			def merge_fields_with_default_user_fields(fields)
				[:user_id, :username, :email, :roles] | fields.map{|e| e.to_sym}
			end
		end
	end
end