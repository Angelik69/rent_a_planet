import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  static targets = ['start', 'end', 'nights', 'nightPrice', 'stayPrice', 'totalPrice']

  connect() {
    console.log('hello');
  }

  change() {
    let nights = 0;
    const price = parseInt(this.nightPriceTarget.textContent, 10);
    if (this.endTarget.value != '') {
      nights = Math.floor((Date.parse(this.endTarget.value) - Date.parse(this.startTarget.value)) / 86400000)
    }
    this.nightsTarget.textContent = nights;
    this.stayPriceTarget.textContent = nights * price;
    this.totalPriceTarget.textContent = nights * price + 150000
  }
}
