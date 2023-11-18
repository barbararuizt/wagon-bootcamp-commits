// TODO: write your code here!
const boxes = document.querySelectorAll(".clickable");

// boxes.forEach(box => {
//   box.addEventListener("click", (event) => {
//     event.currentTarget.classList.toggle("active")
//   })
// })

const highlight = (event) => {
  event.currentTarget.classList.toggle("active");
};

const chooseBox = (box) => {
  box.addEventListener('click', highlight);
};

boxes.forEach(chooseBox);
