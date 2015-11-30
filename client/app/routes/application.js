import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';

// this.get('session.data.authenticated.access_token')
export default Ember.Route.extend(ApplicationRouteMixin, {
  actions: {
    invalidateSession() {
      this.get('session').invalidate();
    },
    transitionTo(route) {
      this.transitionTo(route);
    }
  }
});
