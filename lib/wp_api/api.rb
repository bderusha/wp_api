module WpApi
  module Api
    autoload :Post,  "wp_api/api/post"
    autoload :User,  "wp_api/api/user"
    autoload :Taxonomy, "wp_api/api/taxonomy"
    autoload :Option,  "wp_api/api/option"
    autoload :Media,  "wp_api/api/media"
    autoload :Comment,  "wp_api/api/comment"
  end
end