<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Customer Account &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <div class="qh-auth-page">
        <!-- Form Side -->
        <div class="qh-auth-form-side" style="max-width: 680px; padding: 2.5rem 3.5rem;">
            <div style="margin-bottom: 1.75rem;">
                <a href="${pageContext.request.contextPath}/index" class="qh-brand">
                    <div class="qh-brand-mark">
                        <i class="fas fa-hammer"></i>
                    </div>
                    <div>
                        <span class="qh-brand-title">QuickFixHub</span>
                        <span class="qh-brand-subtitle">New Customer</span>
                    </div>
                </a>
            </div>

            <div style="margin-bottom: 1.75rem;">
                <h1 style="font-size: 2.2rem; color: var(--charcoal); margin-bottom: 0.35rem;">Create an Account</h1>
                <p style="color: var(--muted); font-size: 0.95rem;">Join India's curated on-demand home maintenance community</p>
            </div>

            <form action="userRegisterSubmit" method="post" id="registrationForm">
                <div class="qh-form-grid-2">
                    <div class="qh-form-group">
                        <label for="name" class="qh-label">Full Name *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-user qh-input-icon"></i>
                            <input type="text" id="name" name="name" class="qh-input"
                                   placeholder="e.g. Rahul Sharma" required minlength="2">
                        </div>
                    </div>

                    <div class="qh-form-group">
                        <label for="contact" class="qh-label">Mobile Number *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-phone qh-input-icon"></i>
                            <input type="tel" id="contact" name="contact" class="qh-input"
                                   placeholder="10-digit number" required pattern="[0-9]{10}" maxlength="10">
                        </div>
                    </div>
                </div>

                <div class="qh-form-grid-2">
                    <div class="qh-form-group">
                        <label for="email" class="qh-label">Email Address *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-envelope qh-input-icon"></i>
                            <input type="email" id="email" name="email" class="qh-input"
                                   placeholder="name@example.com" required>
                        </div>
                    </div>

                    <div class="qh-form-group">
                        <label for="dob" class="qh-label">Date of Birth *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-calendar qh-input-icon"></i>
                            <input type="date" id="dob" name="dob" class="qh-input" required>
                        </div>
                    </div>
                </div>

                <div class="qh-form-group">
                    <label for="address" class="qh-label">Street Address *</label>
                    <div class="qh-input-wrap">
                        <i class="fas fa-house qh-input-icon"></i>
                        <input type="text" id="address" name="address" class="qh-input"
                               placeholder="Flat/House No., Building, Street" required>
                    </div>
                </div>

                <div class="qh-form-grid-3">
                    <div class="qh-form-group">
                        <label for="area" class="qh-label">Area / Locality *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-location-dot qh-input-icon"></i>
                            <input type="text" id="area" name="area" class="qh-input"
                                   placeholder="e.g. Bandra" required>
                        </div>
                    </div>

                    <div class="qh-form-group">
                        <label for="city" class="qh-label">City *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-city qh-input-icon"></i>
                            <input type="text" id="city" name="city" class="qh-input"
                                   placeholder="e.g. Mumbai" required>
                        </div>
                    </div>

                    <div class="qh-form-group">
                        <label for="pincode" class="qh-label">Pincode *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-map-pin qh-input-icon"></i>
                            <input type="text" id="pincode" name="pincode" class="qh-input"
                                   placeholder="6 digits" required pattern="[0-9]{6}" maxlength="6">
                        </div>
                    </div>
                </div>

                <div class="qh-form-group">
                    <label for="password" class="qh-label">Account Password *</label>
                    <div class="qh-input-wrap">
                        <i class="fas fa-lock qh-input-icon"></i>
                        <input type="password" id="password" name="password" class="qh-input"
                               placeholder="Create a strong password" required minlength="6">
                        <i class="fas fa-eye qh-password-toggle" id="togglePassword"></i>
                    </div>
                </div>

                <button type="submit" class="qh-btn qh-btn-primary qh-btn-full qh-btn-lg" style="margin-top: 0.75rem;">
                    Complete Registration
                </button>
            </form>

            <div style="margin-top: 1.75rem; padding-top: 1.25rem; border-top: 1px solid var(--border); font-size: 0.92rem; color: var(--muted);">
                Already registered with QuickFixHub?
                <a href="${pageContext.request.contextPath}/userlogin" style="color: var(--terracotta); font-weight: 600; text-decoration: none;">Sign in to your account</a>
            </div>
        </div>

        <!-- Visual Side -->
        <div class="qh-auth-visual-side" style="background-image: url('https://images.unsplash.com/photo-1607472586893-edb57bdc0e39?auto=format&fit=crop&w=1200&q=80');">
            <div class="qh-auth-visual-content">
                <span class="qh-badge qh-badge-sand" style="background: rgba(255, 255, 255, 0.2); color: white; border: none; backdrop-filter: blur(8px);">
                    Craftsmanship First
                </span>
            </div>

            <div class="qh-auth-visual-content">
                <blockquote style="font-family: var(--font-serif); font-size: 2rem; line-height: 1.3; margin-bottom: 1.5rem; font-style: italic;">
                    "Fixing everyday issues before they become home emergencies."
                </blockquote>
                <div style="font-size: 0.95rem; color: #EEE;">
                    Access top-rated specialists in your exact pincode in 3 effortless clicks.
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
