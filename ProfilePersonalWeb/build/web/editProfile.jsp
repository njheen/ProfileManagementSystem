<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProfileBean"%>
<%
    ProfileBean p = (ProfileBean) request.getAttribute("profile");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow mx-auto" style="max-width: 600px;">
            <div class="card-header bg-warning text-dark text-center">
                <h3>Update Student Profile Record</h3>
            </div>
            <div class="card-body p-4">
                <% if(p != null) { %>
                <form action="ProfileServlet" method="POST">
                    <input type="hidden" name="action" value="update">
                    
                    <div class="mb-3">
                        <label class="form-label font-weight-bold">Student ID (Read-only)</label>
                        <input type="text" name="studentId" class="form-control bg-light" value="<%= p.getStudentID() %>" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="name" class="form-control" value="<%= p.getName() %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Programme</label>
                        <input type="text" name="program" class="form-control" value="<%= p.getProgramme() %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email Address</label>
                        <input type="email" name="email" class="form-control" value="<%= p.getEmail() %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Hobbies</label>
                        <input type="text" name="hobbies" class="form-control" value="<%= p.getHobbies() %>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Biography / Introduction</label>
                        <textarea name="bio" class="form-control" rows="3"><%= p.getIntroduction() %></textarea>
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-warning">Save Changes</button>
                        <a href="ProfileServlet?action=view" class="btn btn-outline-secondary">Cancel</a>
                    </div>
                </form>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>