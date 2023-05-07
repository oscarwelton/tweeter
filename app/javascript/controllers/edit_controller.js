import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="edit"
export default class extends Controller {
  connect() {}
}

console.log("hello from the edit controller!");

const edit = document.getElementById("edit");
const editFrom = document.getElementById("edit-form");
const tweet = document.getElementById("generated-tweet");

edit.addEventListener("click", (event) => {
  event.preventDefault();
  console.log(event);
  tweet.classList.toggle("d-none");
  editFrom.classList.toggle("d-none");
  edit.classList.toggle("d-none");
});
