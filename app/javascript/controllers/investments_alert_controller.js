import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  static values = {
    title: String,
    html: String,
    confirmButtonText: String,
    showCancelButton: Boolean,
    cancelButtonText: String
  }

  connect() {
  }

  initSweetalert(event) {
    console.log("Submitted in investment alert stimulus")

    event.preventDefault(); // Prevent the form to be submited after the submit button has been clicked

    Swal.fire({
      title: this.titleValue,
      html: this.htmlValue,
      confirmButtonText: this.confirmButtonTextValue,
      showCancelButton: this.showCancelButtonValue,
      cancelButtonText: this.cancelButtonTextValue,
      reverseButtons: true
    }).then((action) => {
        if (action.isConfirmed) {
          event.target[event.type](); // "submit"
        }
      })
      .catch(event.preventDefault())
  }
}
