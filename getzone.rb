require 'rubygems'
require 'aws-sdk'
require 'json'
creds = JSON.load(File.read('credentials.json'))
@creds = Aws::Credentials.new(creds['access_id'], creds['private_key'])
 
zoneid = "Z3BJ6K6RIION7M"
r53 = Aws::Route53::Client.new(
    credentials: @creds,
    region: 'us-west-2'
    )
resp = r53.list_hosted_zones
resp[:hosted_zones].each do |zone|
    puts zone[:name]
    puts zone[:id]
    puts zone[:config][:comment]
  #puts(zone[:name] + ' ' + zone[:id] + zone[:config][:comment])
  #if (zone[:name] == "bortels.us.") then zoneid = zone[:id] end
  
 puts records = r53.list_resource_record_sets({:hosted_zone_id => '/hostedzone/Z1YJMJE24SH27C'})
end
 
