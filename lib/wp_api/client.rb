module WpApi
  class Client
    include Api::Post

    attr_reader :connection
    attr_accessor :host, :path, :port, :proxy_host, :proxy_port, :use_ssl, :conn_username, :conn_password, :timeout, :blog_id, :wp_username, :wp_password

    DEFAULT_OPTIONS = {
        :host       => nil,
        :path       => 'xmlrpc.php',
        :port       => 80,
        :proxy_host => nil,
        :proxy_port => nil,
        :use_ssl    => false,
        :conn_username   => nil,
        :conn_password   => nil,
        :timeout    => nil,

        #WP Settings
        :blog_id    => 0,
        :wp_username   => nil,
        :wp_password   => nil
      }

    def initialize(options = {})
      opts = DEFAULT_OPTIONS
      opts.merge!(options)

      host = opts[:host].gsub('http://','').split('/')
      path = "/"+(host[1..-1]+[opts[:path]]).join('/')


      self.host          = host[0]
      self.path          = path
      self.port          = opts[:port]
      self.proxy_host    = opts[:proxy_host]
      self.proxy_port    = opts[:proxy_port]
      self.use_ssl       = opts[:use_ssl]
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
  end
end