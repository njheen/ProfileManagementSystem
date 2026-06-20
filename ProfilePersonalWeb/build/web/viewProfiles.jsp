<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.ProfileBean"%>
<%
    List<ProfileBean> listProfiles = (List<ProfileBean>) request.getAttribute("listProfiles");
    String currentSearch = (String) request.getAttribute("currentSearch");
    String currentFilter = (String) request.getAttribute("currentFilter");
    if(currentSearch == null) currentSearch = "";
    if(currentFilter == null) currentFilter = "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Student Profiles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2a114b 0%, #4a1c40 50%, #682145 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            padding: 40px 15px;
            color: #2a114b;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.96);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            overflow: hidden;
        }

        .card-header-custom {
            background: linear-gradient(135deg, #4a1c40, #682145);
            color: white;
            padding: 25px 30px;
            border-bottom: 5px solid #f1c40f;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-header-custom h4 {
            margin: 0;
            font-weight: 700;
            font-size: 24px;
            letter-spacing: 0.5px;
        }

        .btn-header-back {
            background-color: transparent;
            color: #f1c40f;
            border: 2px solid #f1c40f;
            border-radius: 8px;
            padding: 8px 16px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-header-back:hover {
            background-color: #f1c40f;
            color: #4a1c40;
        }

        .search-panel {
            background-color: #f8f9fa;
            border-radius: 16px;
            padding: 20px;
            margin-bottom: 25px;
            border: 1px solid #e1e5eb;
        }

        .form-control {
            border-radius: 10px;
            padding: 10px 15px;
            border: 2px solid #e1e5eb;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #f1c40f;
            background-color: #ffffff;
        }

        .btn-apply {
            background-color: #682145;
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-apply:hover {
            background-color: #4a1c40;
            color: #f1c40f;
        }

        .btn-reset {
            background-color: #e1e5eb;
            color: #2a114b;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-reset:hover {
            background-color: #ced4da;
        }

        /* Custom Table Styling */
        .table {
            margin-bottom: 0;
        }
        
        .table th {
            background-color: #4a1c40;
            color: white;
            font-weight: 600;
            border-bottom: none;
            padding: 15px;
        }

        .table td {
            vertical-align: middle;
            padding: 15px;
            border-bottom: 1px solid #e1e5eb;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(241, 196, 15, 0.05);
        }

        .badge-program {
            background-color: #f1c40f;
            color: #2a114b;
            font-weight: 700;
            padding: 6px 12px;
            border-radius: 6px;
        }

        .btn-action-edit {
            background-color: transparent;
            color: #682145;
            border: 2px solid #682145;
            border-radius: 8px;
            font-weight: 600;
            padding: 5px 12px;
            transition: all 0.2s ease;
        }

        .btn-action-edit:hover {
            background-color: #682145;
            color: white;
        }

        .btn-action-delete {
            background-color: transparent;
            color: #dc3545;
            border: 2px solid #dc3545;
            border-radius: 8px;
            font-weight: 600;
            padding: 5px 12px;
            transition: all 0.2s ease;
        }

        .btn-action-delete:hover {
            background-color: #dc3545;
            color: white;
        }

        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #6c757d;
        }

        .empty-state i {
            font-size: 48px;
            color: #dee2e6;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <div class="glass-card">
        <div class="card-header-custom">
            <h4><i class="fas fa-users me-2"></i> Registered Student Profiles</h4>
            <a href="menu.html" class="btn-header-back"><i class="fas fa-home me-1"></i> Back to Menu</a>
        </div>
        
        <div class="card-body p-4 p-md-5">
            
            <div class="search-panel">
                <form action="ProfileServlet" method="GET" class="row g-3">
                    <input type="hidden" name="action" value="view">
                    
                    <div class="col-md-5">
                        <div class="input-group">
                            <span class="input-group-text bg-white border-end-0"><i class="fas fa-search text-muted"></i></span>
                            <input type="text" name="searchQuery" class="form-control border-start-0 ps-0" 
                                   placeholder="Search by Student ID or Name..." value="<%= currentSearch %>">
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="input-group">
                            <span class="input-group-text bg-white border-end-0"><i class="fas fa-filter text-muted"></i></span>
                            <input type="text" name="filterProgramme" class="form-control border-start-0 ps-0" 
                                   placeholder="Filter by Programme (e.g. CS230)" value="<%= currentFilter %>">
                        </div>
                    </div>
                    
                    <div class="col-md-3 d-flex gap-2">
                        <button type="submit" class="btn btn-apply w-100">Apply</button>
                        <a href="ProfileServlet?action=view" class="btn btn-reset w-100 text-center d-flex align-items-center justify-content-center text-decoration-none">Reset</a>
                    </div>
                </form>
            </div>

            <div class="table-responsive rounded-3 border">
                <table class="table table-hover align-middle mb-0">
                    <thead>
                        <tr>
                            <th><i class="fas fa-id-card me-2"></i>Student ID</th>
                            <th><i class="fas fa-user me-2"></i>Name</th>
                            <th><i class="fas fa-graduation-cap me-2"></i>Programme</th>
                            <th><i class="fas fa-envelope me-2"></i>Email</th>
                            <th><i class="fas fa-star me-2"></i>Hobbies</th>
                            <th><i class="fas fa-info-circle me-2"></i>Introduction</th>
                            <th class="text-center" style="width: 160px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            if(listProfiles != null && !listProfiles.isEmpty()) {
                                for(ProfileBean p : listProfiles) {
                        %>
                        <tr>
                            <td><strong><%= p.getStudentID() %></strong></td>
                            <td class="fw-semibold"><%= p.getName() %></td>
                            <td><span class="badge-program"><%= p.getProgramme() %></span></td>
                            <td><a href="mailto:<%= p.getEmail() %>" class="text-decoration-none" style="color: #682145;"><%= p.getEmail() %></a></td>
                            <td class="text-muted"><%= p.getHobbies() != null && !p.getHobbies().trim().isEmpty() ? p.getHobbies() : "-" %></td>
                            <td class="text-muted text-truncate" style="max-width: 200px;" title="<%= p.getIntroduction() != null ? p.getIntroduction() : "" %>">
                                <%= p.getIntroduction() != null && !p.getIntroduction().trim().isEmpty() ? p.getIntroduction() : "-" %>
                            </td>
                            <td class="text-center">
                                <div class="d-flex justify-content-center gap-2">
                                    <a href="ProfileServlet?action=editForm&studentId=<%= p.getStudentID() %>" class="btn-action-edit text-decoration-none">
                                        <i class="fas fa-pen"></i>
                                    </a>
                                    <a href="ProfileServlet?action=delete&studentId=<%= p.getStudentID() %>" 
                                       class="btn-action-delete text-decoration-none" 
                                       onclick="return confirm('Are you sure you want to delete the profile for <%= p.getName() %>?');">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <% 
                                }
                            } else { 
                        %>
                        <tr>
                            <td colspan="7">
                                <div class="empty-state">
                                    <i class="fas fa-folder-open"></i>
                                    <h5 class="mt-2 text-dark">No Profiles Found</h5>
                                    <p class="mb-0">There are currently no registered student profiles matching your criteria.</p>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>