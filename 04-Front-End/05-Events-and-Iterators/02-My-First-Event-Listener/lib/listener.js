// TODO: React to a click on the button!
const button = document.getElementById("clickme");
button.addEventListener("click", (event) => {
  event.currentTarget.classList.add("disabled");
  event.currentTarget.innerText = "Bingo!";
  event.currentTarget.play("sound.mp3");
});
