module CloudProviders
  class Authorize < Ec2
    default_options({
                :protocol => "tcp",
                :from_port => "22",
                :to_port => "22",
                :network => "0.0.0.0/0"})
    def run
      puts "Authorizing: #{cloud.proper_name} for #{protocol} to #{from_port}:#{to_port} #{network}"
      options = { :group_name => cloud.proper_name,
                  :ip_protocol => protocol,
                  :from_port => from_port,
                  :to_port => to_port,
                  :cidr_ip => network}
              
      ec2.authorize_security_group_ingress(options) rescue nil
    end
  end
end