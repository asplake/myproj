// Generated by CoffeeScript 1.3.3
(function() {
  var Helpers, exports;

  Helpers = (function() {

    function Helpers() {}

    Helpers.dateString = function(date) {
      if (date) {
        return date.toISOString().slice(0, 10);
      } else {
        return '';
      }
    };

    return Helpers;

  })();

  exports = this;

  this.h = Helpers;

}).call(this);