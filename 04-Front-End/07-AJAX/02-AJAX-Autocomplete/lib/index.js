// TODO: Autocomplete the input with AJAX calls.

const displayResults = (event) => {
  event.preventDefault();
  const input = document.getElementById("search").value;
  const url = `https://wagon-dictionary.herokuapp.com/autocomplete/${input}`;
  fetch(url)
    .then(response => response.json()) // Wait for the response and parse it as JSON
    .then((data) => {
      let list = "";
      data.words.forEach((element) => {
        list += `<li>${element}</li>`;
      });

      const results = document.getElementById("results");
      results.innerHTML = list;
    });
};


const container = document.getElementById("container");
container.addEventListener("keyup", displayResults);
