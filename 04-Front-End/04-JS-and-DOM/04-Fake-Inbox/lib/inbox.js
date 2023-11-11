/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */
/* eslint-disable import/extensions */

import runChallenges from "../spec/inbox_examiner.js";

const hasNewMessage = () => {
  const num = Math.floor(Math.random() * 6);
  return num === 1 ? true : false; 
  // TODO: return true with a probability of 20%.
};

const newMessage = () => {
  const senders = ['William Shakespear', 'Beyonce', 'Gabriel Garcia Marquez', 'Pedro Paramo', 'Harry Styles']
  const subjects = ['I need a new car battery, help', 'RSVP to my weeding event', 'Pending Payment - OnlyFans', 'I made a new Youtube video!', 'Check out my Linkedin', 'Could you lend me some sugar?', 'I miss you.', 'RSVP to our wedding', 'Lets go to Narnia!']
  // TODO: return a random message as an object with two keys, subject and sender
  let email = {}
  email.sender = senders[Math.floor(Math.random() * 6)]
  email.subject = subjects[Math.floor(Math.random() * 10)]
  return email
};

const appendMessageToDom = (message) => {
  // TODO: append the given message to the DOM (as a new row of `#inbox`)
};

const refresh = () => {
  // TODO: Implement the global refresh logic. If there is a new message,
  //       append it to the DOM. Update the unread counter in title as well.
};

// Do not remove these lines.
if (typeof window === "object") {
  document.addEventListener("DOMContentLoaded", () => {
    setInterval(refresh, 1000); // Every 1 second, the `refresh` function is called.
  });
}

// Checking exercise answers. DO NOT MODIFY THIS LINE.
runChallenges(hasNewMessage, newMessage);
export { hasNewMessage, newMessage };
