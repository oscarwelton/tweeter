import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="info"
export default class extends Controller {
  connect() {}
}

console.log("Hello from info_controller.js");
const infoButton = document.querySelector("#info-button");
const infoContainer = document.querySelector("#info-container");
const content = document.querySelector(".content");
const buttonContainer = document.querySelector("#button-container");
const closeButton = document.getElementById("close-button");

infoButton.addEventListener("click", () => {
    infoContainer.style.display = "flex";
    infoButton.style.display = "none";
    content.style.opacity = "0.5";
    infoContainer.style.opacity = "1";
});

closeButton.addEventListener("click", () => {
  infoButton.style.display = "flex";
  infoContainer.style.display = "none";
  content.style.opacity = "1";
  buttonContainer.style.opacity = "1";
});
