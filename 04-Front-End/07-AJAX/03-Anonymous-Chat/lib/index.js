const batch = 1; // change to your own batch id
const baseUrl = "https://wagon-chat.herokuapp.com/1374/messages";

const send = (event) => {
  event.preventDefault();
  const comment = document.getElementById("your-message").value;
  const user = document.getElementById("your-name").value;
  const message = { author: `${user}`, content: `${comment}` };

  fetch(baseUrl, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(message),
  });
};


const receive = (event) => {
  event.preventDefault();
  fetch(baseUrl)
    .then(response => response.json())
    .then((data) => {
      const msgs = data.messages;
      const messageList = document.getElementById("messages");
      messageList.innerHTML = msgs.map(message => `<li>${message.author} says: ${message.content}</li>`).join('');
    });
};

const sending = document.getElementById("comment-form");
sending.addEventListener("submit", send);
sending.addEventListener("submit", receive);

const updating = document.getElementById("refresh");
updating.addEventListener("click", receive);
