"use strict";

export const newImpl = function newImpl (x) {
    return new URLSearchParams(x);
};

export const appendImpl = function appendImpl (x,k,v) {
    x.append(k,v);
};

export const setImpl = function setImpl (x,k,v) {
    x.set(k,v);
};

export const deleteImpl = function deleteImpl (x,k) {
    x.delete(k);
};

export const getImpl = function getImpl (x,k) {
    return x.get(k);
};

export const getAllImpl = function getAllImpl (x,k) {
    return x.getAll(k);
};

export const hasImpl = function hasImpl (x,k) {
    return x.has(k);
};

export const entriesImpl = function entriesImpl (x) {
    return x.entries();
};

export const keysImpl = function keysImpl (x) {
    return x.keys();
};

export const valuesImpl = function valuesImpl (x) {
    return x.values();
};

export const sortImpl = function sortImpl (x) {
    x.sort();
};

export const toStringImpl = function toStringImpl (x) {
    return x.toString();
};

export const forEachImpl = function forEachImpl (x,f) {
    x.forEach(f);
};
