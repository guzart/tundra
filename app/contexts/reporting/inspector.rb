module Reporting
  class Inspector < Dry::Struct
    attribute :id, Types::Strict::Int
    attribute :email, ::Types::Email
    attribute :is_trusted, Types::Strict::Bool
    attribute :name, Types::Strict::String.optional
    attribute :supervisor, Supervisor
  end
end
