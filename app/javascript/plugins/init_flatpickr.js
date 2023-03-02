import flatpickr from "flatpickr"

// console.log('hello');

const initFlatpickr = () => {
  const startDateInput = document.getElementById('reservation_start_date');
  const endDateInput = document.getElementById('reservation_end_date');

  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#planet-reservation-dates').dataset.unavailable)
  endDateInput.disabled = true

  flatpickr(startDateInput, {
    minDate: "today",
    disable: unavailableDates,
    dateFormat: "Y-m-d",
  });

  // console.log('Coucou');

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      disable: unavailableDates,
      dateFormat: "Y-m-d"
      });
    })
  };
};

export { initFlatpickr };
