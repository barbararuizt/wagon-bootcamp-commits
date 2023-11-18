const showMap = (userInput) => {
  // TODO: Construct the URL (with apiKey & userInput) and make the fetch request to the mapbox API
  const token = "pk.eyJ1IjoiYmFyYmFyYXJ1aXp0IiwiYSI6ImNscDRlaGN0bzE3dWQyanF1M2NnaG5tNHYifQ.4xFGzzsci63Osa_u7YNlcw";
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${userInput}.json?access_token=${token}`;

  fetch(url)
    .then(response => response.json())
    .then((data) => {
      const coord = data.features[0].center;
      const area = document.querySelector("p");
      console.dir(area);
      area.innerText = coord;

      mapboxgl.accessToken = 'pk.eyJ1IjoiYmFyYmFyYXJ1aXp0IiwiYSI6ImNscDRlaGN0bzE3dWQyanF1M2NnaG5tNHYifQ.4xFGzzsci63Osa_u7YNlcw';
      const map = new mapboxgl.Map({
        container: 'map', // container ID
        style: 'mapbox://styles/mapbox/streets-v12', // style URL
        center: coord, // starting position [lng, lat]
        zoom: 9, // starting zoom
      });

      new mapboxgl.Marker()
        .setLngLat(coord)
        .addTo(map);
      // TODO: Insert the info into the DOM
      // - Extract the coordinates from the parsed JSON response (lang, lat)
      // - Display the coordinates in the element where the coordinates will be displayed
      // - Create a map using the Mapbox API and the coordinates
      // - Add a marker to the map at the coordinates
    });
};

// TODO: Select the form element
// TODO: Add event listener to the form that:

function handleSubmit(event) {
  event.preventDefault(); // - Prevents the default form submission behavior
  const value = document.querySelector("#input").value; // - Get the user input // name attribute in html
  showMap(value);
}

const form = document.querySelector("form");
const ubicacion = form.addEventListener('submit', handleSubmit);

// - Calls the showMap function with the user input as an argument
