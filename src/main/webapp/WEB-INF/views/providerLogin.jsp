<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Partner Sign In &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <div class="qh-auth-page">
        <!-- Left: Form Column -->
        <div class="qh-auth-form-side">
            <div style="margin-bottom: 2.25rem;">
                <a href="${pageContext.request.contextPath}/index" class="qh-brand" style="margin-bottom: 1.5rem;">
                    <div class="qh-brand-mark"><i class="fas fa-hammer"></i></div>
                    <div>
                        <span class="qh-brand-title">QuickFixHub</span>
                        <span class="qh-brand-subtitle">Partner Portal</span>
                    </div>
                </a>
                <span class="qh-hero-tag" style="margin-top: 0.5rem;">Partner Access</span>
                <h1 class="editorial-heading" style="font-size: 2.15rem; margin-top: 0.35rem;">Welcome Back</h1>
                <p class="text-muted" style="font-size: 0.95rem; margin-top: 0.35rem;">
                    Sign in to your professional portal to manage appointments, review customer requests, and track your schedule.
                </p>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="qh-alert qh-alert-error">
                    <i class="fas fa-circle-exclamation"></i>
                    <span><%= request.getAttribute("error") %></span>
                </div>
            <% } %>

            <form action="providerLoginSubmit" method="post" id="providerLoginForm">
                <div class="qh-form-group">
                    <label for="contact" class="qh-label">Registered Phone Number</label>
                    <div class="qh-input-wrap">
                        <i class="fas fa-phone qh-input-icon"></i>
                        <input type="tel" id="contact" name="contact" class="qh-input"
                               placeholder="10-digit mobile number" required pattern="[0-9]{10}" maxlength="10">
                    </div>
                </div>

                <div class="qh-form-group">
                    <label for="password" class="qh-label">Partner Password</label>
                    <div class="qh-input-wrap">
                        <i class="fas fa-lock qh-input-icon"></i>
                        <input type="password" id="password" name="password" class="qh-input"
                               placeholder="Enter your account password" required>
                        <i class="fas fa-eye qh-password-toggle" id="togglePassword"></i>
                    </div>
                </div>

                <button type="submit" class="qh-btn qh-btn-primary qh-btn-full qh-btn-lg" style="margin-top: 1.25rem;">
                    <i class="fas fa-arrow-right-to-bracket"></i> Sign In to Partner Portal
                </button>
            </form>

            <div style="margin-top: 2.25rem; padding-top: 1.5rem; border-top: 1px solid var(--border); font-size: 0.9rem; color: var(--muted); text-align: center;">
                Want to grow your service business? 
                <a href="${pageContext.request.contextPath}/provider_register" style="color: var(--terracotta); font-weight: 600; text-decoration: none;">
                    Apply as a Service Partner
                </a>
            </div>
        </div>

        <!-- Right: Editorial Visual Column -->
        <div class="qh-auth-visual-side" style="background-image: url('https://images.unsplash.com/photo-1581578731548-c64695cc6952?q=80&w=1200&auto=format&fit=crop');">
            <div>
                <span class="qh-hero-tag" style="color: var(--sand-light);">The Craftsman Network</span>
            </div>
            <div class="qh-auth-visual-content">
                <h2 class="editorial-heading" style="color: var(--white); font-size: 2.5rem; line-height: 1.2; margin-bottom: 1rem;">
                    "Empowering skilled professionals with direct, reliable local homeowner clients."
                </h2>
                <p style="color: var(--sand-light); font-size: 1.05rem; line-height: 1.6; max-width: 480px;">
                    Over 500+ verified plumbers, electricians, and technicians manage their daily work orders through QuickFixHub.
                </p>
            </div>
            <div style="font-size: 0.85rem; color: var(--sand); z-index: 2;">
                QuickFixHub Verified Partner Guarantee &bull; Fair Compensation & Local Reach
            </div>
        </div>
    </div>

    <script>
        const togglePassword = document.getElementById('togglePassword');
        const password = document.getElementById('password');
        if (togglePassword && password) {
            togglePassword.addEventListener('click', function () {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        }
    </script>
</body>
</html>
