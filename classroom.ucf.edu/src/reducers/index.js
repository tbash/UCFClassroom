import * as ActionTypes from '../actions'
import merge from 'lodash/object/merge'
import paginate from './paginate'
import { routerStateReducer as router } from 'redux-router'
import { combineReducers } from 'redux'

// Updates an entity cache in response to any action with response.entities.
function entities(state = { users: {}, courses: {} }, action) {
  if (action.response && action.response.entities) {
    return merge({}, state, action.response.entities)
  }

  return state
}

// Updates error message to notify about the failed fetches.
function errorMessage(state = null, action) {
  const { type, error } = action

  if (type === ActionTypes.RESET_ERROR_MESSAGE) {
    return null
  } else if (error) {
    return action.error
  }

  return state
}

// Updates the pagination data for different actions.
const pagination = combineReducers({
  courseByUser: paginate({
    mapActionToKey: action => action.username,
    types: [
      ActionTypes.COURSE_REQUEST,
      ActionTypes.COURSE_SUCCESS,
      ActionTypes.COURSE_FAILURE
    ]
  }),
  usersByCourse: paginate({
    mapActionToKey: action => action.name,
    types: [
      ActionTypes.USERS_REQUEST,
      ActionTypes.USERS_SUCCESS,
      ActionTypes.USERS_FAILURE
    ]
  })
})

const rootReducer = combineReducers({
  entities,
  pagination,
  errorMessage,
  router
})

export default rootReducer
