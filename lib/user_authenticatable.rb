require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class UserAuthenticatable < Authenticatable
      def authenticate!
        controller = params["controller"]
        email = params["user"]["email"]
        user = User.find_for_authentication(:email => email)

        if controller == "trestle/auth/sessions"
          if user
            if user.role != "admin"
              fail!('Incorrect email or password')
            end
          end
        end

        if controller == "devise/sessions"
          if user
            if user.role == "admin"
              fail!('Incorrect email or password')
            end
          end
        end

      end
    end
  end
end
