import React, { Component, PropTypes } from 'react'
import { connect } from 'react-redux'
import { loadUser, loadStarred } from '../actions'
import User from '../components/User'
import course from '../components/course'
import List from '../components/List'

function loadData(props) {
  const { username } = props
  props.loadUser(username, [ 'name' ])
  props.loadStarred(username)
}

class UserPage extends Component {
  constructor(props) {
    super(props)
    this.rendercourse = this.rendercourse.bind(this)
    this.handleLoadMoreClick = this.handleLoadMoreClick.bind(this)
  }

  componentWillMount() {
    loadData(this.props)
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.username !== this.props.username) {
      loadData(nextProps)
    }
  }

  handleLoadMoreClick() {
    this.props.loadStarred(this.props.username, true)
  }

  rendercourse([ course ]) {
    return (
      <course course={course}
            key={course.name} />
    )
  }

  render() {
    const { user, username } = this.props
    if (!user) {
      return <h1><i>Loading {username}’s profile...</i></h1>
    }

    const { starredcourses, starredPagination } = this.props
    return (
      <div>
        <User user={user} />
        <hr />
        <List renderItem={this.rendercourse}
              items={ starredcourses }
              onLoadMoreClick={this.handleLoadMoreClick}
              loadingLabel={`Loading ${username}’s starred...`}
              {...starredPagination} />
      </div>
    )
  }
}

UserPage.propTypes = {
  username: PropTypes.string.isRequired,
  user: PropTypes.object,
  starredPagination: PropTypes.object,
  starredcourses: PropTypes.array.isRequired,
  loadUser: PropTypes.func.isRequired,
  loadStarred: PropTypes.func.isRequired
}

function mapStateToProps(state) {
  const { username } = state.router.params
  const {
    pagination: { starredByUser },
    entities: { users, courses }
  } = state

  const starredPagination = starredByUser[username] || { ids: [] }
  const starredcourses = starredPagination.ids.map(id => courses[id])

  return {
    username,
    starredcourses,
    starredPagination,
    user: users[username]
  }
}

export default connect(mapStateToProps, {
  loadUser,
  loadStarred
})(UserPage)
