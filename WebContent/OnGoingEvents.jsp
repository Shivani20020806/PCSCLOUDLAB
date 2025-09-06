<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.pojo.OnGoingEvents" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ongoing Events</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Ongoing Events</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addEventModal">+ Add Event</button>
    </div>

    <div class="row g-4">
        <%
            List<OnGoingEvents> events = (List<OnGoingEvents>)request.getAttribute("ongoinglist");
            if (events != null && !events.isEmpty()) {
                for (OnGoingEvents ev : events) {
        %>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">
                <img src="<%= request.getContextPath() + "/" + ev.getImage() %>" class="card-img-top" alt="Event Image" style="height:200px;object-fit:cover;">
                <div class="card-body">
                    <h5 class="card-title"><%= ev.getTitle() %></h5>
                    <p class="card-text mb-1"><strong>Time:</strong> <%= ev.getTime() %></p>
                    <p class="card-text mb-1"><strong>Start:</strong> <%= ev.getStartDate() %></p>
                    <p class="card-text"><strong>End:</strong> <%= ev.getEndDate() %></p>
                    
                    <div class="d-flex justify-content-between mt-3">
                <!-- Edit button triggers modal -->
                <button class="btn btn-sm btn-warning" 
                        data-bs-toggle="modal" 
                        data-bs-target="#editEventModal<%=ev.getId()%>">
                    Edit
                </button>

                <!-- Delete button posts to DeleteServlet -->
                <form action="DeleteOnGoingEventServlet" method="post" 
                      onsubmit="return confirm('Are you sure you want to delete this event?');">
                    <input type="hidden" name="id" value="<%=ev.getId()%>">
                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                </form>
            </div>
                </div>
                
            </div>
        </div>
        <!-- Edit Modal for this event -->
<div class="modal fade" id="editEventModal<%=ev.getId()%>" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="UpdateOnGoingEventServlet" method="post" enctype="multipart/form-data">
        <div class="modal-header">
          <h5 class="modal-title">Edit Event</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="id" value="<%=ev.getId()%>">
          <div class="mb-3">
            <label class="form-label">Image (optional)</label>
            <input type="file" name="image" class="form-control">
          </div>
          <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" name="title" class="form-control" value="<%=ev.getTitle()%>">
          </div>
          <div class="mb-3">
            <label class="form-label">Time</label>
            <input type="text" name="time" class="form-control" value="<%=ev.getTime()%>">
          </div>
          <div class="mb-3">
            <label class="form-label">Start Date</label>
            <input type="text" name="startDate" class="form-control" value="<%=ev.getStartDate()%>">
          </div>
          <div class="mb-3">
            <label class="form-label">End Date</label>
            <input type="text" name="endDate" class="form-control" value="<%=ev.getEndDate()%>">
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Update</button>
        </div>
      </form>
    </div>
  </div>
</div>
        <%
                }
            } else {
        %>
        <div class="col-12">
            <div class="alert alert-info text-center">No ongoing events found.</div>
        </div>
        <%
            }
        %>
    </div>
</div>

<!-- Add Event Modal -->
<div class="modal fade" id="addEventModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <form action="AddOnGoingEventServlet" method="post" enctype="multipart/form-data">
  <div class="mb-3">
    <label>Image</label>
    <input type="file" name="image" class="form-control" required>
  </div>
  <div class="mb-3">
    <label>Title</label>
    <input type="text" name="title" class="form-control" required>
  </div>
  <div class="mb-3">
    <label>Time</label>
    <input type="text" name="time" class="form-control" required>
  </div>
  <div class="mb-3">
    <label>Start Date</label>
    <input type="text" name="startDate" class="form-control" required>
  </div>
  <div class="mb-3">
    <label>End Date</label>
    <input type="text" name="endDate" class="form-control" required>
  </div>
  <button type="submit" class="btn btn-success">Save Event</button>
</form>

    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
