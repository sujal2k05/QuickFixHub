<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.sujal.model.User" %>
<%
    List<User> users = (List<User>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Customer Base &mdash; QuickFixHub Admin</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <header class="qh-navbar" style="border-bottom: 2px solid var(--border);">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/admindashboard" class="qh-brand">
                <div class="qh-brand-mark" style="background: var(--charcoal);"><i class="fas fa-shield-halved"></i></div>
                <div>
                    <span class="qh-brand-title">QuickFixHub</span>
                    <span class="qh-brand-subtitle">Platform Administration</span>
                </div>
            </a>
            <div class="qh-nav-actions">
                <a href="${pageContext.request.contextPath}/admindashboard" class="qh-btn qh-btn-secondary qh-btn-sm">
                    <i class="fas fa-arrow-left"></i> Dashboard
                </a>
            </div>
        </div>
    </header>

    <main class="qh-container">
        <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 2rem; flex-wrap: wrap; gap: 1rem;">
            <div>
                <span class="qh-hero-tag">Platform Accounts</span>
                <h1 class="editorial-heading" style="font-size: 2.1rem;">Registered Customers</h1>
                <p class="text-muted" style="font-size: 0.95rem; margin-top: 0.25rem;">
                    Total Registered Customers: <strong><%= users != null ? users.size() : 0 %></strong> accounts
                </p>
            </div>
        </div>

        <div class="qh-card">
            <div class="qh-card-header">
                <div style="display: flex; align-items: center; gap: 0.65rem;">
                    <i class="fas fa-users" style="color: var(--terracotta); font-size: 1.15rem;"></i>
                    <h3 class="editorial-heading" style="font-size: 1.25rem;">Customer Directory</h3>
                </div>
            </div>

            <div class="qh-table-container">
                <table class="qh-table">
                    <thead>
                        <tr>
                            <th>Customer</th>
                            <th>Contact</th>
                            <th>Email</th>
                            <th>DOB</th>
                            <th>Street Address</th>
                            <th>Area</th>
                            <th>City</th>
                            <th>Pincode</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (users != null && !users.isEmpty()) {
                                for (User u : users) {
                        %>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 0.65rem;">
                                    <div style="width: 32px; height: 32px; border-radius: 50%; background: var(--sand-soft); border: 1px solid var(--border); color: var(--terracotta); display: flex; align-items: center; justify-content: center; font-size: 0.85rem; font-weight: 700;">
                                        <%= u.getName() != null && !u.getName().isEmpty() ? u.getName().substring(0, 1).toUpperCase() : "U" %>
                                    </div>
                                    <span style="font-weight: 600; color: var(--charcoal);"><%= u.getName() %></span>
                                </div>
                            </td>
                            <td>
                                <a href="tel:<%= u.getContact() %>" style="color: var(--terracotta); text-decoration: none; font-weight: 600; font-size: 0.88rem;">
                                    <i class="fas fa-phone" style="font-size: 0.78rem;"></i> <%= u.getContact() %>
                                </a>
                            </td>
                            <td><span style="font-size: 0.85rem; color: var(--muted);"><%= u.getEmail() %></span></td>
                            <td>
                                <span style="font-size: 0.88rem; white-space: nowrap;">
                                    <i class="fas fa-calendar" style="color: var(--muted); font-size: 0.78rem;"></i> <%= u.getDob() %>
                                </span>
                            </td>
                            <td><span class="text-muted" style="font-size: 0.88rem;"><%= u.getAddress() %></span></td>
                            <td><span style="font-size: 0.88rem;"><%= u.getArea() %></span></td>
                            <td><span style="font-size: 0.88rem;"><%= u.getCity() %></span></td>
                            <td><span class="qh-badge qh-badge-sand"><%= u.getPincode() %></span></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="8">
                                <div class="qh-empty-state">
                                    <i class="fas fa-user-slash qh-empty-icon"></i>
                                    <h3 class="qh-empty-title">No Registered Users</h3>
                                    <p class="qh-empty-desc">No customer accounts found in the database.</p>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <%@ include file="common/footer.jsp" %>
</body>
</html>
