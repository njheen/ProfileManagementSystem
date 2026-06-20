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
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="alert alert-success text-center shadow p-4 mx-auto" style="max-width: 650px;" role="alert">
            <h4 class="alert-heading fw-bold"><i class="fas fa-check-circle"></i> Profile Successfully Created!</h4>
            <p class="mb-0">The record has been successfully stored into Java DB (Apache Derby).</p>
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