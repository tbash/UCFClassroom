const ActionType = {
  
  Authorization: {
    REQUEST: '',
    SUCCESS: '',
    FAILURE: '',
  },

  Label: {
    LOAD_ALL_REQUEST: '',
    LOAD_ALL_SUCCESS: '',
    LOAD_ALL_FAILURE: '',
  },

  Message: {
    SELECT: '',
  },

  Request: {
    START: '',
    ALL_STOPPED: '',
  },
}

const ActionTypeHax: any = ActionType
Object.keys(ActionTypeHax).forEach(category => {
  Object.keys(ActionTypeHax[category]).forEach(actionType => {
    ActionTypeHax[category][actionType] = category + '.' + actionType
  })
})

export default ActionType
