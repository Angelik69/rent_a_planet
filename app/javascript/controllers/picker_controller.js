import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="picker"
export default class extends Controller {
  static targets = ['start', 'end']

  connect() {
    console.log('Hi from picker !');
  }

  showLeft() {
    const unavailableDates = JSON.parse(document.querySelector('#planet-reservation-dates').dataset.unavailable)
    flatpickr(this.startTarget, {
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "d-m-Y",
    });
    if (this.startTarget.value != "") {
      this.endTarget.disabled = false
    }
  }

  showRight() {
    const unavailableDates = JSON.parse(document.querySelector('#planet-reservation-dates').dataset.unavailable)
    flatpickr(this.endTarget, {
      dateFormat: "d-m-Y",
      minDate: this.startTarget.value,
      disable: unavailableDates,
    });
  }
}
