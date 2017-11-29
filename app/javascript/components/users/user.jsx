import React from 'react';

const User = ({ user }) => {
  return (
    <tr>
      <td>
        <img src={user.avatar.thumb.url} />
      </td>
    </tr>
  )
}
