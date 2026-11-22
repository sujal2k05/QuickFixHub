<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.sujal.dao.ProviderDao" %>
<%@ page import="com.sujal.dao.OrderServiceDao" %>
<%@ page import="com.sujal.model.Provider" %>
<%@ page import="com.sujal.model.OrderService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%
    String currentProviderName = (String) session.getAttribute("name");
    String currentProviderContact = (String) session.getAttribute("contact");

    ApplicationContext ctx = (ApplicationContext) application.getAttribute("QUICKFIX_SPRING_CONFIG_CTX");
    if (ctx == null) {
        try {
            ctx = new ClassPathXmlApplicationContext("config.xml");
            application.setAttribute("QUICKFIX_SPRING_CONFIG_CTX", ctx);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    ProviderDao pDao = ctx != null ? ctx.getBean("providerDao", ProviderDao.class) : null;
    OrderServiceDao oDao = ctx != null ? ctx.getBean("orderServiceDao", OrderServiceDao.class) : null;

    int todayOrdersCount = 0;
    int weekOrdersCount = 0;
    int allProviderOrdersCount = 0;
    String providerStatus = "Approved & Active";
    String providerTrade = "Verified Professional";

    if (pDao != null && currentProviderContact != null) {
        Provider provObj = pDao.getProvider(currentProviderContact);
        if (provObj != null) {
            if (provObj.getStatus() != null) {
                providerStatus = provObj.getStatus().substring(0, 1).toUpperCase() + provObj.getStatus().substring(1);
            }
            if (provObj.getCategory() != null) {
                providerTrade = provObj.getCategory();
            }
        }
    }

    if (oDao != null && currentProviderName != null) {
        List<OrderService> allO = oDao.getAllOrders();
        String todayStr = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_YEAR, -6);
        Date sevenDaysAgo = cal.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if (allO != null) {
            for (OrderService o : allO) {
                if (currentProviderName.equalsIgnoreCase(o.getServiceProviderName())) {
                    allProviderOrdersCount++;
                    if (todayStr.equals(o.getDate())) {
                        todayOrdersCount++;
                    }
                    try {
                        if (o.getDate() != null) {
                            Date orderDate = sdf.parse(o.getDate());
                            if (!orderDate.before(sevenDaysAgo) && !orderDate.after(new Date())) {
                                weekOrdersCount++;
                            }
                        }
                    } catch (Exception ex) {}
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
    <title>Service Partner Dashboard &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <!-- Top Navbar -->
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
                <div class="qh-user-badge">
                    <div class="qh-avatar">
                        <%= session.getAttribute("name") != null ? session.getAttribute("name").toString().substring(0, 1).toUpperCase() : "P" %>
                    </div>
                    <span><%= session.getAttribute("name") != null ? session.getAttribute("name") : "Service Partner" %></span>
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
                <span class="qh-sidebar-heading">Partner Console</span>
                <ul class="qh-sidebar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/providerDashboard" class="qh-sidebar-link active">
                            <i class="fas fa-chart-pie"></i>
                            <span>Overview</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/providerOrdersToday" class="qh-sidebar-link">
                            <i class="fas fa-calendar-day"></i>
                            <span>Today's Jobs</span>
                            <% if (todayOrdersCount > 0) { %>
                                <span class="qh-badge qh-badge-sage" style="margin-left: auto; font-size: 0.7rem;"><%= todayOrdersCount %></span>
                            <% } %>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/providerOrders" class="qh-sidebar-link">
                            <i class="fas fa-list-check"></i>
                            <span>All Requests</span>
                            <% if (allProviderOrdersCount > 0) { %>
                                <span class="qh-badge qh-badge-sand" style="margin-left: auto; font-size: 0.7rem;"><%= allProviderOrdersCount %></span>
                            <% } %>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/providerOrdersLast7Days" class="qh-sidebar-link">
                            <i class="fas fa-calendar-week"></i>
                            <span>7-Day Schedule</span>
                            <% if (weekOrdersCount > 0) { %>
                                <span class="qh-badge qh-badge-amber" style="margin-left: auto; font-size: 0.7rem;"><%= weekOrdersCount %></span>
                            <% } %>
                        </a>
                    </li>
                </ul>

                <span class="qh-sidebar-heading" style="margin-top: 2rem;">Quick Portals</span>
                <ul class="qh-sidebar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/index" class="qh-sidebar-link">
                            <i class="fas fa-home"></i>
                            <span>Platform Home</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div style="padding-top: 1.5rem; border-top: 1px solid var(--border);">
                <div style="font-size: 0.82rem; color: var(--muted); line-height: 1.4;">
                    Specialization: <strong><%= providerTrade %></strong><br>
                    Status: <span class="qh-badge qh-badge-sage" style="font-size: 0.65rem; padding: 0.1rem 0.4rem;"><%= providerStatus %></span>
                </div>
                <a href="${pageContext.request.contextPath}/index" class="qh-btn qh-btn-secondary qh-btn-sm qh-btn-full" style="margin-top: 0.75rem;">
                    <i class="fas fa-power-off"></i> Logout
                </a>
            </div>
        </aside>

        <!-- Main Content Area -->
        <main class="qh-dashboard-content">
            <!-- Welcome Hero Banner -->
            <section class="qh-hero-banner">
                <span class="qh-hero-tag"><%= providerTrade %> Operations</span>
                <h1 class="qh-hero-title">
                    Welcome, <%= session.getAttribute("name") != null ? session.getAttribute("name") : "Professional Partner" %>
                </h1>
                <p class="qh-hero-desc">
                    Manage incoming service requests, check today's appointment itinerary, coordinate customer logistics, and uphold our 5-star service standard.
                </p>
                <div style="margin-top: 1.75rem; display: flex; gap: 0.85rem; flex-wrap: wrap;">
                    <a href="${pageContext.request.contextPath}/providerOrdersToday" class="qh-btn qh-btn-primary">
                        <i class="fas fa-calendar-day"></i> View Today's Appointments (<%= todayOrdersCount %>)
                    </a>
                    <a href="${pageContext.request.contextPath}/providerOrders" class="qh-btn qh-btn-secondary">
                        <i class="fas fa-list-check"></i> All Assigned Orders (<%= allProviderOrdersCount %>)
                    </a>
                </div>
            </section>

            <!-- Metrics Grid with Genuine Database Counts -->
            <div class="qh-stats-grid">
                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-terracotta">
                        <i class="fas fa-calendar-day"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value"><%= todayOrdersCount %></div>
                        <div class="qh-stat-label">Today's Scheduled Jobs</div>
                    </div>
                </div>

                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-sand">
                        <i class="fas fa-calendar-week"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value"><%= weekOrdersCount %></div>
                        <div class="qh-stat-label">Past 7-Day Completed Orders</div>
                    </div>
                </div>

                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-sage">
                        <i class="fas fa-circle-check"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value"><%= allProviderOrdersCount %></div>
                        <div class="qh-stat-label">Total Assigned Bookings</div>
                    </div>
                </div>

                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-amber">
                        <i class="fas fa-certificate"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value" style="font-size: 1.25rem;"><%= providerStatus %></div>
                        <div class="qh-stat-label">Account Compliance</div>
                    </div>
                </div>
            </div>

            <!-- Order & Appointment Navigation Cards -->
            <div style="margin-bottom: 1.25rem;">
                <h2 class="editorial-heading" style="font-size: 1.45rem;">Job Management & Queues</h2>
                <p class="text-muted" style="font-size: 0.88rem; margin-top: 0.2rem;">Select an action portal to view or update status</p>
            </div>

            <div class="qh-nav-grid">
                <!-- All Orders Card -->
                <a href="${pageContext.request.contextPath}/providerOrders" class="qh-nav-card">
                    <div class="qh-nav-card-icon" style="background: var(--terracotta-light); color: var(--terracotta);">
                        <i class="fas fa-clipboard-list"></i>
                    </div>
                    <h3 class="qh-nav-card-title">All Assigned Orders (<%= allProviderOrdersCount %>)</h3>
                    <p class="qh-nav-card-desc">Review full history of customer service bookings assigned to your business.</p>
                    <div class="qh-nav-card-action">
                        <span>Open Orders Log</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <!-- Today's Orders Card -->
                <a href="${pageContext.request.contextPath}/providerOrdersToday" class="qh-nav-card active-sage">
                    <div class="qh-nav-card-icon" style="background: var(--sage-light); color: var(--sage-dark);">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Today's Appointments (<%= todayOrdersCount %>)</h3>
                    <p class="qh-nav-card-desc">Check your jobs for today, customer addresses, contact numbers, and update status.</p>
                    <div class="qh-nav-card-action" style="color: var(--sage-dark);">
                        <span>View Today's Schedule</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <!-- 7 Days Orders Card -->
                <a href="${pageContext.request.contextPath}/providerOrdersLast7Days" class="qh-nav-card active-amber">
                    <div class="qh-nav-card-icon" style="background: var(--amber-light); color: var(--amber);">
                        <i class="fas fa-calendar-days"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Past 7-Day Orders (<%= weekOrdersCount %>)</h3>
                    <p class="qh-nav-card-desc">Preview jobs completed or scheduled over the 7-day period to organize logistics.</p>
                    <div class="qh-nav-card-action" style="color: var(--amber);">
                        <span>View 7-Day Timeline</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>
            </div>
        </main>
    </div>

    <%@ include file="common/footer.jsp" %>
</body>
</html>
