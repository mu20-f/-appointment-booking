<?php
// Include the database connection file
include "Connection.php";

// Validate and sanitize the input date
$date = mysqli_real_escape_string($connection, $_GET['date']);

// SQL query to retrieve available times
$sql = "SELECT time_slots.time
        FROM (
            SELECT '12:00' AS time
            UNION ALL SELECT '13:00'
            UNION ALL SELECT '14:00'
            UNION ALL SELECT '15:00'
            UNION ALL SELECT '16:00'
            UNION ALL SELECT '17:00'
            UNION ALL SELECT '18:00'
            UNION ALL SELECT '19:00'
            UNION ALL SELECT '20:00'
            UNION ALL SELECT '21:00'
        ) AS time_slots
        LEFT JOIN appointments 
        ON time_slots.time = appointments.appointment_time AND appointments.appointment_date = ?
        WHERE appointments.appointment_time IS NULL";

// Prepare and execute the SQL statement
$stmt = mysqli_prepare($connection, $sql);
mysqli_stmt_bind_param($stmt, "s", $date);
mysqli_stmt_execute($stmt);

// Get the result of the SQL query
$result = mysqli_stmt_get_result($stmt);

// Fetch available times and store them in an array
$availableTimes = array();
while ($row = mysqli_fetch_assoc($result)) {
    $availableTimes[] = $row['time']; // Store 'time' in the array
}

// Return the available times as JSON
echo json_encode($availableTimes);

// Close the statement and database connection
mysqli_stmt_close($stmt);
mysqli_close($connection);
?>
