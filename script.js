// Function to validate the appointment form
function validateForm() {
    var currentDate = new Date();
    var userDate = new Date(document.getElementById('appointment_date').value);
    var phone = document.getElementById("phone").value;
    var timeInput = document.getElementById('appointment_time').value;

    // Validate appointment date
    if (userDate < currentDate) {
        document.getElementById("dateError").innerHTML = "The appointment date must be in the future!";
        return false;
    } else {
        document.getElementById("dateError").innerHTML = "";
    }

    // Validate phone number
    if (phone.length !== 10 || !/^\d+$/.test(phone)) {
        document.getElementById("phoneError").innerHTML = "Phone number must be 10 digits and contain numbers only.";
        return false;
    } else {
        document.getElementById("phoneError").innerHTML = "";
    }

    // Validate appointment time
    if (!timeInput || timeInput.trim() === "") {
        alert('Please select a time.'); // Display an error message
        return false; // Prevent the form from being submitted
    }

    // Allow form submission if all validations pass
    return true;
}

// Function to handle the selection of appointment time
function selectTime(selectedLi) {
    var lis = document.querySelectorAll('#available_times li');
    lis.forEach(function (li) {
        li.style.backgroundColor = ''; // Reset background color
    });
    selectedLi.style.backgroundColor = 'lightgreen'; // Set background color of the selected li
    document.getElementById('appointment_time').value = selectedLi.textContent; // Set the appointment time value
}

// Function to get available times for the selected date
function getAvailableTimes() {
    var selectedDate = document.getElementById("appointment_date").value;
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var availableTimes = JSON.parse(xhr.responseText);
                updateAvailableTimes(availableTimes);
            } else {
                console.error('Error: ' + xhr.status);
            }
        }
    };
    xhr.open("GET", "get_available_times.php?date=" + selectedDate, true);
    xhr.send();
}

// Function to update the available times list
function updateAvailableTimes(availableTimes) {
    var ulElement = document.getElementById("available_times");
    ulElement.innerHTML = ""; // Clear the existing list
    if (availableTimes.length === 0) {
        ulElement.innerHTML = "<li>No available times for the selected date.</li>";
    } else {
        availableTimes.forEach(function (time) {
            var liElement = document.createElement("li");
            liElement.textContent = time;
            liElement.addEventListener('click', function () {
                selectTime(this); // Pass the clicked li element to selectTime function
            });
            ulElement.appendChild(liElement);
        });
    }
}

// Event listener to clear the appointment time when the date changes
document.addEventListener('DOMContentLoaded', function () {
    const dateInput = document.getElementById('appointment_date');
    dateInput.addEventListener('input', function () {
        const timeInput = document.getElementById('appointment_time');
        timeInput.value = ''; // Clear the value of the time input field
    });
});

// Event listener to prevent selecting Friday for appointments
document.addEventListener('DOMContentLoaded', function () {
    const dateInput = document.getElementById('appointment_date');
    dateInput.addEventListener('input', function () {
        const selectedDate = new Date(this.value);
        const dayOfWeek = selectedDate.getDay(); // 0 is Sunday, 1 is Monday, etc.
        if (dayOfWeek === 5) { // 5 is Friday
            alert('Friday is not available for appointments. Please choose another date.');
            this.value = ''; // Clear the input
        }
    });
});

// Event listener to format the selected appointment time
document.addEventListener('DOMContentLoaded', function () {
    const timeInput = document.getElementById('appointment_time');
    timeInput.addEventListener('change', function () {
        const timeParts = this.value.split(":");
        const formattedTime = timeParts[0] + ":00";
        this.value = formattedTime;
    });
});
