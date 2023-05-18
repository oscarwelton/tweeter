import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const tweet = document.getElementById("generated-tweet");
    const count = this.element.querySelector("#character-count");
    if (!count) {
      console.error("Element with ID 'character-count' not found.");
      return;
    }
    const num = tweet.innerText.length;
    count.innerText = num - 7;
  }
}
