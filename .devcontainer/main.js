/*
All this code is copyright Orteil, 2013-2023.
	-with some help, advice and fixes by Nicholas Laux, Debugbro, Opti, the folks at Playsaurus, and lots of people on reddit, Discord, and the DashNet forums
	-also includes a bunch of snippets found on stackoverflow.com and others
	-want to mod the game? scroll down to the "MODDING API" section
Hello, and welcome to the joyous mess that is main.js. Code contained herein is not guaranteed to be good, consistent, or sane. Most of this is years old at this point and harkens back to simpler, cruder times. In particular I've tried to maintain compatibility with fairly old versions of javascript, which means luxuries such as 'let', arrow functions and string literals are unavailable.
As Cookie Clicker is rife with puns and tricky wordplay, localization was never intended to be possible - but ended up happening anyway as part of the Steam port. As a result, usage of strings is somewhat unorthodox in some places.
Have a nice trip, and stay safe.
Spoilers ahead.
http://orteil.dashnet.org
*/

/*=====================================================================================
MISC HELPER FUNCTIONS
=======================================================================================*/
function l(what) {
  return document.getElementById(what);
}
function choose(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}

function escapeRegExp(str) {
  return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
}
function replaceAll(find, replace, str) {
  return str.replace(new RegExp(escapeRegExp(find), "g"), replace);
}

function cap(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

function romanize(num) {
  if (isNaN(num)) return NaN;
  var digits = String(Number(num)).split(""),
    key = [
      "",
      "C",
      "CC",
      "CCC",
      "CD",
      "D",
      "DC",
      "DCC",
      "DCCC",
      "CM",
      "",
      "X",
      "XX",
      "XXX",
      "XL",
      "L",
      "LX",
      "LXX",
      "LXXX",
      "XC",
      "",
      "I",
      "II",
      "III",
      "IV",
      "V",
      "VI",
      "VII",
      "VIII",
      "IX",
    ],
    roman = "",
    i = 3;
  while (i--) roman = (key[Number(digits.pop()) + i * 10] || "") + roman;
  return Array(Number(digits.join("")) + 1).join("M") + roman;
}

//disable sounds coming from soundjay.com (sorry)
var realAudio =
  typeof Audio !== "undefined"
    ? Audio
    : function () {
        return {};
      }; //backup real audio
Audio = function (src) {
  if (src && src.indexOf("soundjay") > -1) {
    Game.Popup("Sorry, no sounds hotlinked from soundjay.com.");
    this.play = function () {};
  } else return new realAudio(src);
};

if (!Array.prototype.indexOf) {
  Array.prototype.indexOf = function (needle) {
    for (var i = 0; i < this.length; i++) {
      if (this[i] === needle) {
        return i;
      }
    }
    return -1;
  };
}
