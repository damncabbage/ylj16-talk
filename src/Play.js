// module App.Play
"use strict";

// Tone-playing helper
var playFreq = function(freq) {
  var duration = 0.5;
  var attack   = 0.3;
  var release  = 0.1;
  var volume   = 1;

  var AudioContext = window.AudioContext || window.webkitAudioContext;
  var ac = new AudioContext();

  var oscillator = ac.createOscillator();

  oscillator.frequency.value = freq;
  var gainNode = ac.createGain();
  gainNode.gain.linearRampToValueAtTime(volume, ac.currentTime + attack);
  gainNode.gain.setTargetAtTime(0, ac.currentTime + attack, release);

  // Connect
  oscillator.connect(gainNode);
  gainNode.connect(ac.destination);

  // Play
  oscillator.start(0);
  oscillator.stop(duration + 1);
  oscillator.onended = function(){
    // Disconnect
    oscillator.disconnect();
    ac.close();
  };
};

exports = {}
