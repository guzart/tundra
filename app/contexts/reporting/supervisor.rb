module Reporting
  class Supervisor < Dry::Struct
    attribute :id, Types::Strict::Int
    attribute :email, ::Types::Email
    attribute :name, Types::Strict::String.optional
  end
end
