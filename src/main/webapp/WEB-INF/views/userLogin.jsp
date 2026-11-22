<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Sign In &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <div class="qh-auth-page">
        <!-- Form Side -->
        <div class="qh-auth-form-side">
            <div style="margin-bottom: 2.25rem;">
                <a href="${pageContext.request.contextPath}/index" class="qh-brand">
                    <div class="qh-brand-mark">
                        <i class="fas fa-hammer"></i>
                    </div>
                    <div>
                        <span class="qh-brand-title">QuickFixHub</span>
                        <span class="qh-brand-subtitle">Customer Portal</span>
                    </div>
                </a>
            </div>

            <div style="margin-bottom: 2rem;">
                <h1 style="font-size: 2.25rem; color: var(--charcoal); margin-bottom: 0.4rem;">Welcome back</h1>
                <p style="color: var(--muted); font-size: 0.95rem;">Enter your mobile number and password to access your bookings</p>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="qh-alert qh-alert-error">
                    <i class="fas fa-circle-exclamation" style="font-size: 1.1rem;"></i>
                    <div><%= request.getAttribute("error") %></div>
                </div>
            <% } %>

            <form action="userLoginSubmit" method="post" id="loginForm">
                <div class="qh-form-group">
                    <label for="contact" class="qh-label">Registered Mobile Number</label>
                    <div class="qh-input-wrap">
                        <i class="fas fa-phone qh-input-icon"></i>
                        <input type="tel" id="contact" name="contact" class="qh-input"
                               placeholder="10-digit mobile number" required pattern="[0-9]{10}" maxlength="10" autocomplete="tel">
                    </div>
                </div>

                <div class="qh-form-group">
                    <label for="password" class="qh-label">Password</label>
                    <div class="qh-input-wrap">
                        <i class="fas fa-lock qh-input-icon"></i>
                        <input type="password" id="password" name="password" class="qh-input"
                               placeholder="Enter your account password" required autocomplete="current-password">
                        <i class="fas fa-eye qh-password-toggle" id="togglePassword"></i>
                    </div>
                </div>

                <button type="submit" class="qh-btn qh-btn-primary qh-btn-full qh-btn-lg" style="margin-top: 1rem;">
                    Sign In to Dashboard
                </button>
            </form>

            <div style="margin-top: 2.25rem; padding-top: 1.75rem; border-top: 1px solid var(--border); font-size: 0.92rem; color: var(--muted);">
                New to QuickFixHub?
                <a href="${pageContext.request.contextPath}/user_register" style="color: var(--terracotta); font-weight: 600; text-decoration: none;">Create a Customer Account</a>
            </div>

            <div style="margin-top: 1rem;">
                <a href="${pageContext.request.contextPath}/index" style="color: var(--muted); text-decoration: none; font-size: 0.85rem; display: inline-flex; align-items: center; gap: 0.4rem;">
                    <i class="fas fa-arrow-left"></i> Return to Homepage
                </a>
            </div>
        </div>

        <!-- Visual Split Side with Warm Photography -->
        <div class="qh-auth-visual-side" style="background-image: url('https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&w=1200&q=80');">
            <div class="qh-auth-visual-content">
                <span class="qh-badge qh-badge-sand" style="background: rgba(255, 255, 255, 0.2); color: white; border: none; backdrop-filter: blur(8px);">
                    QuickFixHub Guarantee
                </span>
            </div>

            <div class="qh-auth-visual-content">
                <blockquote style="font-family: var(--font-serif); font-size: 2rem; line-height: 1.3; margin-bottom: 1.5rem; font-style: italic;">
                    "Reliable, skilled hands for every corner of your home."
                </blockquote>
                <div style="display: flex; align-items: center; gap: 0.85rem;">
                    <div style="width: 40px; height: 40px; border-radius: 50%; background: var(--terracotta); display: flex; align-items: center; justify-content: center; font-weight: 700;">
                        QF
                    </div>
                    <div>
                        <div style="font-weight: 600; font-size: 0.95rem;">Curated Trade Network</div>
                        <div style="font-size: 0.82rem; color: #DDD;">Over 5,000+ happy homes served</div>
                    </div>
                </div>
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
