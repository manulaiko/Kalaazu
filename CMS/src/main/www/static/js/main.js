String.prototype.wrap = function (length, ellipses = '...') {
  if (this.length < length + ellipses.length) {
    return this.toString();
  }

  return this.substr(0, length) + ellipses;
};
