<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.sujal.model.Provider" %>
<%
    List<Provider> providers = (List<Provider>) request.getAttribute("providerList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Partner Applications &mdash; QuickFixHub Admin</title>
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
                <span class="qh-hero-tag" style="color: var(--amber);">Partner Verification</span>
                <h1 class="editorial-heading" style="font-size: 2.1rem;">Pending Partner Approvals</h1>
                <p class="text-muted" style="font-size: 0.95rem; margin-top: 0.25rem;">
                    Service provider applications requiring credential verification and approval
                </p>
            </div>
            <div style="display: flex; gap: 0.65rem;">
                <a href="${pageContext.request.contextPath}/viewApprovedProviders" class="qh-btn qh-btn-secondary qh-btn-sm">
                    <i class="fas fa-certificate"></i> View Approved
                </a>
                <a href="${pageContext.request.contextPath}/disapprovedProvider" class="qh-btn qh-btn-secondary qh-btn-sm">
                    <i class="fas fa-ban"></i> View Disapproved
                </a>
            </div>
        </div>

        <div class="qh-card">
            <div class="qh-card-header">
                <div style="display: flex; align-items: center; gap: 0.65rem;">
                    <i class="fas fa-clock" style="color: var(--amber); font-size: 1.15rem;"></i>
                    <h3 class="editorial-heading" style="font-size: 1.25rem;">Applications Awaiting Review</h3>
                </div>
            </div>

            <div class="qh-table-container">
                <table class="qh-table" id="pendingTable">
                    <thead>
                        <tr>
                            <th>Partner Name</th>
                            <th>Contact</th>
                            <th>Email</th>
                            <th>City</th>
                            <th>Trade Category</th>
                            <th>Specialization</th>
                            <th>Status</th>
                            <th>Verification Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            boolean hasPending = false;
                            if (providers != null && !providers.isEmpty()) {
                                for (Provider p : providers) {
                                    if ("pending".equalsIgnoreCase(p.getStatus())) {
                                        hasPending = true;
                        %>
                        <tr id="row_<%= p.getContact() %>">
                            <td>
                                <div style="display: flex; align-items: center; gap: 0.65rem;">
                                    <div style="width: 34px; height: 34px; border-radius: var(--radius-sm); background: var(--amber-light); color: var(--amber); display: flex; align-items: center; justify-content: center; font-size: 0.85rem; font-weight: 700;">
                                        <%= p.getName() != null && !p.getName().isEmpty() ? p.getName().substring(0, 1).toUpperCase() : "P" %>
                                    </div>
                                    <span style="font-weight: 700; color: var(--charcoal);"><%= p.getName() %></span>
                                </div>
                            </td>
                            <td>
                                <a href="tel:<%= p.getContact() %>" style="color: var(--terracotta); text-decoration: none; font-weight: 600; font-size: 0.88rem;">
                                    <i class="fas fa-phone" style="font-size: 0.78rem;"></i> <%= p.getContact() %>
                                </a>
                            </td>
                            <td><span style="font-size: 0.85rem; color: var(--muted);"><%= p.getEmail() %></span></td>
                            <td>
                                <span style="font-size: 0.88rem;"><i class="fas fa-city" style="color: var(--muted); font-size: 0.78rem;"></i> <%= p.getCity() %></span>
                            </td>
                            <td><strong><%= p.getCategory() %></strong></td>
                            <td><span class="text-muted" style="font-size: 0.85rem;"><%= p.getServiceType() != null ? p.getServiceType() : "-" %></span></td>
                            <td>
                                <span class="qh-badge qh-badge-amber">
                                    <i class="fas fa-hourglass-half"></i> <%= p.getStatus() %>
                                </span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 0.4rem;">
                                    <form onsubmit="handleStatusUpdate(event, this, 'approved');" style="display:inline;">
                                        <input type="hidden" name="contact" value="<%= p.getContact() %>">
                                        <button type="submit" class="qh-btn qh-btn-sage qh-btn-sm">
                                            <i class="fas fa-check"></i> Approve
                                        </button>
                                    </form>
                                    <form onsubmit="handleStatusUpdate(event, this, 'disapproved');" style="display:inline;">
                                        <input type="hidden" name="contact" value="<%= p.getContact() %>">
                                        <button type="submit" class="qh-btn qh-btn-brick qh-btn-sm">
                                            <i class="fas fa-times"></i> Disapprove
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <%
                                    }
                                }
                            }
                            if (!hasPending) {
                        %>
                        <tr id="emptyRow">
                            <td colspan="8">
                                <div class="qh-empty-state">
                                    <i class="fas fa-circle-check qh-empty-icon" style="color: var(--sage);"></i>
                                    <h3 class="qh-empty-title">All Caught Up!</h3>
                                    <p class="qh-empty-desc">There are no pending partner registrations requiring verification right now.</p>
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

    <script>
        function handleStatusUpdate(event, form, status) {
            event.preventDefault();
            const contact = form.querySelector('input[name="contact"]').value;
            const row = form.closest('tr');

            fetch('updateProviderStatus', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'contact=' + encodeURIComponent(contact) + '&status=' + encodeURIComponent(status)
            })
            .then(response => {
                if (response.ok) {
                    row.style.transition = 'all 0.3s ease';
                    row.style.opacity = '0';
                    row.style.transform = 'translateX(20px)';
                    setTimeout(() => {
                        row.remove();
                        const tbody = document.querySelector('#pendingTable tbody');
                        if (tbody && tbody.querySelectorAll('tr').length === 0) {
                            tbody.innerHTML = '<tr><td colspan="8"><div class="qh-empty-state"><i class="fas fa-circle-check qh-empty-icon" style="color: var(--sage);"><\/i><h3 class="qh-empty-title">All Caught Up!<\/h3><p class="qh-empty-desc">There are no pending partner registrations requiring verification right now.<\/p><\/div><\/td><\/tr>';
                        }
                    }, 300);
                } else {
                    alert('Error updating provider status.');
                }
            })
            .catch(() => alert('Network error occurred.'));
        }
    </script>
</body>
</html>
