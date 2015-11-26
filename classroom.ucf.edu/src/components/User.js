import React, { Component, PropTypes } from 'react'
import { Link } from 'react-router'

export default class User extends Component {
  render() {
    const { username } = this.props.user

    return (
      <div className="User">
        <Link to={`/${username}`}>
          <h3>
            {username} 
            <span>Data will go here</span>
          </h3>
        </Link>
      </div>
    )
  }
}

User.propTypes = {
  user: PropTypes.shape({
    username: PropTypes.string.isRequired
  }).isRequired
}
