import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  schedule: DS.attr(),
  description: DS.attr(),
  instructor: DS.attr()
});
