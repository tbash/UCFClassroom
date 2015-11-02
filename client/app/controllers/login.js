import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),

  actions: {
    authenticate() {
      var nameRegex = /^[a-z0-9_-]{1,16}$/;
      var passwordRegex = /^[A-Za-z0-9_-]{8,18}$/;
      var name = this.get('name').toLowerCase();
      var password = this.get('password');
      var self = this;
      if (nameRegex.test(name) && passwordRegex.test(password)) {
        this.get('session').authenticate('authenticator:custom', name, password).then(function() {
          self.notifications.addNotification({
            message: 'you have successfully logged in as ' + name,
            type: 'success',
            autoClear: true,
            clearDuration: 3000
          });
        }, function(error) {
          self.notifications.addNotification({
            message: 'that username and password combo does not exist',
            type: 'error',
            autoClear: true,
            clearDuration: 3000
          });
        });
      }
      else {
        this.notifications.addNotification({
          message: 'that username and password combo does not exist',
          type: 'error',
          autoClear: true,
          clearDuration: 3000
        });
      }
    }
  }
});
