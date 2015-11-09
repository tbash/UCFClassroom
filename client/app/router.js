import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('signup');
  this.resource('courses', function() {
    this.resource('course', { path: '/:course_id' });
  });
});

export default Router;
