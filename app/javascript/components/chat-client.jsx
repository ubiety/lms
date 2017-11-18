import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'

const ChatClient = new ApolloClient({
  link: new HttpLink({
    credentials: 'same-origin',
    headers: {
      'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
    }
  }),
  cache: new InMemoryCache()
})

export default ChatClient
