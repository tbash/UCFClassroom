import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),

  actions: {
    create: function() {
      // TODO create emailRegex
      var emailRegex = /\A([\w\.%\+\-]+)(@knights\.ucf\.edu\z)|(@ucf\.edu\z)/i;
      var passwordRegex = /^[A-Za-z0-9_-]{8,18}$/;
      var email = this.get('email').toLowerCase();
      var password = this.get('password');
      var password_confirmation = this.get('password_confirmation');
      if (passwordRegex.test(password) === false) {
        this.notifications.addNotification({
          message: 'password is not valid',
          type: 'error',
          autoClear: true,
          clearDuration: 4000
        });
      }
      if (emailRegex.test(email) === false) {
        this.notifications.addNotification({
          message: 'you need a valid UCF email to register',
          type: 'error',
          autoClear: true,
          clearDuration: 4000
        });
      }
      else if (password !== password_confirmation) {
        this.notifications.addNotification({
          message: 'password confirmation does not match password',
          type: 'error',
          autoClear: true,
          clearDuration: 3000
        });
      }
      else {
        var user = this.store.createRecord('user', {
          email: email,
          password: password,
          password_confirmation: password_confirmation
        });
        var self = this;
        user.save().then(function() {
          self.get('session').authenticate('authenticator:custom', email.substring(0, email.indexOf('@')), password).then(function(){
            self.notifications.addNotification({
              message: 'you have successfully signed up with ' + email,
              type: 'success',
              autoClear: true,
              clearDuration: 3000
            });
          });
          }, function(error) {
            self.notifications.addNotification({
              message: 'that email is already in use',
              type: 'error',
              autoClear: true,
              clearDuration: 3000
          });
        });
      }
    }
  }
});
