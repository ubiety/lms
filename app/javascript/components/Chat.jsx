import React from 'react'
import axios from 'axios'
import ChatList from './ChatList'

class Chat extends React.Component {
  constructor () {
    super();
    this.state = {
      chats: []
    }
  }

  fetchChats () {
    axios.get('/conversations').then(response => {
      this.setState({ chats: response.data })
    }).catch(error => {
      console.error(error)
    })
  }

  componentDidMount () {
    this.fetchChats()
  }

  componentWillUnmount () {

  }

  render () {
    return (
      <div className="card">
        <div className="card-header">Chat</div>
        <div className="card-body">
          <ChatList chats={this.state.chats} />
        </div>
      </div>
    )
  }
}

export default Chat
