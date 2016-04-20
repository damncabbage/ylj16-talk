// module App.Game
"use strict";

var leftPad = require('left-pad');

exports.leftPad = function(str) {
  return function(len) {
    return function(chr) {
      return leftPad(str, len, chr);
    }
  }
}
