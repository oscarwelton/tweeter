import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="info"
export default class extends Controller {
  connect() {}
}

console.log("Hello from info_controller.js");
const infoButton = document.querySelector("#info-button");
const infoContainer = document.querySelector("#info-container");
const content = document.querySelector(".content");

infoButton.addEventListener("click", () => {
  if (infoContainer.style.display === "flex") {
    infoContainer.style.display = "none";
    content.style.opacity = "1";
  } else {
    infoContainer.style.display = "flex";
    content.style.opacity = "0.5";
    infoContainer.style.opacity = "1";
    infoButton.style.opacity = "1";
  }

});
