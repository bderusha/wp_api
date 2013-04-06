module WpApi
	module Api
		module Taxonomy

			def getTaxonomy(taxonomy)
				@connection.call('wp.getTaxonomy', @blog_id, @wp_username, @wp_password, taxonomy)
			end

			def getTaxonomies
				@connection.call('wp.getTaxonomies', @blog_id, @wp_username, @wp_password)
			end

			def getTerm(taxonomy, term_id)
				@connection.call('wp.getTerm', @blog_id, @wp_username, @wp_password, taxonomy, term_id)
			end

			def getTerms(taxonomy, filter = {})
				filter = {
	        #:number => 10,
	        #:offset => 0,
	        :orderby => 'term_id',
	        :order => 'asc',
	        #:hide_empty => false,  #boolean
	        #:search => 'string'
	      }.merge(filter)
				@connection.call('wp.getTerms', @blog_id, @wp_username, @wp_password, taxonomy, filter)
			end

			def newTerm(content = {})
				@connection.call('wp.newTerm', @blog_id, @wp_username, @wp_password, content)
			end

			def editTerm(term_id, content = {})
				@connection.call('wp.editTerm', @blog_id, @wp_username, @wp_password, term_id, content)
			end

			def deleteTerm(taxonomy, term_id)
				@connection.call('wp.deleteTerm', @blog_id, @wp_username, @wp_password, taxonomy, term_id)
			end
		end
	end
end