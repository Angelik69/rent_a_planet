// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import { initFlatpickr } from './plugins/init_flatpickr';

// console.log('test');

document.addEventListener('turbo:load', () => {
  initFlatpickr();
})
