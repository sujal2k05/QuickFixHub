<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.sujal.dao.ProviderDao" %>
<%@ page import="com.sujal.dao.UserDao" %>
<%@ page import="com.sujal.dao.OrderServiceDao" %>
<%@ page import="com.sujal.model.Provider" %>
<%@ page import="com.sujal.model.User" %>
<%@ page import="com.sujal.model.OrderService" %>
<%@ page import="java.util.List" %>
<%
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
    UserDao uDao = ctx != null ? ctx.getBean("userDao", UserDao.class) : null;
    OrderServiceDao oDao = ctx != null ? ctx.getBean("orderServiceDao", OrderServiceDao.class) : null;

    int pendingPartners = 0;
    int approvedPartners = 0;
    int disapprovedPartners = 0;
    int totalUsers = 0;
    int totalOrders = 0;

    if (pDao != null) {
        List<Provider> allP = pDao.getAllProvider();
        if (allP != null) {
            for (Provider p : allP) {
                if ("pending".equalsIgnoreCase(p.getStatus())) pendingPartners++;
                else if ("approved".equalsIgnoreCase(p.getStatus())) approvedPartners++;
                else if ("disapproved".equalsIgnoreCase(p.getStatus())) disapprovedPartners++;
            }
        }
    }
    if (uDao != null) {
        List<User> allU = uDao.getAllUser();
        if (allU != null) totalUsers = allU.size();
    }
    if (oDao != null) {
        List<OrderService> allO = oDao.getAllOrders();
        if (allO != null) totalOrders = allO.size();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Command Center &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <!-- Admin Top Navbar -->
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
                <div class="qh-user-badge">
                    <div class="qh-avatar" style="background: var(--charcoal);">
                        <i class="fas fa-user-shield" style="font-size: 0.75rem;"></i>
                    </div>
                    <span>${sessionScope.admin != null ? sessionScope.admin : "Administrator"}</span>
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
                <span class="qh-sidebar-heading">Administration</span>
                <ul class="qh-sidebar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/admindashboard" class="qh-sidebar-link active">
                            <i class="fas fa-gauge"></i>
                            <span>Overview</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/viewAllProviders" class="qh-sidebar-link">
                            <i class="fas fa-clock-rotate-left"></i>
                            <span>Pending Partners</span>
                            <span class="qh-badge qh-badge-amber" style="margin-left: auto; font-size: 0.7rem;"><%= pendingPartners %></span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/viewApprovedProviders" class="qh-sidebar-link">
                            <i class="fas fa-certificate"></i>
                            <span>Approved Partners</span>
                            <span class="qh-badge qh-badge-sage" style="margin-left: auto; font-size: 0.7rem;"><%= approvedPartners %></span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/disapprovedProvider" class="qh-sidebar-link">
                            <i class="fas fa-ban"></i>
                            <span>Disapproved Partners</span>
                            <span class="qh-badge qh-badge-brick" style="margin-left: auto; font-size: 0.7rem;"><%= disapprovedPartners %></span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/viewUsers" class="qh-sidebar-link">
                            <i class="fas fa-users"></i>
                            <span>Customer Directory</span>
                            <span class="qh-badge qh-badge-sand" style="margin-left: auto; font-size: 0.7rem;"><%= totalUsers %></span>
                        </a>
                    </li>
                </ul>

                <span class="qh-sidebar-heading" style="margin-top: 2rem;">Portals</span>
                <ul class="qh-sidebar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/index" class="qh-sidebar-link">
                            <i class="fas fa-house"></i>
                            <span>Platform Home</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div style="padding-top: 1.5rem; border-top: 1px solid var(--border);">
                <div style="font-size: 0.82rem; color: var(--muted); line-height: 1.4;">
                    Admin Session &bull; <%= totalOrders %> Total Service Orders
                </div>
                <a href="${pageContext.request.contextPath}/index" class="qh-btn qh-btn-secondary qh-btn-sm qh-btn-full" style="margin-top: 0.75rem;">
                    <i class="fas fa-power-off"></i> Logout
                </a>
            </div>
        </aside>

        <!-- Main Content Area -->
        <main class="qh-dashboard-content">
            <!-- Command Center Hero Header -->
            <section class="qh-hero-banner">
                <span class="qh-hero-tag">Live Platform Analytics</span>
                <h1 class="qh-hero-title">Administration Console</h1>
                <p class="qh-hero-desc">
                    Review incoming partner onboarding verifications, manage registered customer records, monitor active service fulfillment, and enforce quality standards across all territories.
                </p>
            </section>

            <!-- Metrics Grid with Genuine Database Counts -->
            <div class="qh-stats-grid">
                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-amber">
                        <i class="fas fa-user-clock"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value" style="color: var(--amber);"><%= pendingPartners %></div>
                        <div class="qh-stat-label">Pending Partner Applications</div>
                    </div>
                </div>

                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-sage">
                        <i class="fas fa-user-check"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value" style="color: var(--sage-dark);"><%= approvedPartners %></div>
                        <div class="qh-stat-label">Active Approved Partners</div>
                    </div>
                </div>

                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-sand">
                        <i class="fas fa-users"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value"><%= totalUsers %></div>
                        <div class="qh-stat-label">Registered Customers</div>
                    </div>
                </div>

                <div class="qh-stat-card">
                    <div class="qh-stat-icon icon-brick">
                        <i class="fas fa-user-xmark"></i>
                    </div>
                    <div>
                        <div class="qh-stat-value" style="color: var(--brick);"><%= disapprovedPartners %></div>
                        <div class="qh-stat-label">Disapproved Applications</div>
                    </div>
                </div>
            </div>

            <!-- Management Portals Navigation Grid -->
            <div style="margin-bottom: 1.25rem;">
                <h2 class="editorial-heading" style="font-size: 1.45rem;">Administration Portals</h2>
                <p class="text-muted" style="font-size: 0.88rem; margin-top: 0.2rem;">
                    Manage platform entities, verify partner credentials, and inspect user accounts
                </p>
            </div>

            <div class="qh-nav-grid">
                <!-- Pending Providers -->
                <a href="${pageContext.request.contextPath}/viewAllProviders" class="qh-nav-card active-amber">
                    <div class="qh-nav-card-icon" style="background: var(--amber-light); color: var(--amber);">
                        <i class="fas fa-clock-rotate-left"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Pending Partner Approvals (<%= pendingPartners %>)</h3>
                    <p class="qh-nav-card-desc">Review new craftsperson registrations and approve or decline based on qualifications.</p>
                    <div class="qh-nav-card-action" style="color: var(--amber);">
                        <span>Review Pending List</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <!-- Approved Providers -->
                <a href="${pageContext.request.contextPath}/viewApprovedProviders" class="qh-nav-card active-sage">
                    <div class="qh-nav-card-icon" style="background: var(--sage-light); color: var(--sage-dark);">
                        <i class="fas fa-certificate"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Approved Service Partners (<%= approvedPartners %>)</h3>
                    <p class="qh-nav-card-desc">View all verified active professionals currently accepting customer requests across all areas.</p>
                    <div class="qh-nav-card-action" style="color: var(--sage-dark);">
                        <span>Manage Approved Directory</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <!-- Disapproved Providers -->
                <a href="${pageContext.request.contextPath}/disapprovedProvider" class="qh-nav-card active-brick">
                    <div class="qh-nav-card-icon" style="background: var(--brick-light); color: var(--brick);">
                        <i class="fas fa-ban"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Disapproved Partners (<%= disapprovedPartners %>)</h3>
                    <p class="qh-nav-card-desc">Audit declined applicants, review rejection compliance, or reinstate eligibility.</p>
                    <div class="qh-nav-card-action" style="color: var(--brick);">
                        <span>View Disapproved</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <!-- Manage Users -->
                <a href="${pageContext.request.contextPath}/viewUsers" class="qh-nav-card">
                    <div class="qh-nav-card-icon" style="background: var(--sand-soft); color: var(--charcoal);">
                        <i class="fas fa-users-gear"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Registered Customer Base (<%= totalUsers %>)</h3>
                    <p class="qh-nav-card-desc">Access registered customer accounts, contact numbers, addresses, and user profiles.</p>
                    <div class="qh-nav-card-action">
                        <span>Browse Customer Directory</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>
            </div>
        </main>
    </div>

    <%@ include file="common/footer.jsp" %>
</body>
</html>
