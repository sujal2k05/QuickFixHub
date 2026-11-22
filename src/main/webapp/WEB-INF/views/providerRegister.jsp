<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Partner Registration &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <header class="qh-navbar">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/index" class="qh-brand">
                <div class="qh-brand-mark"><i class="fas fa-hammer"></i></div>
                <div>
                    <span class="qh-brand-title">QuickFixHub</span>
                    <span class="qh-brand-subtitle">Partner Onboarding</span>
                </div>
            </a>
            <div class="qh-nav-actions">
                <a href="${pageContext.request.contextPath}/providerLogin" class="qh-btn qh-btn-secondary qh-btn-sm">
                    <i class="fas fa-arrow-right-to-bracket"></i> Partner Sign In
                </a>
            </div>
        </div>
    </header>

    <main class="qh-container-narrow" style="max-width: 920px;">
        <div class="qh-hero-banner" style="padding: 2.5rem; margin-bottom: 2rem;">
            <span class="qh-hero-tag">Join Our Craftsman Network</span>
            <h1 class="qh-hero-title" style="font-size: 2.2rem; margin-bottom: 0.5rem;">Register as a Professional Partner</h1>
            <p class="qh-hero-desc" style="font-size: 0.98rem;">
                Connect with residential homeowners seeking verified plumbers, electricians, carpenters, and technicians. Grow your local reputation and steady service income.
            </p>
        </div>

        <div class="qh-card">
            <div class="qh-card-header">
                <div>
                    <h2 class="editorial-heading" style="font-size: 1.4rem;">Business & Professional Credentials</h2>
                    <p class="text-muted" style="font-size: 0.88rem; margin-top: 0.25rem;">
                        All submissions are manually reviewed by our compliance team before activation
                    </p>
                </div>
            </div>

            <div class="qh-card-body">
                <form action="providerRegisterSubmit" method="post" id="providerRegForm">
                    <!-- Personal / Trade Details -->
                    <h3 class="editorial-heading" style="font-size: 1.15rem; margin-bottom: 1.25rem; color: var(--terracotta);">
                        1. Personal & Contact Details
                    </h3>

                    <div class="qh-form-grid-2">
                        <div class="qh-form-group">
                            <label for="name" class="qh-label">Full Name / Trade Business Name *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-user-tie qh-input-icon"></i>
                                <input type="text" id="name" name="name" class="qh-input"
                                       placeholder="e.g. Ramesh Sharma" required minlength="2">
                            </div>
                        </div>

                        <div class="qh-form-group">
                            <label for="contact" class="qh-label">Direct Phone / Mobile Number *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-phone qh-input-icon"></i>
                                <input type="tel" id="contact" name="contact" class="qh-input"
                                       placeholder="10-digit mobile number" required pattern="[0-9]{10}" maxlength="10">
                            </div>
                        </div>
                    </div>

                    <div class="qh-form-grid-2">
                        <div class="qh-form-group">
                            <label for="email" class="qh-label">Professional Email Address *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-envelope qh-input-icon"></i>
                                <input type="email" id="email" name="email" class="qh-input"
                                       placeholder="provider@example.com" required>
                            </div>
                        </div>

                        <div class="qh-form-group">
                            <label for="age" class="qh-label">Age (Years) *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-calendar-alt qh-input-icon"></i>
                                <input type="number" id="age" name="age" class="qh-input"
                                       placeholder="Minimum age 18" required min="18" max="80">
                            </div>
                        </div>
                    </div>

                    <!-- Operational Location -->
                    <h3 class="editorial-heading" style="font-size: 1.15rem; margin: 1.75rem 0 1.25rem 0; color: var(--terracotta); padding-top: 1.25rem; border-top: 1px solid var(--border);">
                        2. Workshop Address & Service Territory
                    </h3>

                    <div class="qh-form-group">
                        <label for="address" class="qh-label">Business / Workshop Street Address *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-location-dot qh-input-icon"></i>
                            <input type="text" id="address" name="address" class="qh-input"
                                   placeholder="Shop / Unit number, building, street address" required>
                        </div>
                    </div>

                    <div class="qh-form-grid-3">
                        <div class="qh-form-group">
                            <label for="area" class="qh-label">Operational Area *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-map-marked-alt qh-input-icon"></i>
                                <input type="text" id="area" name="area" class="qh-input"
                                       placeholder="e.g. Bandra West" required>
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
                            <label for="pincode" class="qh-label">Base Pincode *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-map-pin qh-input-icon"></i>
                                <input type="text" id="pincode" name="pincode" class="qh-input"
                                       placeholder="6-digit pincode" required pattern="[0-9]{6}" maxlength="6">
                            </div>
                        </div>
                    </div>

                    <!-- Trade Specialization -->
                    <h3 class="editorial-heading" style="font-size: 1.15rem; margin: 1.75rem 0 1.25rem 0; color: var(--terracotta); padding-top: 1.25rem; border-top: 1px solid var(--border);">
                        3. Trade Specialization & Operating Hours
                    </h3>

                    <div class="qh-form-grid-2">
                        <div class="qh-form-group">
                            <label for="category" class="qh-label">Primary Trade Category *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-briefcase qh-input-icon"></i>
                                <select id="category" name="category" class="qh-select" required>
                                    <option value="">Select Primary Trade</option>
                                    <option value="Plumbing">Plumbing & Sanitary</option>
                                    <option value="Electrical">Electrical Works</option>
                                    <option value="Carpentry">Carpentry & Woodwork</option>
                                    <option value="Painting">Painting & Decorating</option>
                                    <option value="Cleaning">Deep Cleaning Services</option>
                                    <option value="Appliance Repair">Appliance Repair</option>
                                    <option value="HVAC">Heating, Ventilation & AC</option>
                                    <option value="Gardening">Landscaping & Gardening</option>
                                    <option value="Pest Control">Pest Control Services</option>
                                    <option value="Other">General Handyman Works</option>
                                </select>
                            </div>
                        </div>

                        <div class="qh-form-group">
                            <label for="serviceType" class="qh-label">Specialization / Core Focus *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-gears qh-input-icon"></i>
                                <input type="text" id="serviceType" name="serviceType" class="qh-input"
                                       placeholder="e.g. Pipe Replacement, RO Water Purifier, Modular Kitchens" required>
                            </div>
                        </div>
                    </div>

                    <div class="qh-form-grid-2">
                        <div class="qh-form-group">
                            <label class="qh-label">Daily Working Hours (Open &mdash; Close) *</label>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.75rem;">
                                <div class="qh-input-wrap">
                                    <i class="fas fa-clock qh-input-icon"></i>
                                    <input type="time" id="openTime" name="openTime" class="qh-input" required title="Opening Time">
                                </div>
                                <div class="qh-input-wrap">
                                    <i class="fas fa-clock qh-input-icon"></i>
                                    <input type="time" id="closeTime" name="closeTime" class="qh-input" required title="Closing Time">
                                </div>
                            </div>
                        </div>

                        <div class="qh-form-group">
                            <label class="qh-label">GPS Coordinates (Optional)</label>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 0.75rem;">
                                <input type="text" id="latitude" name="latitude" class="qh-input no-icon" placeholder="Latitude (e.g. 19.0760)">
                                <input type="text" id="longitude" name="longitude" class="qh-input no-icon" placeholder="Longitude (e.g. 72.8777)">
                            </div>
                        </div>
                    </div>

                    <!-- Security & Password -->
                    <h3 class="editorial-heading" style="font-size: 1.15rem; margin: 1.75rem 0 1.25rem 0; color: var(--terracotta); padding-top: 1.25rem; border-top: 1px solid var(--border);">
                        4. Account Security
                    </h3>

                    <div class="qh-form-group">
                        <label for="password" class="qh-label">Create Secure Password *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-lock qh-input-icon"></i>
                            <input type="password" id="password" name="password" class="qh-input"
                                   placeholder="Create a strong password (minimum 6 characters)" required minlength="6">
                            <i class="fas fa-eye qh-password-toggle" id="togglePassword"></i>
                        </div>
                    </div>

                    <button type="submit" class="qh-btn qh-btn-primary qh-btn-full qh-btn-lg" style="margin-top: 1.5rem;">
                        <i class="fas fa-paper-plane"></i> Submit Partner Application for Review
                    </button>
                </form>
            </div>
            <div class="qh-card-footer" style="text-align: center; font-size: 0.9rem; color: var(--muted);">
                Already a registered QuickFixHub service partner? 
                <a href="${pageContext.request.contextPath}/providerLogin" style="color: var(--terracotta); font-weight: 600; text-decoration: none;">
                    Sign in to your portal
                </a>
            </div>
        </div>
    </main>

    <%@ include file="common/footer.jsp" %>

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
