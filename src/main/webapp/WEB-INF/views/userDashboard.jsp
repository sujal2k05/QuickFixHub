<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.sujal.dao.OrderServiceDao" %>
<%@ page import="com.sujal.model.OrderService" %>
<%@ page import="com.sujal.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    String userName = (String) session.getAttribute("name");

    ApplicationContext ctx = (ApplicationContext) application.getAttribute("QUICKFIX_SPRING_CONFIG_CTX");
    if (ctx == null) {
        try {
            ctx = new ClassPathXmlApplicationContext("config.xml");
            application.setAttribute("QUICKFIX_SPRING_CONFIG_CTX", ctx);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    OrderServiceDao oDao = ctx != null ? ctx.getBean("orderServiceDao", OrderServiceDao.class) : null;

    int userPendingCount = 0;
    int userApprovedCount = 0;
    int userDisapprovedCount = 0;
    int userTotalCount = 0;
    List<OrderService> userRecentOrders = new ArrayList<>();

    if (oDao != null) {
        List<OrderService> allO = oDao.getAllOrders();
        if (allO != null) {
            for (OrderService o : allO) {
                boolean matches = false;
                if (loggedInUser != null && loggedInUser.getContact() != null && loggedInUser.getContact().equals(o.getUserContact())) {
                    matches = true;
                } else if (userName != null && userName.equalsIgnoreCase(o.getUserName())) {
                    matches = true;
                }
                if (matches) {
                    userTotalCount++;
                    if ("pending".equalsIgnoreCase(o.getStatus())) userPendingCount++;
                    else if ("approved".equalsIgnoreCase(o.getStatus())) userApprovedCount++;
                    else if ("disapproved".equalsIgnoreCase(o.getStatus())) userDisapprovedCount++;
                    
                    if (userRecentOrders.size() < 5) {
                        userRecentOrders.add(o);
                    }
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>

    <!-- Header Navigation -->
    <header class="qh-navbar">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/userDashboard" class="qh-brand">
                <div class="qh-brand-mark">
                    <i class="fas fa-hammer"></i>
                </div>
                <div>
                    <span class="qh-brand-title">QuickFixHub</span>
                    <span class="qh-brand-subtitle">Home Services</span>
                </div>
            </a>

            <div class="qh-nav-actions">
                <div class="qh-user-badge">
                    <div class="qh-avatar">
                        <%= session.getAttribute("name") != null && !session.getAttribute("name").toString().isEmpty() ? session.getAttribute("name").toString().substring(0, 1).toUpperCase() : "U" %>
                    </div>
                    <span><%= session.getAttribute("name") != null ? session.getAttribute("name") : "Homeowner" %></span>
                </div>
                <a href="${pageContext.request.contextPath}/index" class="qh-btn qh-btn-secondary qh-btn-sm">
                    <i class="fas fa-arrow-right-from-bracket"></i> Sign Out
                </a>
            </div>
        </div>
    </header>

    <div class="qh-dashboard-shell">
        <!-- Sidebar Navigation -->
        <aside class="qh-sidebar">
            <div>
                <ul class="qh-sidebar-nav">
                    <li class="qh-sidebar-heading">Navigation</li>
                    <li>
                        <a href="${pageContext.request.contextPath}/userDashboard" class="qh-sidebar-link active">
                            <i class="fas fa-grip"></i> Overview
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-sidebar-link">
                            <i class="fas fa-calendar-plus"></i> Book New Service
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/searchProvider" class="qh-sidebar-link">
                            <i class="fas fa-magnifying-glass"></i> Find Providers
                        </a>
                    </li>

                    <li class="qh-sidebar-heading">Service Requests</li>
                    <li>
                        <a href="${pageContext.request.contextPath}/pending" class="qh-sidebar-link">
                            <i class="fas fa-hourglass-half"></i> Pending Orders
                            <% if (userPendingCount > 0) { %>
                                <span class="qh-badge qh-badge-amber" style="margin-left: auto; font-size: 0.7rem;"><%= userPendingCount %></span>
                            <% } %>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/approved" class="qh-sidebar-link">
                            <i class="fas fa-circle-check"></i> Confirmed Orders
                            <% if (userApprovedCount > 0) { %>
                                <span class="qh-badge qh-badge-sage" style="margin-left: auto; font-size: 0.7rem;"><%= userApprovedCount %></span>
                            <% } %>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/disapproved" class="qh-sidebar-link">
                            <i class="fas fa-circle-xmark"></i> Declined Orders
                            <% if (userDisapprovedCount > 0) { %>
                                <span class="qh-badge qh-badge-brick" style="margin-left: auto; font-size: 0.7rem;"><%= userDisapprovedCount %></span>
                            <% } %>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Sidebar Trust Box -->
            <div style="background: var(--sand-soft); border: 1px solid var(--border); border-radius: var(--radius-md); padding: 1.15rem; margin-top: 2rem;">
                <div style="font-weight: 700; font-size: 0.85rem; color: var(--charcoal); margin-bottom: 0.35rem; display: flex; align-items: center; gap: 0.45rem;">
                    <i class="fas fa-shield-halved" style="color: var(--sage);"></i> Quality Promise
                </div>
                <div style="font-size: 0.8rem; color: var(--muted); line-height: 1.5;">
                    Transparent billing with certified background-checked technicians.
                </div>
            </div>
        </aside>

        <!-- Main Dashboard View -->
        <main class="qh-dashboard-content">
            <% if (request.getAttribute("successMessage") != null) { %>
                <div class="qh-alert qh-alert-success">
                    <i class="fas fa-circle-check" style="font-size: 1.25rem;"></i>
                    <div style="font-weight: 600;"><%= request.getAttribute("successMessage") %></div>
                </div>
            <% } %>

            <!-- Welcome Hero Banner -->
            <section class="qh-hero-banner">
                <div class="qh-hero-tag">
                    <i class="fas fa-house"></i> Customer Portal
                </div>
                <h1 class="qh-hero-title">
                    Welcome back, <%= session.getAttribute("name") != null ? session.getAttribute("name") : "Valued Customer" %>
                </h1>
                <p class="qh-hero-desc">
                    Book trusted professionals for plumbing, electrical, carpentry, or appliance repairs in 3 quick steps. Track ongoing appointments and past job history below.
                </p>

                <div style="margin-top: 1.75rem; display: flex; gap: 1rem; flex-wrap: wrap;">
                    <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-primary qh-btn-lg">
                        <i class="fas fa-plus"></i> Book a Service
                    </a>
                    <a href="${pageContext.request.contextPath}/pending" class="qh-btn qh-btn-secondary qh-btn-lg">
                        <i class="fas fa-clock"></i> Track Active Requests (<%= userPendingCount %>)
                    </a>
                </div>
            </section>

            <!-- Status Metric Cards with Genuine Real-time Counts -->
            <div class="qh-stats-grid">
                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-amber">
                        <i class="fas fa-hourglass-half"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value" style="color: var(--amber);"><%= userPendingCount %></div>
                        <div class="qh-stat-label">Pending Confirmation</div>
                    </div>
                </div>

                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-sage">
                        <i class="fas fa-circle-check"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value" style="color: var(--sage-dark);"><%= userApprovedCount %></div>
                        <div class="qh-stat-label">Confirmed Appointments</div>
                    </div>
                </div>

                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-terracotta">
                        <i class="fas fa-clipboard-check"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value"><%= userTotalCount %></div>
                        <div class="qh-stat-label">Total Bookings Placed</div>
                    </div>
                </div>

                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-sand">
                        <i class="fas fa-shield-heart"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value" style="color: var(--brick);"><%= userDisapprovedCount %></div>
                        <div class="qh-stat-label">Declined / Cancelled</div>
                    </div>
                </div>
            </div>

            <!-- Booking Management Grid -->
            <div style="margin: 2.5rem 0 1.25rem 0;">
                <h2 style="font-size: 1.65rem; color: var(--charcoal);">Manage Bookings</h2>
                <p style="color: var(--muted); font-size: 0.9rem;">Review request approvals and communicate with technicians</p>
            </div>

            <div class="qh-nav-grid">
                <!-- Book Service -->
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-nav-card">
                    <div class="qh-nav-card-icon" style="background: var(--terracotta-light); color: var(--terracotta);">
                        <i class="fas fa-calendar-plus"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Schedule a Service</h3>
                    <p class="qh-nav-card-desc">
                        Search by service category and pincode to discover certified professionals near your doorstep.
                    </p>
                    <div class="qh-nav-card-action">
                        <span>Start Booking</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <!-- Pending Orders -->
                <a href="${pageContext.request.contextPath}/pending" class="qh-nav-card active-amber">
                    <div class="qh-nav-card-icon" style="background: var(--amber-light); color: var(--amber);">
                        <i class="fas fa-hourglass-half"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Pending Requests (<%= userPendingCount %>)</h3>
                    <p class="qh-nav-card-desc">
                        Orders currently awaiting response and schedule confirmation from your selected service partner.
                    </p>
                    <div class="qh-nav-card-action" style="color: var(--amber);">
                        <span>View Pending Orders</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <!-- Approved Orders -->
                <a href="${pageContext.request.contextPath}/approved" class="qh-nav-card active-sage">
                    <div class="qh-nav-card-icon" style="background: var(--sage-light); color: var(--sage);">
                        <i class="fas fa-circle-check"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Confirmed Orders (<%= userApprovedCount %>)</h3>
                    <p class="qh-nav-card-desc">
                        Accepted appointments with provider contact numbers, designated arrival dates, and work details.
                    </p>
                    <div class="qh-nav-card-action" style="color: var(--sage);">
                        <span>View Confirmed Orders</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <!-- Disapproved Orders -->
                <a href="${pageContext.request.contextPath}/disapproved" class="qh-nav-card active-brick">
                    <div class="qh-nav-card-icon" style="background: var(--brick-light); color: var(--brick);">
                        <i class="fas fa-circle-xmark"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Declined Orders (<%= userDisapprovedCount %>)</h3>
                    <p class="qh-nav-card-desc">
                        Orders that were declined by the technician. Easily re-book with another available provider.
                    </p>
                    <div class="qh-nav-card-action" style="color: var(--brick);">
                        <span>View Declined Orders</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>
            </div>

            <!-- Recent Customer Activity Table -->
            <% if (!userRecentOrders.isEmpty()) { %>
            <div style="margin-top: 2.5rem;">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.25rem;">
                    <div>
                        <h2 class="editorial-heading" style="font-size: 1.45rem;">Recent Service Activity</h2>
                        <p class="text-muted" style="font-size: 0.88rem;">Your most recent appointments and requests</p>
                    </div>
                </div>

                <div class="qh-card">
                    <div class="qh-table-container">
                        <table class="qh-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Service</th>
                                    <th>Assigned Specialist</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (OrderService ord : userRecentOrders) { 
                                    String st = ord.getStatus() != null ? ord.getStatus().toLowerCase() : "pending";
                                %>
                                <tr>
                                    <td><strong>#<%= ord.getId() %></strong></td>
                                    <td><span style="font-weight: 600;"><%= ord.getServiceTitle() %></span></td>
                                    <td>
                                        <span style="color: var(--charcoal); font-weight: 500;">
                                            <%= ord.getServiceProviderName() != null ? ord.getServiceProviderName() : "Assigned Partner" %>
                                        </span>
                                    </td>
                                    <td><span style="font-size: 0.88rem;"><%= ord.getDate() %></span></td>
                                    <td><span style="font-size: 0.88rem;"><%= ord.getTime() %></span></td>
                                    <td>
                                        <% if ("approved".equals(st)) { %>
                                            <span class="qh-badge qh-badge-sage"><i class="fas fa-check"></i> Confirmed</span>
                                        <% } else if ("disapproved".equals(st)) { %>
                                            <span class="qh-badge qh-badge-brick"><i class="fas fa-times"></i> Declined</span>
                                        <% } else { %>
                                            <span class="qh-badge qh-badge-amber"><i class="fas fa-clock"></i> Pending</span>
                                        <% } %>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <% } %>

            <!-- Quick Category Launcher -->
            <div style="margin-top: 3.5rem;">
                <h3 style="font-size: 1.25rem; color: var(--charcoal); margin-bottom: 0.5rem;">Browse Services by Trade</h3>
                <p style="color: var(--muted); font-size: 0.88rem; margin-bottom: 1.25rem;">Quickly launch a request in your preferred category</p>

                <div style="display: flex; gap: 0.75rem; flex-wrap: wrap;">
                    <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-secondary qh-btn-sm">
                        <i class="fas fa-faucet-drip" style="color: var(--terracotta);"></i> Plumbing
                    </a>
                    <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-secondary qh-btn-sm">
                        <i class="fas fa-bolt" style="color: var(--amber);"></i> Electrical
                    </a>
                    <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-secondary qh-btn-sm">
                        <i class="fas fa-hammer" style="color: var(--sand);"></i> Carpentry
                    </a>
                    <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-secondary qh-btn-sm">
                        <i class="fas fa-paint-roller" style="color: var(--sage);"></i> Painting
                    </a>
                    <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-secondary qh-btn-sm">
                        <i class="fas fa-broom" style="color: var(--terracotta);"></i> Cleaning
                    </a>
                    <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-secondary qh-btn-sm">
                        <i class="fas fa-wrench" style="color: var(--charcoal);"></i> Appliance Repair
                    </a>
                </div>
            </div>
        </main>
    </div>

    <%@ include file="common/footer.jsp" %>
</body>
</html>
