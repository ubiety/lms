Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  field :id, !types.Int
  field :full_name, !types.String
end
