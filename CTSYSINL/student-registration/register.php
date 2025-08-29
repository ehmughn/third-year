<?php
// Display submitted form data if POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn = new mysqli("localhost","root","","db_student_registration");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $stmt = $conn->prepare("INSERT INTO tbl_students (first_name, middle_name, last_name, birthday, section) VALUES (?, ?, ?, ?, ?)");
    if ($stmt) {
        $stmt->bind_param("sssss",
            $_POST['first_name'],
            $_POST['middle_name'],
            $_POST['last_name'],
            $_POST['birthday'],
            $_POST['section']
        );
        if ($stmt->execute()) {
            header('Location: table.php?registered=1');
            exit();
        } else {
            echo "Error inserting record: " . $stmt->error;
        }
        $stmt->close();
    } else {
        echo "Error preparing statement: " . $conn->error;
    }
    $conn->close();
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
    <div class="animated-bg">
        <div class="gradient-overlay"></div>
        <div class="floating-shape shape1"></div>
        <div class="floating-shape shape2"></div>
        <div class="floating-shape shape3"></div>
    </div>
    <div class="blur-bg"></div>
    <div class="container-fluid d-flex align-items-center justify-content-center" style="height:100vh; min-height:100vh;">
        <form class="registration-form" id="registrationForm" autocomplete="off" method="POST" action="">
            <a href="index.php" class="btn btn-outline-light mb-3">&larr; Back to Home</a>
            <div class="success-message" id="successMessage">
                <i class="fa-solid fa-circle-check me-2"></i>Registration successful!
            </div>
            <div class="mb-4 text-center">
                <h1 class="form-title mb-1">Student Registration</h1>
                <p class="text-secondary mb-0" style="color:#94a3b8!important;">Please fill in the form below to register.</p>
            </div>
            <div class="row mb-4 align-items-center">
                <label for="first_name" class="col-sm-4 col-form-label fw-semibold form-label">
                    First Name <span class="required-asterisk">*</span>
                </label>
                <div class="col-sm-8 input-group">
                    <span class="input-icon"><i class="fa-solid fa-user"></i></span>
                    <input type="text" class="form-control shadow-sm" id="first_name" name="first_name" required placeholder="Enter first name" value="<?php echo htmlspecialchars($_POST['first_name'] ?? ''); ?>">
                </div>
            </div>
            <div class="row mb-4 align-items-center">
                <label for="middle_name" class="col-sm-4 col-form-label fw-semibold form-label">
                    Middle Name
                </label>
                <div class="col-sm-8 input-group">
                    <span class="input-icon"><i class="fa-solid fa-user"></i></span>
                    <input type="text" class="form-control shadow-sm" id="middle_name" name="middle_name" placeholder="Enter middle name" value="<?php echo htmlspecialchars($_POST['middle_name'] ?? ''); ?>">
                </div>
            </div>
            <div class="row mb-4 align-items-center">
                <label for="last_name" class="col-sm-4 col-form-label fw-semibold form-label">
                    Last Name <span class="required-asterisk">*</span>
                </label>
                <div class="col-sm-8 input-group">
                    <span class="input-icon"><i class="fa-solid fa-user"></i></span>
                    <input type="text" class="form-control shadow-sm" id="last_name" name="last_name" required placeholder="Enter last name" value="<?php echo htmlspecialchars($_POST['last_name'] ?? ''); ?>">
                </div>
            </div>
            <div class="row mb-4 align-items-center">
                <label for="birthday" class="col-sm-4 col-form-label fw-semibold form-label">
                    Birthday <span class="required-asterisk">*</span>
                </label>
                <div class="col-sm-8 input-group">
                    <span class="input-icon"><i class="fa-solid fa-cake-candles"></i></span>
                    <input type="date" class="form-control shadow-sm" id="birthday" name="birthday" required value="<?php echo htmlspecialchars($_POST['birthday'] ?? ''); ?>">
                </div>
            </div>
            <div class="row mb-4 align-items-center">
                <label for="section" class="col-sm-4 col-form-label fw-semibold form-label">
                    Section <span class="required-asterisk">*</span>
                </label>
                <div class="col-sm-8 input-group">
                    <span class="input-icon"><i class="fa-solid fa-layer-group"></i></span>
                    <select class="form-select shadow-sm" id="section" name="section" required>
                        <option value="" disabled <?php if(empty($_POST['section'])) echo 'selected'; ?>>Select section</option>
                        <option value="INF231" <?php if(($_POST['section'] ?? '')==='INF231') echo 'selected'; ?>>INF231</option>
                        <option value="INF232" <?php if(($_POST['section'] ?? '')==='INF232') echo 'selected'; ?>>INF232</option>
                        <option value="INF233" <?php if(($_POST['section'] ?? '')==='INF233') echo 'selected'; ?>>INF233</option>
                        <option value="INF234" <?php if(($_POST['section'] ?? '')==='INF234') echo 'selected'; ?>>INF234</option>
                    </select>
                </div>
            </div>
            <div class="d-flex justify-content-end">
                <button type="submit" class="btn btn-primary px-4 py-2 fw-bold rounded-pill shadow">Submit</button>
            </div>
        </form>
    </div>
</body>
<!-- No JS needed for server-side echo -->
</html>