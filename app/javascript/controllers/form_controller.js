import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  connect() {
  }

  submit(event) {
    console.log("submitted the form!")
  }
}
