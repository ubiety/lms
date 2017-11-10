import React, { Component } from 'react'
import { ApolloProvider } from 'react-apollo'
import ChatClient from './chat-client'
import ChatListWithData from './chat-list'

class Chat extends Component {
  render() {
    return (
      <ApolloProvider client={ChatClient}>
        <div className="card">
          <div className="card-header">Chat</div>
          <div className="card-body">
            <ChatListWithData />
          </div>
        </div>
      </ApolloProvider>
    )
  }
}

export default Chat
