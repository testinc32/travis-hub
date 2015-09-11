require 'travis/hub/support/lock/none'
require 'travis/hub/support/lock/postgresql'
require 'travis/hub/support/lock/redis'

module Travis
  module Support
    module Lock
      extend self

      def exclusive(name, options = nil, &block)
        strategy = options && options[:strategy] || :none
        const_get(camelize(strategy)).new(name, options).exclusive(&block)
      end

      def camelize(object)
        object.to_s.split('_').collect(&:capitalize).join
      end
    end
  end
end