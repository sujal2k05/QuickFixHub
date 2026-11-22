<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Verified Professionals &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>
    <header class="qh-navbar">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/index" class="qh-brand">
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

    <main class="qh-container-narrow">
        <div class="qh-hero-banner" style="padding: 2.25rem 2rem; margin-bottom: 2rem;">
            <span class="qh-hero-tag">Directory Search</span>
            <h1 class="qh-hero-title" style="font-size: 2rem; margin-bottom: 0.5rem;">Find Service Experts Near You</h1>
            <p class="qh-hero-desc" style="font-size: 0.95rem;">
                Browse certified plumbers, electricians, carpenters, and technicians registered in your municipal pincode.
            </p>
        </div>

        <div class="qh-card">
            <div class="qh-card-header">
                <div>
                    <h2 class="editorial-heading" style="font-size: 1.35rem;">Locate Registered Partners</h2>
                    <p class="text-muted" style="font-size: 0.88rem; margin-top: 0.2rem;">
                        Select trade specialization and enter your 6-digit postal code
                    </p>
                </div>
            </div>

            <div class="qh-card-body">
                <form action="providerList" method="post">
                    <div class="qh-form-group">
                        <label for="category" class="qh-label">Trade Specialization *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-briefcase qh-input-icon"></i>
                            <select name="category" id="category" class="qh-select" required>
                                <option value="">Select Service Category</option>
                                <option value="Plumbing">Plumbing & Sanitary Works</option>
                                <option value="Electrical">Electrical Works & Wiring</option>
                                <option value="Carpentry">Carpentry & Cabinetry</option>
                                <option value="Painting">Painting & Surface Coating</option>
                                <option value="Cleaning">Deep Home Cleaning</option>
                                <option value="Appliance Repair">Major Appliance Repair</option>
                                <option value="HVAC">Heating, Ventilation & Air Conditioning</option>
                                <option value="Gardening">Lawn & Garden Care</option>
                                <option value="Pest Control">Pest Control & Extermination</option>
                                <option value="Other">General Maintenance & Handyman</option>
                            </select>
                        </div>
                    </div>

                    <div class="qh-form-group">
                        <label for="pincode" class="qh-label">6-Digit Location Pincode *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-location-dot qh-input-icon"></i>
                            <input type="text" name="pincode" id="pincode" class="qh-input"
                                   pattern="[0-9]{6}" required placeholder="e.g. 400050" maxlength="6">
                        </div>
                    </div>

                    <button type="submit" class="qh-btn qh-btn-primary qh-btn-full qh-btn-lg" style="margin-top: 0.75rem;">
                        <i class="fas fa-magnifying-glass"></i> Search Available Technicians
                    </button>
                </form>
            </div>
        </div>
    </main>

    <%@ include file="common/footer.jsp" %>
</body>
</html>
