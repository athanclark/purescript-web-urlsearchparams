"use strict";

exports.newImpl = function newImpl (x) {
    return new URLSearchParams(x);
};

exports.appendImpl = function appendImpl (x,k,v) {
    x.append(k,v);
};

exports.setImpl = function setImpl (x,k,v) {
    x.set(k,v);
};

exports.deleteImpl = function deleteImpl (x,k) {
    x.delete(k);
};

exports.getImpl = function getImpl (x,k) {
    return x.get(k);
};

exports.getAllImpl = function getAllImpl (x,k) {
    return x.getAll(k);
};

exports.hasImpl = function hasImpl (x,k) {
    return x.has(k);
};

exports.entriesImpl = function entriesImpl (x) {
    return x.entries();
};

exports.keysImpl = function keysImpl (x) {
    return x.keys();
};

exports.valuesImpl = function valuesImpl (x) {
    return x.values();
};

exports.sortImpl = function sortImpl (x) {
    x.sort();
};

exports.toStringImpl = function toStringImpl (x) {
    return x.toString();
};

exports.forEachImpl = function forEachImpl (x,f) {
    x.forEach(f);
};
