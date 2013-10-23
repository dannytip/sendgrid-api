require 'sendgrid/api/service'
require 'sendgrid/api/entities/profile'
require 'sendgrid/api/entities/response'

module Sendgrid
  module API
    module Web
      module Profile

        def profile
          Services.new(resource)
        end

        class Services < Sendgrid::API::Service

          # View your SendGrid profile
          #
          # @see http://sendgrid.com/docs/API_Reference/Web_API/profile.html
          # @return profile [Profile] A Web::Profile object.
          def get
            perform_request(Entities::Profile, 'profile.get.json').first
          end

          # Update your SendGrid profile
          #
          # @see http://sendgrid.com/docs/API_Reference/Web_API/profile.html#-set
          # @param profile [Profile] A Web::Profile object.
          # @return response [Response] A Response object.
          def set(profile)
            perform_request(Entities::Response, 'profile.set.json', profile.as_json)
          end

        end

      end
    end
  end
end