// TODO: Write your gambling application here.
const cards = document.querySelectorAll(".scratchcard");
let money = document.getElementById("balance").innerText;
money = parseInt(money, 10);

cards.forEach((card) => {
  card.addEventListener("click", (event) => {
    if (money > 0) {
      const won = card.dataset.amount;
      card.innerText = won;
      money = money - 10 + parseInt(won, 10);
      card.dataset.scratched = "true";
      event.currentTarget.classList.add("disabled");
      document.getElementById("balance").innerText = money;
    }
  });
});
