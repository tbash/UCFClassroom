import { CALL_API, Schemas } from '../middleware/api'

export const USER_REQUEST = 'USER_REQUEST'
export const USER_SUCCESS = 'USER_SUCCESS'
export const USER_FAILURE = 'USER_FAILURE'

// Fetches a single user from Github API.
// Relies on the custom API middleware defined in ../middleware/api.js.
function fetchUser(username) {
  return {
    [CALL_API]: {
      types: [ USER_REQUEST, USER_SUCCESS, USER_FAILURE ],
      endpoint: `users/${username}`,
      schema: Schemas.USER
    }
  }
}

// Fetches a single user from Github API unless it is cached.
// Relies on Redux Thunk middleware.
export function loadUser(username, requiredFields = []) {
  return (dispatch, getState) => {
    const user = getState().entities.users[username]
    if (user && requiredFields.every(key => user.hasOwnProperty(key))) {
      return null
    }

    return dispatch(fetchUser(username))
  }
}

export const COURSE_REQUEST = 'COURSE_REQUEST'
export const COURSE_SUCCESS = 'COURSE_SUCCESS'
export const COURSE_FAILURE = 'COURSE_FAILURE'

// Fetches a single coursesitory from Github API.
// Relies on the custom API middleware defined in ../middleware/api.js.
function fetchCourse(fullName) {
  return {
    [CALL_API]: {
      types: [ COURSE_REQUEST, COURSE_SUCCESS, COURSE_FAILURE ],
      endpoint: `courses/${fullName}`,
      schema: Schemas.COURSE
    }
  }
}

// Fetches a single coursesitory from Github API unless it is cached.
// Relies on Redux Thunk middleware.
export function loadCourse(fullName, requiredFields = []) {
  return (dispatch, getState) => {
    const course = getState().entities.courses[fullName]
    if (course && requiredFields.every(key => course.hasOwnProperty(key))) {
      return null
    }

    return dispatch(fetchCourse(fullName))
  }
}

export const STARRED_REQUEST = 'STARRED_REQUEST'
export const STARRED_SUCCESS = 'STARRED_SUCCESS'
export const STARRED_FAILURE = 'STARRED_FAILURE'

// Fetches a page of starred courses by a particular user.
// Relies on the custom API middleware defined in ../middleware/api.js.
function fetchStarred(username, nextPageUrl) {
  return {
    username,
    [CALL_API]: {
      types: [ STARRED_REQUEST, STARRED_SUCCESS, STARRED_FAILURE ],
      endpoint: nextPageUrl,
      schema: Schemas.COURSE_ARRAY
    }
  }
}

// Fetches a page of starred courses by a particular user.
// Bails out if page is cached and user didn’t specifically request next page.
// Relies on Redux Thunk middleware.
export function loadStarred(username, nextPage) {
  return (dispatch, getState) => {
    const {
      nextPageUrl = `users/${username}/starred`,
      pageCount = 0
    } = getState().pagination.starredByUser[username] || {}

    if (pageCount > 0 && !nextPage) {
      return null
    }

    return dispatch(fetchStarred(username, nextPageUrl))
  }
}

export const USERS_REQUEST = 'userS_REQUEST'
export const USERS_SUCCESS = 'userS_SUCCESS'
export const USERS_FAILURE = 'userS_FAILURE'

// Fetches a page of users for a particular course.
// Relies on the custom API middleware defined in ../middleware/api.js.
function fetchUsers(fullName, nextPageUrl) {
  return {
    fullName,
    [CALL_API]: {
      types: [ userS_REQUEST, userS_SUCCESS, userS_FAILURE ],
      endpoint: nextPageUrl,
      schema: Schemas.USER_ARRAY
    }
  }
}

// Fetches a page of users for a particular course.
// Bails out if page is cached and user didn’t specifically request next page.
// Relies on Redux Thunk middleware.
export function loadUsers(fullName, nextPage) {
  return (dispatch, getState) => {
    const {
      nextPageUrl = `courses/${fullName}/users`,
      pageCount = 0
    } = getState().pagination.usersByCourse[fullName] || {}

    if (pageCount > 0 && !nextPage) {
      return null
    }

    return dispatch(fetchUsers(fullName, nextPageUrl))
  }
}

export const RESET_ERROR_MESSAGE = 'RESET_ERROR_MESSAGE'

// Resets the currently visible error message.
export function resetErrorMessage() {
  return {
    type: RESET_ERROR_MESSAGE
  }
}
