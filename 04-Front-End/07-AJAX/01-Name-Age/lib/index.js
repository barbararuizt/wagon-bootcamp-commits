const agifyApiUrl = "https://api.agify.io/";

const displayAge = (event) => {
  event.preventDefault();
  const firstName = document.getElementById("first-name").value;
  // https://api.agify.io?name=THE_FIRST_NAME
  const url = `https://api.agify.io?name=${firstName}`;
  fetch(url)
    .then(response => response.json()) // Wait for the response and parse it as JSON
    .then((data) => {
      const ageContainer = document.getElementById("your-age");
      ageContainer.innerText = `Your estimated age is: ${data.age}!`;
    });
  // TODO: Display your age with an AJAX call instead of the console.log()
};

const form = document.getElementById("fetch-age");
form.addEventListener("submit", displayAge);
