module Reporting
  class Building < Dry::Struct
    attribute :id, Types::Strict::Int
    attribute :contact, Contact
  end
end
