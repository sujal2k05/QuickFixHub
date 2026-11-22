<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.sujal.model.OrderService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmed Orders Analytics &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <header class="qh-navbar">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/index" class="qh-brand">
                <div class="qh-brand-mark"><i class="fas fa-hammer"></i></div>
                <div>
                    <span class="qh-brand-title">QuickFixHub</span>
                    <span class="qh-brand-subtitle">Operations</span>
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
        <%
            List<OrderService> allOrders = (List<OrderService>) request.getAttribute("orders");
            List<OrderService> approvedOrders = new ArrayList<>();
            int pendingCount = 0;
            int rejectedCount = 0;

            if (allOrders != null) {
                for (OrderService order : allOrders) {
                    if ("approved".equalsIgnoreCase(order.getStatus())) {
                        approvedOrders.add(order);
                    } else if ("pending".equalsIgnoreCase(order.getStatus())) {
                        pendingCount++;
                    } else if ("disapproved".equalsIgnoreCase(order.getStatus()) || "rejected".equalsIgnoreCase(order.getStatus())) {
                        rejectedCount++;
                    }
                }
            }
        %>

        <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 2rem; flex-wrap: wrap; gap: 1rem;">
            <div>
                <span class="qh-hero-tag" style="color: var(--sage);">Fulfillment Analytics</span>
                <h1 class="editorial-heading" style="font-size: 2.1rem;">Approved Bookings Overview</h1>
                <p class="text-muted" style="font-size: 0.95rem; margin-top: 0.25rem;">
                    Summary of service fulfillment and confirmed work orders
                </p>
            </div>
        </div>

        <!-- Metrics Grid -->
        <div class="qh-stats-grid">
            <div class="qh-stat-card">
                <div class="qh-stat-icon icon-sand">
                    <i class="fas fa-clipboard-list"></i>
                </div>
                <div>
                    <div class="qh-stat-value"><%= allOrders != null ? allOrders.size() : 0 %></div>
                    <div class="qh-stat-label">Total Placed Orders</div>
                </div>
            </div>

            <div class="qh-stat-card">
                <div class="qh-stat-icon icon-sage">
                    <i class="fas fa-circle-check"></i>
                </div>
                <div>
                    <div class="qh-stat-value" style="color: var(--sage);"><%= approvedOrders.size() %></div>
                    <div class="qh-stat-label">Approved Appointments</div>
                </div>
            </div>

            <div class="qh-stat-card">
                <div class="qh-stat-icon icon-amber">
                    <i class="fas fa-hourglass-half"></i>
                </div>
                <div>
                    <div class="qh-stat-value" style="color: var(--amber);"><%= pendingCount %></div>
                    <div class="qh-stat-label">Pending Confirmation</div>
                </div>
            </div>

            <div class="qh-stat-card">
                <div class="qh-stat-icon icon-brick">
                    <i class="fas fa-circle-xmark"></i>
                </div>
                <div>
                    <div class="qh-stat-value" style="color: var(--brick);"><%= rejectedCount %></div>
                    <div class="qh-stat-label">Declined Requests</div>
                </div>
            </div>
        </div>

        <div class="qh-card">
            <div class="qh-card-header">
                <div style="display: flex; align-items: center; gap: 0.65rem;">
                    <i class="fas fa-list-check" style="color: var(--sage); font-size: 1.15rem;"></i>
                    <h3 class="editorial-heading" style="font-size: 1.25rem;">Confirmed Service Orders</h3>
                </div>
            </div>

            <div class="qh-table-container">
                <table class="qh-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Service Title</th>
                            <th>Description</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (!approvedOrders.isEmpty()) {
                                for (OrderService order : approvedOrders) {
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
                            <td style="font-weight: 600; color: var(--charcoal);"><%= order.getServiceTitle() %></td>
                            <td>
                                <span class="text-muted" style="font-size: 0.85rem; max-width: 240px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
                                    <%= order.getServiceDescription() %>
                                </span>
                            </td>
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
                            <td>
                                <span class="qh-badge qh-badge-sage">
                                    <i class="fas fa-check-circle"></i> Approved
                                </span>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="9">
                                <div class="qh-empty-state">
                                    <i class="fas fa-clipboard-check qh-empty-icon"></i>
                                    <h3 class="qh-empty-title">No Approved Orders Found</h3>
                                    <p class="qh-empty-desc">There are no approved orders to display at the moment.</p>
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
