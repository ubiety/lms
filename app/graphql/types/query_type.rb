Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :user do
    type Types::UserType
    argument :id, !types.Int
    resolve ->(obj, args, ctx) { User.find(args[:id]) }
  end

  field :users do
    type Types::UserType
    argument :page, !types.Int
    resolve ->(obj, args, ctx) { User.all.page(args[:page]) }
  end

  field :conversation do
    type types[Types::ConversationType]
    resolve ->(obj, args, ctx) { Conversation.participating(ctx[:current_user]) }
  end
end
