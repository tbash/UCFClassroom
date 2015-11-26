import React, { Component, PropTypes } from 'react'
import { Link } from 'react-router'

export default class Course extends Component {

  render() {
    const { course } = this.props
    const { name, description } = course

    return (
      <div className="Course">
        <h3>
            {name}
        </h3>
        {description &&
          <p>{description}</p>
        }
      </div>
    )
  }
}

Course.propTypes = {
  course: PropTypes.shape({
    name: PropTypes.string.isRequired,
    description: PropTypes.string
  }).isRequired
}
