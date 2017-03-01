module Reporting
  class Contact < Dry::Struct
    attribute :id, Types::Strict::Int
    attribute :email, ::Types::Email
    attribute :name, Types::Strict::String.optional
  end
end
