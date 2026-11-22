<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.sujal.model.OrderService" %>
<%
    List<OrderService> orders = (List<OrderService>) request.getAttribute("orders");
    String providerName = (String) request.getAttribute("provider");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Assigned Orders &mdash; QuickFixHub Partner</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <header class="qh-navbar">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/providerDashboard" class="qh-brand">
                <div class="qh-brand-mark"><i class="fas fa-hammer"></i></div>
                <div>
                    <span class="qh-brand-title">QuickFixHub</span>
                    <span class="qh-brand-subtitle">Partner Operations</span>
                </div>
            </a>
            <div class="qh-nav-actions">
                <a href="${pageContext.request.contextPath}/providerDashboard" class="qh-btn qh-btn-secondary qh-btn-sm">
                    <i class="fas fa-arrow-left"></i> Dashboard
                </a>
            </div>
        </div>
    </header>

    <main class="qh-container">
        <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 2rem; flex-wrap: wrap; gap: 1rem;">
            <div>
                <span class="qh-hero-tag">Orders History</span>
                <h1 class="editorial-heading" style="font-size: 2.1rem;">All Assigned Service Orders</h1>
                <p class="text-muted" style="font-size: 0.95rem; margin-top: 0.25rem;">
                    Service requests booked under <strong><%= providerName != null ? providerName : "Your Business Account" %></strong>
                </p>
            </div>
        </div>

        <div class="qh-card">
            <div class="qh-card-header">
                <div style="display: flex; align-items: center; gap: 0.65rem;">
                    <i class="fas fa-list-check" style="color: var(--terracotta); font-size: 1.15rem;"></i>
                    <h3 class="editorial-heading" style="font-size: 1.25rem;">Assigned Job Requests</h3>
                </div>
                <div class="text-muted" style="font-size: 0.85rem;">
                    Accept to confirm appointment or decline if unavailable
                </div>
            </div>

            <div class="qh-table-container">
                <table class="qh-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer</th>
                            <th>Contact</th>
                            <th>Email</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Service Title</th>
                            <th>Description</th>
                            <th>Current Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (orders != null && !orders.isEmpty()) {
                                for (OrderService order : orders) {
                                    String st = order.getStatus() != null ? order.getStatus().toLowerCase() : "pending";
                        %>
                        <tr>
                            <td>
                                <span style="font-family: var(--font-serif); font-size: 1.05rem; font-weight: 700; color: var(--charcoal);">
                                    #<%= order.getId() %>
                                </span>
                            </td>
                            <td>
                                <span style="font-weight: 600; color: var(--charcoal); display: block;"><%= order.getUserName() %></span>
                            </td>
                            <td>
                                <a href="tel:<%= order.getUserContact() %>" style="color: var(--terracotta); text-decoration: none; font-weight: 600; font-size: 0.88rem;">
                                    <i class="fas fa-phone" style="font-size: 0.78rem;"></i> <%= order.getUserContact() %>
                                </a>
                            </td>
                            <td><span style="font-size: 0.85rem; color: var(--muted);"><%= order.getEmail() %></span></td>
                            <td>
                                <span style="font-size: 0.88rem; white-space: nowrap;">
                                    <i class="fas fa-calendar-day" style="color: var(--muted); font-size: 0.78rem;"></i> <%= order.getDate() %>
                                </span>
                            </td>
                            <td>
                                <span style="font-size: 0.88rem; white-space: nowrap;">
                                    <i class="fas fa-clock" style="color: var(--muted); font-size: 0.78rem;"></i> <%= order.getTime() %>
                                </span>
                            </td>
                            <td style="font-weight: 600; color: var(--charcoal);"><%= order.getServiceTitle() %></td>
                            <td>
                                <span class="text-muted" style="font-size: 0.85rem; max-width: 220px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
                                    <%= order.getServiceDescription() %>
                                </span>
                            </td>
                            <td>
                                <% if ("approved".equals(st)) { %>
                                    <span class="qh-badge qh-badge-sage"><i class="fas fa-check"></i> Approved</span>
                                <% } else if ("disapproved".equals(st)) { %>
                                    <span class="qh-badge qh-badge-brick"><i class="fas fa-times"></i> Disapproved</span>
                                <% } else { %>
                                    <span class="qh-badge qh-badge-amber"><i class="fas fa-hourglass-half"></i> Pending</span>
                                <% } %>
                            </td>
                            <td>
                                <div style="display: flex; gap: 0.4rem;">
                                    <form action="updateStatus" method="post" style="display:inline;">
                                        <input type="hidden" name="Id" value="<%= order.getId() %>"/>
                                        <input type="hidden" name="newStatus" value="approved"/>
                                        <button class="qh-btn qh-btn-sage qh-btn-sm" type="submit" title="Accept / Approve">
                                            <i class="fas fa-check"></i> Accept
                                        </button>
                                    </form>
                                    <form action="updateStatus" method="post" style="display:inline;">
                                        <input type="hidden" name="Id" value="<%= order.getId() %>"/>
                                        <input type="hidden" name="newStatus" value="disapproved"/>
                                        <button class="qh-btn qh-btn-brick qh-btn-sm" type="submit" title="Decline / Disapprove">
                                            <i class="fas fa-times"></i> Decline
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="10">
                                <div class="qh-empty-state">
                                    <i class="fas fa-calendar-xmark qh-empty-icon"></i>
                                    <h3 class="qh-empty-title">No Orders Found</h3>
                                    <p class="qh-empty-desc">You do not have any customer requests assigned to your account yet.</p>
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
