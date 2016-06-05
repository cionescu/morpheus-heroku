module MorpheusHeroku
  module Scramblers
    module Load
      extend self

      def scrambled_email
        if dev_namespace.present? && dev_domain.present?
          "#{dev_namespace}+#{random_string}@#{dev_domain}"
        else
          "dev+#{random_string}@example.com"
        end
      end

      def should_scramble_email?(email)
        if dev_domain.present?
          email.include?(dev_domain)
        else
          false
        end
      end

      def dev_domain
        @dev_domain ||= if MorpheusHeroku.configuration.dev_email
          "@" + MorpheusHeroku.configuration.dev_email.match(/(.*)@(.*)/)[2]
        else
          ""
        end
      end

      def dev_namespace
        @dev_namespace ||= if MorpheusHeroku.configuration.dev_email
          MorpheusHeroku.configuration.dev_email.match(/(.*)@(.*)/)[1]
        else
          ""
        end
      end

      private

      def random_string
        SecureRandom.hex.first(6)
      end
    end
  end
end
