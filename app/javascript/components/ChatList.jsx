import React from 'react'

const ChatList = (props) => (
  <ul className="fa-ul">
    {props.chats.map((chat) =>
        <li><i className="fa fa-comment-o fa-li"></i>{chat.receiver.first_name}</li>
    )}
  </ul>
);

export default ChatList
