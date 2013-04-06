module WpApi
  class Client
    include Api::Post
    include Api::User
    include Api::Taxonomy
    include Api::Option
    include Api::Media
    include Api::Comment

    attr_reader :connection
    attr_accessor :host, :path, :port, :proxy_host, :proxy_port, :use_ssl, :conn_username, :conn_password, :timeout, :blog_id, :wp_username, :wp_password

    DEFAULT_OPTIONS = {
        :blog_url   => nil, #this is the preferred, easy way to create the connection path

        #WP Settings
        :blog_id    => 0,
        :wp_username   => nil,
        :wp_password   => nil,

        #manual options for XML:RPC::Client configuration
        :host             => nil,
        :port             => nil,
        :use_ssl          => nil,
        :xmlrpc_file_path => nil,
        :proxy_host       => nil,
        :proxy_port       => nil,
        :conn_username    => nil,
        :conn_password    => nil,
        :timeout          => nil

      }

    DEFAULT_WP_XMLRPC_FILE = 'xmlrpc.php'

    def initialize(options = {})
      opts = DEFAULT_OPTIONS
      opts.merge!(options)

      # host = opts[:host].gsub('http://','').split('/')
      # path = "/"+(host[1..-1]+[opts[:path]]).join('/')

      if opts[:blog_url]
        self.parse_blog_url(opts[:blog_url])
      else
        self.host        = opts[:host]
        self.path        = opts[:xmlrpc_file_path] || '/'+DEFAULT_WP_XMLRPC_FILE
        self.port        = opts[:port]
        self.use_ssl     = opts[:use_ssl].nil? ? false : opts[:use_ssl]
      end

      # self.host          = host[0]
      # self.path          = path
      # self.port          = opts[:port]
      self.proxy_host    = opts[:proxy_host]
      self.proxy_port    = opts[:proxy_port]
      self.conn_username = opts[:conn_username]
      self.conn_password = opts[:conn_password]
      self.timeout       = opts[:timeout]

      self.blog_id       = opts[:blog_id]
      self.wp_username   = opts[:wp_username]
      self.wp_password   = opts[:wp_password]
      self.connect
      self
    end

    def connect
      @connection = XMLRPC::Client.new(self.host, self.path, self.port, self.proxy_host, self.proxy_port, self.conn_username, self.conn_password, self.use_ssl, self.timeout)
    end

    def parse_blog_url(blog_url)
      puts 'test'
      puts blog_url
      no_protocol_url_ary = blog_url.gsub('http://','').gsub('https://','').split('/')
      no_protocol_url = no_protocol_url_ary[0].split(':')
      host = no_protocol_url[0]
      port = no_protocol_url[1]

      self.use_ssl = !(blog_url=~/https/).nil?
      self.host = host
      self.port = port || 80
      self.path = (['']+no_protocol_url_ary[1..-1]+[DEFAULT_WP_XMLRPC_FILE]).join('/')
    end
  end
end