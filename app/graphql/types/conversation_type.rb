Types::ConversationType = GraphQL::ObjectType.define do
  name 'Conversation'
  field :author do
    type Types::UserType
    resolve ->(obj, args, ctx) { obj.author }
  end
  field :receiver do
    type Types::UserType
    resolve ->(obj, args, ctx) { obj.receiver }
  end
end
