module WpApi
	module Api
		module Post
			def getPost(post_id, fields = [])
	      return_fields = merge_fields_with_default_post_fields(fields)
				@connection.call('wp.getPost', @blog_id, @wp_username, @wp_password, post_id, return_fields)
			end

			def getPosts(filter = {}, fields = [])
				filter = {
	        :post_type => 'post',
	        :post_status => 'publish',
	        :number => 10,
	        :offset => 0,
	        :orderby => 'post_date',
	        :order => 'asc',
	      }.merge(filter)

	      return_fields = merge_fields_with_default_post_fields(fields)
				@connection.call('wp.getPosts', @blog_id, @wp_username, @wp_password, filter, return_fields)
			end

			def newPost(content)
				@connection.call('wp.newPost', @blog_id, @wp_username, @wp_password, content)
			end

			def editPost(post_id, content)
				@connection.call('wp.editPost', @blog_id, @wp_username, @wp_password, post_id, content)
			end

			def deletePost(post_id)
				@connection.call('wp.deletePost', @blog_id, @wp_username, @wp_password, post_id)
			end

			def getPostType(post_type_name, fields = [])
	      return_fields = self.merge_fields_with_default_post_type_fields(fields)
				@connection.call('wp.getPostType', @blog_id, @wp_username, @wp_password, post_type_name, return_fields)
			end

			def getPostTypes(filter = nil, fields = [])
	      return_fields = self.merge_fields_with_default_post_type_fields(fields)
				@connection.call('wp.getPostTypes', @blog_id, @wp_username, @wp_password, filter, return_fields)
			end

			def getPostFormats(filter = {})
	      filter = {
	        :show-supported => false
	      }.merge(filter)
				@connection.call('wp.getPostFormats', @blog_id, @wp_username, @wp_password, filter)
			end

			def getPostStatusList
				@connection.call('wp.getPostStatusList', @blog_id, @wp_username, @wp_password)
			end


			def merge_fields_with_default_post_fields(fields)
				[:post_id, :post_title, :post_date, :post_author, :post_content] | fields.map{|e| e.to_sym}
			end

			def merge_fields_with_default_post_type_fields(fields)
				[:name, :label, :public, :has_archive] | fields.map{|e| e.to_sym}
			end
		end
	end
end