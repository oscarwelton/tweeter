import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="live-count"
export default class extends Controller {
  connect() {
    const counter = document.getElementById("live-count");
    const length = document.getElementById("tweet_generated_tweet").value.length;
    counter.innerText = length;

    if (length === 280) {
      counter.style.color = "red";
    }

    addEventListener("keyup", (event) => {
      console.log(event);
      const length = document.getElementById("tweet_generated_tweet").value.length;
      counter.innerText = length;

      if (length === 280) {
        counter.style.color = "red";
      } else {
        counter.style.color = "green";
      }
    });

    addEventListener("DOMContentLoaded", (event) => {
      const length = document.getElementById("tweet_generated_tweet").value.length;
      counter.innerText = length;
    });
  }
}
