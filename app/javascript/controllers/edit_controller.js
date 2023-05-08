import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="edit"
export default class extends Controller {
  connect() {}
}

console.log("hello from the edit controller!");

const edit = document.getElementById("edit");
const editFrom = document.getElementById("edit-form");
const tweet = document.getElementById("generated-tweet");
const share = document.getElementById("share");

edit.addEventListener("click", (event) => {
  console.log(event);
  event.preventDefault();
  tweet.classList.toggle("d-none");
  share.classList.toggle("d-none");
  editFrom.classList.toggle("d-none");
  edit.classList.toggle("d-none");
});
