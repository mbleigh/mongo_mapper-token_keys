require "mongo_mapper/token_keys/version"

require 'mongo_mapper'
require 'securerandom'

module MongoMapper
  module TokenKeys
    extend ActiveSupport::Concern
    DEFAULT_SIZE = 20

    def self.generate(size = DEFAULT_SIZE)
      SecureRandom.urlsafe_base64(size)
    end

    module ClassMethods
      def tokens
        @tokens ||= {}
      end

      def token(name, options = {})
        key name, String, options
        tokens[name.to_sym] = options.delete(:size) || DEFAULT_SIZE

        if tokens.size == 1
          before_validation(:on => :create) do
            self.class.tokens.each_pair do |token, size|
              self[token] ||= MongoMapper::TokenKeys.generate(size)
            end
          end
        end
      end
    end
  end
end

MongoMapper::Document.plugin(MongoMapper::TokenKeys)