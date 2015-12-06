import React, { Component, PropTypes } from 'react'
import { connect } from 'react-redux'
import { loadCourse, loadUsers } from '../actions'
import Course from '../components/Course'
import User from '../components/User'
import List from '../components/List'

function loadData(props) {
  const { name } = props
  props.loadCourse(name, [ 'description' ])
  props.loadUsers(name)
}

class CoursesPage extends Component {
  constructor(props) {
    super(props)
    this.renderUser = this.renderUser.bind(this)
    this.handleLoadMoreClick = this.handleLoadMoreClick.bind(this)
  }

  componentWillMount() {
    loadData(this.props)
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.name !== this.props.name) {
      loadData(nextProps)
    }
  }

  handleLoadMoreClick() {
    this.props.loadUsers(this.props.name, true)
  }

  renderUser(user) {
    return (
      <User user={user}
            key={user.username} />
    )
  }

  render() {
    const { course, name } = this.props
    if (!course) {
      return <h1><i>Loading {name} details...</i></h1>
    }

    const { users, usersPagination } = this.props
    return (
      <div>
        <Course course={course} />
        <hr />
        <List renderItem={this.renderUser}
              items={users}
              onLoadMoreClick={this.handleLoadMoreClick}
              loadingLabel={`Loading users of ${name}...`}
              {...usersPagination} />
      </div>
    )
  }
}

CoursesPage.propTypes = {
  course: PropTypes.object,
  name: PropTypes.string.isRequired,
  users: PropTypes.array.isRequired,
  usersPagination: PropTypes.object,
  loadCourse: PropTypes.func.isRequired,
  loadUsers: PropTypes.func.isRequired
}

function mapStateToProps(state) {
  const { username, name } = state.router.params
  const {
    pagination: { usersByCourse },
    entities: { users, courses }
  } = state

  const title = `${username}/${name}`
  const usersPagination = usersByCourse[name] || { ids: [] }
  const allUsers = usersPagination.ids.map(id => users[id])

  return {
    title,
    name,
    allUsers,
    usersPagination,
    course: courses[name]
  }
}

export default connect(mapStateToProps, {
  loadCourse,
})(CoursesPage)
