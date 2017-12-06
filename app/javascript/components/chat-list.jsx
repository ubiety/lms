import React from 'react'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'

const ChatList = ({ data: { loading, error, conversation } }) => {
  if (loading) {
    return <p>Loading...</p>
  }

  if (error) {
    return <p>{ error.message }</p>
  }

  return <ul className="fa-ul">
    {conversation.map((chat) =>
      <li><i className="fa fa-comment-o fa-li"></i>{ chat.receiver.full_name }</li>
    )}
  </ul>
};

const ChatListWithData = graphql(gql`query {
  conversation {
    receiver {
      full_name
    }
  }
}`)(ChatList);

export default ChatListWithData
