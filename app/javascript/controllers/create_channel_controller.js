import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-post"
export default class extends Controller {
  static targets = ["form", "formDiv"]

  connect() {
  }

  revealForm() {
    this.formDivTarget.classList.toggle("d-none")
  }

  // create(event) {
  //   event.preventDefault()
  //   console.log(this.formTarget.action)

  //   const url = this.formTarget.action
  // }
}
