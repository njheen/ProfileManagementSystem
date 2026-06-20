<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProfileBean"%>
<%
    // Mengambil objek JavaBean (Model) yang dihantar daripada ProfileServlet
    ProfileBean profile = (ProfileBean) request.getAttribute("savedProfile");
%>
<!DOCTYPE html>
<html lang="ms">
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/all.min.css" rel="stylesheet">
    
<style>
    /* 1. Global Background */
    body {
        background: linear-gradient(135deg, #2a114b 0%, #4a1c40 50%, #682145 100%) !important;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0;
        padding: 40px 15px;
    }

    /* 2. Overriding the existing Card */
    .card {
        background: rgba(255, 255, 255, 0.96) !important;
        backdrop-filter: blur(20px);
        border-radius: 24px !important;
        border: 1px solid rgba(255, 255, 255, 0.3) !important;
        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4) !important;
        overflow: hidden;
        border: none !important;
    }

    /* 3. Header Styling */
    .card-header {
        background: linear-gradient(135deg, #4a1c40, #682145) !important;
        color: white !important;
        text-align: center;
        padding: 25px !important;
        border-bottom: 5px solid #f1c40f !important;
    }

    /* 4. Table Styling within the card */
    .table {
        margin-bottom: 0 !important;
        color: #2a114b;
    }

    .table th {
        width: 30%;
        background-color: #f8f9fa;
        color: #682145;
        font-weight: 700;
        border-right: 1px solid #e1e5eb;
    }

    /* 5. Footer / Button Cleanup */
    .card-footer {
        background: white !important;
        border-top: none !important;
        padding: 20px !important;
    }

    .btn {
        border-radius: 8px !important;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .btn:hover {
        transform: translateY(-2px);
    }
    
    /* Responsive adjustment for small screens */
    @media (max-width: 576px) {
        .table th { width: 40%; }
    }
</style>
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="alert alert-success text-center shadow p-4 mx-auto" style="max-width: 650px;" role="alert">
            <h4 class="alert-heading fw-bold"><i class="fas fa-check-circle"></i> Profile Successfully Created!</h4>
            <p class="mb-0">The record has been successfully saved!.</p>
        </div>
        
        <% if (profile != null) { %>
        <div class="card shadow mx-auto mt-4" style="max-width: 650px;">
            <div class="card-header bg-dark text-white d-flex align-items-center">
                <i class="fas fa-user-check me-2"></i>
                <h5 class="mb-0 fw-bold">Submitted Student Information</h5>
            </div>
            <div class="card-body p-0">
                <table class="table table-striped table-bordered mb-0 align-middle">
                    <tr>
                        <th class="bg-light ps-4" style="width: 30%;">Student ID</th>
                        <td class="ps-4 fw-bold text-primary"><%= profile.getStudentID() %></td>
                    </tr>
                    <tr>
                        <th class="bg-light ps-4">Full Name</th>
                        <td class="ps-4"><%= profile.getName() %></td>
                    </tr>
                    <tr>
                        <th class="bg-light ps-4">Programme</th>
                        <td class="ps-4"><span class="badge bg-secondary px-3 py-2"><%= profile.getProgramme() %></span></td>
                    </tr>
                    <tr>
                        <th class="bg-light ps-4">Email Address</th>
                        <td class="ps-4 text-decoration-underline text-muted"><%= profile.getEmail() %></td>
                    </tr>
                    <tr>
                        <th class="bg-light ps-4">Hobbies</th>
                        <td class="ps-4"><%= (profile.getHobbies() != null && !profile.getHobbies().trim().isEmpty()) ? profile.getHobbies() : "-" %></td>
                    </tr>
                    <tr>
                        <th class="bg-light ps-4">Biography / Intro</th>
                        <td class="ps-4 text-wrap py-3" style="max-width: 400px; white-space: pre-line;"><%= (profile.getIntroduction() != null && !profile.getIntroduction().trim().isEmpty()) ? profile.getIntroduction() : "-" %></td>
                    </tr>
                </table>
            </div>
            <div class="card-footer bg-white text-center py-3">
                <a href="index.html" class="btn btn-primary btn-sm me-1">
                    <i class="fas fa-plus"></i> Add New Record
                </a>
                <a href="ProfileServlet?action=view" class="btn btn-success btn-sm me-1">
                    <i class="fas fa-list"></i> View All Records
                </a>
                <a href="menu.html" class="btn btn-secondary btn-sm">
                    <i class="fas fa-home"></i> Main Menu
                </a>
            </div>
        </div>
        <% } else { %>
        <div class="alert alert-warning text-center mx-auto mt-4" style="max-width: 650px;">
            <i class="fas fa-exclamation-triangle"></i> Tiada objek profil ditemui. Sila hantar borang pendaftaran dengan betul.
        </div>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>