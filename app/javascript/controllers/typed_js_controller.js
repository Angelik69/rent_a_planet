import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"
import Typed2 from "typed.js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ['elcome to Rent a Planet'],
      typeSpeed: 40,
      cursorChar: ' ',
    })
  }

  connect() {
    new Typed2(this.element, {
      strings: ['elcome to Rent a Planet'],
      typeSpeed: 40,
      cursorChar: ' ',
    })
  }
}
