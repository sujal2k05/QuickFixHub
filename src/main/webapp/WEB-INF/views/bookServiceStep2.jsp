<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.sujal.model.Provider" %>
<%@ page session="true" %>
<%
    String category = request.getParameter("category");
    String pincode = request.getParameter("pincode");
    if (category != null) session.setAttribute("category", category);
    if (pincode != null) session.setAttribute("pincode", pincode);
    List<Provider> providerList = (List<Provider>) request.getAttribute("providerList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Step 2: Select Provider &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
    <style>
        .provider-editorial-card {
            background: var(--white);
            border: 2px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 1.35rem 1.65rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        .provider-editorial-card:hover {
            border-color: var(--terracotta);
            box-shadow: var(--shadow-card);
            transform: translateY(-2px);
        }
        .provider-editorial-card.selected {
            border-color: var(--terracotta);
            background: var(--terracotta-subtle);
            box-shadow: 0 0 0 3px rgba(199, 101, 69, 0.16);
        }
        .provider-avatar-badge {
            width: 52px;
            height: 52px;
            border-radius: var(--radius-md);
            background: var(--sand-soft);
            color: var(--terracotta);
            border: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: var(--font-serif);
            font-size: 1.4rem;
            font-weight: 700;
            flex-shrink: 0;
        }
        .editorial-radio {
            width: 22px;
            height: 22px;
            accent-color: var(--terracotta);
            cursor: pointer;
        }
    </style>
</head>
<body>

    <header class="qh-navbar">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/userDashboard" class="qh-brand">
                <div class="qh-brand-mark"><i class="fas fa-hammer"></i></div>
                <div>
                    <span class="qh-brand-title">QuickFixHub</span>
                    <span class="qh-brand-subtitle">Step 2 of 3</span>
                </div>
            </a>
            <div class="qh-nav-actions">
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-secondary qh-btn-sm">
                    <i class="fas fa-arrow-left"></i> Change Category
                </a>
            </div>
        </div>
    </header>

    <main class="qh-container-narrow">
        <!-- 3-Step Stepper -->
        <div class="qh-stepper">
            <div class="qh-step-node completed">
                <div class="qh-step-circle"><i class="fas fa-check"></i></div>
                <div class="qh-step-title">Trade & Area</div>
            </div>
            <div class="qh-step-node active">
                <div class="qh-step-circle">2</div>
                <div class="qh-step-title">Select Partner</div>
            </div>
            <div class="qh-step-node">
                <div class="qh-step-circle">3</div>
                <div class="qh-step-title">Schedule & Details</div>
            </div>
        </div>

        <div class="qh-card">
            <div class="qh-card-header">
                <div>
                    <div style="font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.12em; color: var(--terracotta); margin-bottom: 0.25rem;">
                        Available Specialists
                    </div>
                    <h2 style="font-size: 1.6rem; color: var(--charcoal);">Choose Your Technician</h2>
                    <p style="font-size: 0.88rem; color: var(--muted); margin-top: 0.2rem;">
                        Verified partners matching <strong><%= session.getAttribute("category") != null ? session.getAttribute("category") : "Service" %></strong> in pincode <strong><%= session.getAttribute("pincode") != null ? session.getAttribute("pincode") : "" %></strong>
                    </p>
                </div>
            </div>

            <div class="qh-card-body">
                <form action="confirmBooking" method="post" id="step2Form">
                    <div id="providersList">
                        <%
                            if (providerList != null && !providerList.isEmpty()) {
                                int idx = 0;
                                for (Provider provider : providerList) {
                                    idx++;
                        %>
                        <label class="provider-editorial-card <%= idx == 1 ? "selected" : "" %>" for="p_<%= idx %>">
                            <div style="display: flex; align-items: center; gap: 1.25rem;">
                                <div class="provider-avatar-badge">
                                    <%= provider.getName() != null && !provider.getName().isEmpty() ? provider.getName().substring(0, 1).toUpperCase() : "P" %>
                                </div>
                                <div>
                                    <div style="display: flex; align-items: center; gap: 0.65rem; margin-bottom: 0.25rem;">
                                        <h3 style="font-family: var(--font-serif); font-size: 1.25rem; color: var(--charcoal);">
                                            <%= provider.getName() %>
                                        </h3>
                                        <span class="qh-badge qh-badge-sage" style="font-size: 0.7rem;">
                                            <i class="fas fa-certificate"></i> Verified
                                        </span>
                                    </div>

                                    <div style="display: flex; flex-wrap: wrap; gap: 1.15rem; font-size: 0.85rem; color: var(--muted);">
                                        <span><i class="fas fa-briefcase" style="color: var(--terracotta);"></i> <%= provider.getCategory() %></span>
                                        <span><i class="fas fa-phone" style="color: var(--muted);"></i> <%= provider.getContact() %></span>
                                        <% if (provider.getServiceType() != null && !provider.getServiceType().isEmpty()) { %>
                                            <span><i class="fas fa-wrench"></i> <%= provider.getServiceType() %></span>
                                        <% } %>
                                        <% if (provider.getOpenTime() != null && provider.getCloseTime() != null) { %>
                                            <span><i class="fas fa-clock"></i> <%= provider.getOpenTime() %> &ndash; <%= provider.getCloseTime() %></span>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <input type="radio" id="p_<%= idx %>" name="selectedProvider" class="editorial-radio"
                                   value="<%= provider.getName() %>,<%= provider.getContact() %>,<%= provider.getCategory() %>" required <%= idx == 1 ? "checked" : "" %>>
                        </label>
                        <%
                                }
                            } else {
                        %>
                        <div class="qh-empty-state">
                            <i class="fas fa-magnifying-glass-location qh-empty-icon"></i>
                            <h3 class="qh-empty-title">No Service Partners Found</h3>
                            <p class="qh-empty-desc">
                                We could not find registered specialists for <%= session.getAttribute("category") %> in postal code <%= session.getAttribute("pincode") %>.
                            </p>
                            <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-secondary">
                                <i class="fas fa-arrow-left"></i> Change Category or Pincode
                            </a>
                        </div>
                        <% } %>
                    </div>

                    <% if (providerList != null && !providerList.isEmpty()) { %>
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 2rem; padding-top: 1.5rem; border-top: 1px solid var(--border);">
                        <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-secondary">
                            <i class="fas fa-arrow-left"></i> Previous Step
                        </a>
                        <button type="submit" class="qh-btn qh-btn-primary qh-btn-lg">
                            Continue to Confirmation <i class="fas fa-arrow-right"></i>
                        </button>
                    </div>
                    <% } %>
                </form>
            </div>
        </div>
    </main>

    <%@ include file="common/footer.jsp" %>

    <script>
        document.querySelectorAll('.provider-editorial-card').forEach(card => {
            const radio = card.querySelector('input[type="radio"]');
            if (radio && radio.checked) {
                card.classList.add('selected');
            }
            card.addEventListener('click', () => {
                document.querySelectorAll('.provider-editorial-card').forEach(c => c.classList.remove('selected'));
                card.classList.add('selected');
            });
        });
    </script>
</body>
</html>
