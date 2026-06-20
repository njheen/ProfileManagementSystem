<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProfileBean"%>
<%
    ProfileBean p = (ProfileBean) request.getAttribute("profile");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2a114b 0%, #4a1c40 50%, #682145 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 15px;
            margin: 0;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.96);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 650px;
            overflow: hidden;
        }

        .card-header-custom {
            background: linear-gradient(135deg, #4a1c40, #682145);
            color: white;
            text-align: center;
            padding: 25px;
            border-bottom: 5px solid #f1c40f;
        }

        .card-header-custom h3 {
            margin: 0;
            font-weight: 700;
            font-size: 24px;
        }

        .form-label {
            font-weight: 600;
            color: #2a114b;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 2px solid #e1e5eb;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #f1c40f;
            background-color: #ffffff;
        }

        .btn-custom-save {
            background-color: #682145;
            color: white;
            border: none;
            border-radius: 10px;
            padding: 14px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-custom-save:hover {
            background-color: #4a1c40;
            color: #f1c40f;
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(74, 28, 64, 0.2);
        }

        .btn-custom-back {
            background-color: transparent;
            color: #682145;
            border: 2px solid #682145;
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .btn-custom-back:hover {
            background-color: #682145;
            color: white;
        }
    </style>
</head>
<body>

    <div class="glass-card">
        <div class="card-header-custom">
            <h3><i class="fas fa-user-edit me-2"></i>Update Student Profile</h3>
        </div>
        <div class="card-body p-4 p-md-5">
            <% if(p != null) { %>
            <form action="ProfileServlet" method="POST">
                <input type="hidden" name="action" value="update">
                
                <div class="mb-4">
                    <label class="form-label">Student ID (Read-only)</label>
                    <input type="text" name="studentId" class="form-control" value="<%= p.getStudentID() %>" readonly style="background-color: #e9ecef;">
                </div>
                
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="name" class="form-control" value="<%= p.getName() %>" required>
                    </div>
                    <div class="col-md-6 mb-4">
                        <label class="form-label">Programme</label>
                        <input type="text" name="program" class="form-control" value="<%= p.getProgramme() %>" required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label">Email Address</label>
                    <input type="email" name="email" class="form-control" value="<%= p.getEmail() %>" required>
                </div>
                
                <div class="mb-4">
                    <label class="form-label">Hobbies</label>
                    <input type="text" name="hobbies" class="form-control" value="<%= p.getHobbies() %>">
                </div>

                <div class="mb-5">
                    <label class="form-label">Biography / Introduction</label>
                    <textarea name="bio" class="form-control" rows="4"><%= p.getIntroduction() %></textarea>
                </div>
                
                <div class="d-grid gap-3">
                    <button type="submit" class="btn btn-custom-save btn-lg">
                        <i class="fas fa-save me-2"></i> Save Changes
                    </button>
                    <a href="ProfileServlet?action=view" class="btn btn-custom-back">
                        <i class="fas fa-times me-2"></i> Cancel
                    </a>
                </div>
            </form>
            <% } else { %>
                <div class="alert alert-danger text-center">
                    <i class="fas fa-exclamation-circle"></i> Profile data not found.
                </div>
                <a href="ProfileServlet?action=view" class="btn btn-custom-back">Back to List</a>
            <% } %>
        </div>
    </div>

</body>
</html>