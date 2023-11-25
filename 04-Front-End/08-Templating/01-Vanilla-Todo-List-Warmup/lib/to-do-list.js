const todos = [
  { title: "Code a to-do list", done: false },
  { title: "Eat breakfast", done: true },
  { title: "Do some exercise", done: false },
  { title: "Water the plants", done: true }
];

// To-do item HTML 👇
const list = document.getElementById("todosContainer");
let content = "";

todos.forEach((task) => {
  let check = "";
  if (task.done) {
    check = "checked";
  }
  const elem = `<div class="shadow-sm rounded px-4 py-3 mb-2 border d-flex">
    <input class="d-flex form-check-input me-1" type="checkbox" ${check}>
    <div>${task.title}</div>
  </div>`;
  content += elem;
});

list.innerHTML = content;

// TODO: Dynamically generate a list of to-dos based on `todos` array, and display them
