require 'aws-sdk'

module Helios::Rack
  class SimpleClientService
    def self.call(env)
      if env['REMOTE_ADDR'] =~ /127\.0\.0\.1/ || (ENV['WHITE_LIST_REGEXP'] && env['HTTP_X_FORWARDED_FOR'] =~ Regexp.new(ENV['WHITE_LIST_REGEXP']))
        begin
          json = env['rack.input'].read
          sqs = AWS::SQS.new(access_key_id: ENV['AWS_ACCESS_KEY'], secret_access_key: ENV['AWS_SECRET_KEY'])
          sqs.queues.create('helios').send_message(json)
          [200, {'Content-Type' => 'text/plain'}, ["Sent to SQS\n"]]
        rescue Exception => ex
          [500, {'Content-Type' => 'text/plain'}, ["There was an error\n", ex.message, "\n"]]
        end
      else
        return [401, {'Content-Type' => 'text/plain'}, ["Sorry. You must be at New Relic to use this."]] 
      end
    end
  end
end
