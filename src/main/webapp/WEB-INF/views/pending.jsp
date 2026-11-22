<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.sujal.model.OrderService" %>
<%
    List<OrderService> orders = (List<OrderService>) request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Service Requests &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <header class="qh-navbar">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/userDashboard" class="qh-brand">
                <div class="qh-brand-mark"><i class="fas fa-hammer"></i></div>
                <div>
                    <span class="qh-brand-title">QuickFixHub</span>
                    <span class="qh-brand-subtitle">Crafted Care</span>
                </div>
            </a>
            <div class="qh-nav-actions">
                <a href="${pageContext.request.contextPath}/userDashboard" class="qh-btn qh-btn-secondary qh-btn-sm">
                    <i class="fas fa-arrow-left"></i> Dashboard
                </a>
            </div>
        </div>
    </header>

    <main class="qh-container">
        <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 2rem; flex-wrap: wrap; gap: 1rem;">
            <div>
                <span class="qh-hero-tag">Awaiting Acceptance</span>
                <h1 class="editorial-heading" style="font-size: 2.1rem;">Pending Service Requests</h1>
                <p class="text-muted" style="font-size: 0.95rem; margin-top: 0.25rem;">
                    Service bookings waiting for assigned craftspeople to review and confirm
                </p>
            </div>
            <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-primary">
                <i class="fas fa-calendar-plus"></i> Request New Service
            </a>
        </div>

        <div class="qh-card">
            <div class="qh-card-header">
                <div style="display: flex; align-items: center; gap: 0.65rem;">
                    <i class="fas fa-clock" style="color: var(--amber); font-size: 1.15rem;"></i>
                    <h3 class="editorial-heading" style="font-size: 1.25rem;">Active Queue</h3>
                </div>
                <div class="text-muted" style="font-size: 0.85rem;">
                    Updates reflect immediately when partner confirms
                </div>
            </div>

            <div class="qh-table-container">
                <table class="qh-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Service Title</th>
                            <th>Description</th>
                            <th>Assigned Partner</th>
                            <th>Partner Contact</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            boolean hasPending = false;
                            if (orders != null && !orders.isEmpty()) {
                                for (OrderService order : orders) {
                                    if ("pending".equalsIgnoreCase(order.getStatus())) {
                                        hasPending = true;
                        %>
                        <tr>
                            <td>
                                <span style="font-family: var(--font-serif); font-size: 1.05rem; font-weight: 700; color: var(--charcoal);">
                                    #<%= order.getId() %>
                                </span>
                            </td>
                            <td>
                                <span style="font-weight: 600; color: var(--charcoal); display: block;">
                                    <%= order.getServiceTitle() %>
                                </span>
                            </td>
                            <td>
                                <span class="text-muted" style="font-size: 0.85rem; max-width: 260px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
                                    <%= order.getServiceDescription() %>
                                </span>
                            </td>
                            <td>
                                <div style="display: flex; align-items: center; gap: 0.65rem;">
                                    <div style="width: 30px; height: 30px; border-radius: var(--radius-sm); background: var(--sand-soft); border: 1px solid var(--border); color: var(--terracotta); display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 0.8rem;">
                                        <%= order.getServiceProviderName() != null && !order.getServiceProviderName().isEmpty() ? order.getServiceProviderName().substring(0, 1).toUpperCase() : "P" %>
                                    </div>
                                    <span style="font-weight: 500;"><%= order.getServiceProviderName() != null ? order.getServiceProviderName() : "Partner" %></span>
                                </div>
                            </td>
                            <td>
                                <span style="font-size: 0.88rem; color: var(--charcoal);">
                                    <i class="fas fa-phone" style="color: var(--muted); font-size: 0.78rem;"></i> <%= order.getServideProviderContact() %>
                                </span>
                            </td>
                            <td>
                                <span style="font-size: 0.88rem; color: var(--charcoal); white-space: nowrap;">
                                    <i class="fas fa-calendar-day" style="color: var(--muted); font-size: 0.78rem;"></i> <%= order.getDate() %>
                                </span>
                            </td>
                            <td>
                                <span style="font-size: 0.88rem; color: var(--charcoal); white-space: nowrap;">
                                    <i class="fas fa-clock" style="color: var(--muted); font-size: 0.78rem;"></i> <%= order.getTime() %>
                                </span>
                            </td>
                            <td>
                                <span class="qh-badge qh-badge-amber">
                                    <i class="fas fa-hourglass-half"></i> Pending
                                </span>
                            </td>
                        </tr>
                        <%
                                    }
                                }
                            }
                            if (!hasPending) {
                        %>
                        <tr>
                            <td colspan="8">
                                <div class="qh-empty-state">
                                    <i class="fas fa-inbox qh-empty-icon"></i>
                                    <h3 class="qh-empty-title">No Pending Requests</h3>
                                    <p class="qh-empty-desc">
                                        You do not currently have any service orders awaiting technician confirmation.
                                    </p>
                                    <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-primary">
                                        <i class="fas fa-calendar-plus"></i> Book a Service
                                    </a>
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
