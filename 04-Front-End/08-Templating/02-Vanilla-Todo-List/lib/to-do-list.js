const todos = [
  { title: "Code a to-do list", done: false },
  { title: "Eat breakfast", done: true },
  { title: "Do some exercise", done: false },
  { title: "Water the plants", done: true }
];

const template = document.getElementById("todoItemTemplate");
const body = document.querySelector("body");

todos.forEach((task) => {
  const clone = template.content.cloneNode(true);
  clone.querySelector('input').checked = task.done;
  clone.querySelector('.title').textContent = task.title;
  body.appendChild(clone);
});


// TODO: Use the template in the `index.html` to dynamically generate a list based on `todos` array
