require "active_support"
require "rails/observers/active_model"

require "mongoid"
require "mongoid/observers/config"
require "mongoid/observers/interceptable"
require "mongoid/observers/railtie" if defined? Rails
require "mongoid/observer"

module Mongoid
  include ActiveModel::Observing

  # Use def_delegators from Forwardable instead of delegate from ActiveSupport as it conflicts
  # with Forwardable delegate/instance_delegate.
  # See: https://jira.mongodb.org/browse/MONGOID-4849

  def_delegators Config, *(ActiveModel::Observing::ClassMethods.public_instance_methods(false))
end
