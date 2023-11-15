/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */
/* eslint-disable import/extensions */

import runChallenges from "../spec/list_generator_examiner.js";

const listItem = (content) => {
  return `<li class="list-group-item">${content}</li>`;
  // TODO: return the proper <li> HTML tag with its content (as a string)
};

const unorderedList = (items) => {
  let li = '';
  items.forEach((item) => {
    li += `<li class="list-group-item">${item}</li>`;
  });
  return `<ul class="list-group">${li}</ul>`;
  // TODO: return the proper <ul> markup (as a string)
};

// Do not remove these lines:
if (typeof window === "object") {
  document.addEventListener("DOMContentLoaded", () => {
    // TODO: call unorderedList() passing the right element
    // TODO: display the list in the browser
  });
}

runChallenges(listItem, unorderedList); // Do not remove.
export { listItem, unorderedList };
