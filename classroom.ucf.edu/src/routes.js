import React from 'react'
import { Route } from 'react-router'
import App from './containers/App'
import UserPage from './containers/UserPage'
import CoursePage from './containers/CoursePage'

export default (
  <Route path="/" component={App}>
    <Route path="/:username/:name"
           component={CoursePage} />
    <Route path="/:username"
           component={UserPage} />
  </Route>
)
