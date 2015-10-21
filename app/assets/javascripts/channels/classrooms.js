//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = Cable.createConsumer(`ws://${window.location.hostname}:28080`);
