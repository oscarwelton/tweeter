import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="count"
export default class extends Controller {
  connect() {
  }
}

console.log("hello from the character counter controller!")

// addEventListener("keyup", (event) => {
//   const tweet = document.getElementById("generated-tweet");
//   const count = document.getElementById("count");
//   let tweetLength = tweet.innerText.length;
//   console.log(tweetLength)
//   count.value = tweetLength;
//   if (tweetLength < 280) {
//     count.classList.remove("d-none");
//   } else {
//     count.classList.add("d-none");
//   }
// });
