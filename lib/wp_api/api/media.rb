module WpApi
	module Api
		module Media
			def getMediaItem(attachment_id)
				@connection.call('wp.getMediaItem', @blog_id, @wp_username, @wp_password, attachment_id)
			end

			def getMediaLibrary(filter = {})
				filter = {
	        :number => 10,
	        :offset => 0,
	        #:mime_type => ''
	        :parent_id => '' #Limit to attachments on this post ID. 0 shows unattached media items. Empty string shows all media items.
	      }.merge(filter)

				@connection.call('wp.getMediaLibrary', @blog_id, @wp_username, @wp_password, filter)
			end

			def uploadFile(data)
				#data = {
				# 	:name => 'Filename',  #string name: Filename.
				# 	:type => 'MIME type', #string type: File MIME type.
				#  	:bits => '001100110', #string bits: binary data. Shouldn't be base64-encoded.
				# 	:overwrite => true    #bool overwrite: Optional. Overwrite an existing attachment of the same name
				#}

				@connection.call('wp.uploadFile', @blog_id, @wp_username, @wp_password, data)
			end
		end
	end
end