module WpApi
	module Api
		module Comment

			def getCommentCount(post_id)
				@connection.call('wp.getCommentCount', @blog_id, @wp_username, @wp_password, post_id)
			end

			def getComment(comment_id)
				@connection.call('wp.getComment', @blog_id, @wp_username, @wp_password, comment_id)
			end

			def getComments(filter = {})
				filter = {
	        #:post_id => 1,
	        #:status => '',
	        :number => 10,
	        :offset => 0
	      }.merge(filter)

				@connection.call('wp.getComments', @blog_id, @wp_username, @wp_password, filter)
			end

			def newComment(post_id, comment = {})
				@connection.call('wp.newComment', @blog_id, @wp_username, @wp_password, post_id, comment)
			end

			def editComment(comment_id, comment = {})
				@connection.call('wp.editComment', @blog_id, @wp_username, @wp_password, comment_id, comment)
			end

			def deleteComment(comment_id)
				@connection.call('wp.deleteComment', @blog_id, @wp_username, @wp_password, comment_id)
			end

			def getCommentStatusList
				@connection.call('wp.getCommentStatusList', @blog_id, @wp_username, @wp_password)
			end
		end
	end
end