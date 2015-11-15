import DS from 'ember-data';

export default DS.ActiveModelAdapter.extend({
  headers: Ember.computed('session.data.authenticated.access_token', function() {
    return {
      API_KEY: this.get("session.data.authenticated.access_token")
    };
  }),
  host: 'http://33.33.33.12:3000',
});
