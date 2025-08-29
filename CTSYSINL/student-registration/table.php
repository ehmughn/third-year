<?php
$conn = new mysqli("localhost", "root", "", "db_student_registration");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id, first_name, middle_name, last_name, birthday, section FROM tbl_students ORDER BY id ASC";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/table.css">
</head>
<body>
    <div class="animated-bg">
        <div class="gradient-overlay"></div>
        <div class="floating-shape shape1"></div>
        <div class="floating-shape shape2"></div>
        <div class="floating-shape shape3"></div>
    </div>
    <div class="table-container">
        <a href="index.php" class="btn btn-outline-light mb-3">&larr; Back to Home</a>
        <h2 class="mb-4" style="color:#4f8cff;">Registered Students</h2>
        <?php if (isset($_GET['registered'])): ?>
            <div class="alert alert-success">Registration successful!</div>
        <?php endif; ?>
        <table class="table table-dark table-striped table-bordered align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>Last Name</th>
                    <th>Birthday</th>
                    <th>Section</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($result && $result->num_rows > 0): ?>
                    <?php while($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['id']) ?></td>
                            <td><?= htmlspecialchars($row['first_name']) ?></td>
                            <td><?= htmlspecialchars($row['middle_name']) ?></td>
                            <td><?= htmlspecialchars($row['last_name']) ?></td>
                            <td><?= htmlspecialchars($row['birthday']) ?></td>
                            <td><?= htmlspecialchars($row['section']) ?></td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr><td colspan="5" class="text-center">No students registered yet.</td></tr>
                <?php endif; ?>
            </tbody>
        </table>
        <a href="register.php" class="btn btn-primary mt-3">Back to Registration</a>
    </div>
</body>
</html>
<?php $conn->close(); ?>
