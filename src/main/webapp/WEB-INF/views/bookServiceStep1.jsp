<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Step 1: Choose Trade & Pincode &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
</head>
<body>

    <header class="qh-navbar">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/userDashboard" class="qh-brand">
                <div class="qh-brand-mark"><i class="fas fa-hammer"></i></div>
                <div>
                    <span class="qh-brand-title">QuickFixHub</span>
                    <span class="qh-brand-subtitle">Step 1 of 3</span>
                </div>
            </a>
            <div class="qh-nav-actions">
                <a href="${pageContext.request.contextPath}/userDashboard" class="qh-btn qh-btn-secondary qh-btn-sm">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>
        </div>
    </header>

    <main class="qh-container-narrow">
        <!-- Editorial 3-Step Stepper -->
        <div class="qh-stepper">
            <div class="qh-step-node active">
                <div class="qh-step-circle">1</div>
                <div class="qh-step-title">Trade & Area</div>
            </div>
            <div class="qh-step-node">
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
                        Initial Step
                    </div>
                    <h2 style="font-size: 1.6rem; color: var(--charcoal);">Select Service Category</h2>
                    <p style="font-size: 0.88rem; color: var(--muted); margin-top: 0.2rem;">
                        We will locate certified professionals registered in your exact pincode.
                    </p>
                </div>
            </div>

            <div class="qh-card-body">
                <form action="providerList" method="post" id="step1Form">
                    <div class="qh-form-group">
                        <label for="category" class="qh-label">Service Trade / Category *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-toolbox qh-input-icon"></i>
                            <select name="category" id="category" class="qh-select" required>
                                <option value="">Select a trade category</option>
                                <option value="Plumbing">Plumbing (Pipes, Taps, Leakages)</option>
                                <option value="Electrical">Electrical (Wiring, Lights, Switches)</option>
                                <option value="Carpentry">Carpentry (Woodwork, Furniture, Locks)</option>
                                <option value="Painting">Painting (Interior, Exterior, Touchups)</option>
                                <option value="Cleaning">Cleaning (Deep Cleaning, Kitchen, Bath)</option>
                                <option value="Appliance Repair">Appliance Repair (AC, Fridge, Washing Mach.)</option>
                                <option value="HVAC">HVAC (Heating & Air Conditioning)</option>
                                <option value="Gardening">Gardening & Landscaping</option>
                                <option value="Pest Control">Pest Control & Sanitization</option>
                                <option value="Other">Other Home Services</option>
                            </select>
                        </div>
                    </div>

                    <div class="qh-form-group">
                        <label for="pincode" class="qh-label">Service Location Pincode *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-map-pin qh-input-icon"></i>
                            <input type="text" name="pincode" id="pincode" class="qh-input"
                                   pattern="[0-9]{6}" required placeholder="6-digit postal code" maxlength="6"
                                   title="Please enter a valid 6-digit postal code">
                        </div>
                        <div style="font-size: 0.82rem; color: var(--muted); margin-top: 0.35rem;">
                            <i class="fas fa-info-circle"></i> Service partners located in or serving this postal code will be queried.
                        </div>
                    </div>

                    <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 2rem; padding-top: 1.5rem; border-top: 1px solid var(--border);">
                        <a href="${pageContext.request.contextPath}/userDashboard" class="qh-btn qh-btn-secondary">
                            Cancel
                        </a>
                        <button type="submit" class="qh-btn qh-btn-primary qh-btn-lg">
                            Find Available Providers <i class="fas fa-arrow-right"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <%@ include file="common/footer.jsp" %>
</body>
</html>
