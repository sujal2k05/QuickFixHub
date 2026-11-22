<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sujal.model.Provider"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Professional Service &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
    <style>
        .wizard-step { display: none; }
        .wizard-step.active { display: block; animation: fadeInStep 0.25s ease; }
        @keyframes fadeInStep {
            from { opacity: 0; transform: translateY(6px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .provider-item-label {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 1.15rem 1.35rem;
            border: 2px solid var(--border);
            border-radius: var(--radius-md);
            margin-bottom: 0.85rem;
            cursor: pointer;
            background: var(--white);
            transition: all 0.2s ease;
        }
        .provider-item-label:hover {
            border-color: var(--terracotta);
            box-shadow: var(--shadow-subtle);
            transform: translateY(-2px);
        }
        .provider-item-label.selected {
            border-color: var(--terracotta);
            background: var(--terracotta-subtle);
        }
        .provider-avatar-circle {
            width: 44px;
            height: 44px;
            border-radius: var(--radius-md);
            background: var(--sand-soft);
            color: var(--terracotta);
            border: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: var(--font-serif);
            font-size: 1.25rem;
            font-weight: 700;
            flex-shrink: 0;
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
        <!-- Multi-step Stepper -->
        <div class="qh-stepper">
            <div class="qh-step-node active" id="stepNode1">
                <div class="qh-step-circle">1</div>
                <div class="qh-step-title">Trade & Area</div>
            </div>
            <div class="qh-step-node" id="stepNode2">
                <div class="qh-step-circle">2</div>
                <div class="qh-step-title">Select Partner</div>
            </div>
            <div class="qh-step-node" id="stepNode3">
                <div class="qh-step-circle">3</div>
                <div class="qh-step-title">Confirm & Schedule</div>
            </div>
        </div>

        <div class="qh-card">
            <div class="qh-card-header">
                <div>
                    <span class="qh-hero-tag" id="wizardTag">Direct Booking</span>
                    <h2 class="editorial-heading" style="font-size: 1.45rem;" id="wizardTitle">
                        Reserve a Local Craftsperson
                    </h2>
                    <p class="text-muted" style="font-size: 0.88rem; margin-top: 0.25rem;" id="wizardSubtitle">
                        Fill in your requirements to book verified professionals in your neighborhood
                    </p>
                </div>
            </div>

            <div class="qh-card-body">
                <form method="post" action="bookService" id="bookingForm">
                    <!-- Step 1: Category & Pincode -->
                    <div class="wizard-step active" id="step1">
                        <div class="qh-form-group">
                            <label for="category" class="qh-label">Service Specialization *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-toolbox qh-input-icon"></i>
                                <select name="category" id="category" class="qh-select" required>
                                    <option value="">Select a category</option>
                                    <option value="Plumbing">Plumbing & Sanitary Services</option>
                                    <option value="Electrical">Electrical Works & Wiring</option>
                                    <option value="Carpentry">Carpentry & Custom Woodwork</option>
                                    <option value="Painting">Painting & Surface Finishing</option>
                                    <option value="Cleaning">Deep Home Cleaning</option>
                                    <option value="Appliance Repair">Major Appliance Repair</option>
                                    <option value="HVAC">Heating, Ventilation & Air Conditioning</option>
                                    <option value="Gardening">Lawn & Garden Care</option>
                                    <option value="Pest Control">Eco-Friendly Pest Management</option>
                                    <option value="Other">General Handyman Works</option>
                                </select>
                            </div>
                        </div>

                        <div class="qh-form-group">
                            <label for="pincode" class="qh-label">Service Postal Code (Pincode) *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-location-dot qh-input-icon"></i>
                                <input type="text" name="pincode" id="pincode" class="qh-input"
                                       pattern="[0-9]{6}" required placeholder="e.g. 400050 (6 digits)" maxlength="6">
                            </div>
                        </div>

                        <div style="display: flex; justify-content: flex-end; margin-top: 2rem;">
                            <button type="button" class="qh-btn qh-btn-primary qh-btn-lg next-step">
                                Continue to Partner Selection <i class="fas fa-arrow-right"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Step 2: Select Provider -->
                    <div class="wizard-step" id="step2">
                        <div class="qh-form-group">
                            <label class="qh-label">Select Available Professional *</label>
                            <div id="providersList">
                                <%
                                    List<Provider> providerList = (List<Provider>) request.getAttribute("providerList");
                                    if (providerList != null && !providerList.isEmpty()) {
                                        int i = 0;
                                        for (Provider provider : providerList) {
                                            i++;
                                %>
                                <label class="provider-item-label" for="sp_<%= i %>">
                                    <div style="display: flex; align-items: center; gap: 1rem;">
                                        <div class="provider-avatar-circle">
                                            <%= provider.getName() != null && !provider.getName().isEmpty() ? provider.getName().substring(0, 1).toUpperCase() : "P" %>
                                        </div>
                                        <div>
                                            <div style="font-weight: 700; color: var(--charcoal); font-size: 1.05rem;"><%= provider.getName() %></div>
                                            <div style="font-size: 0.85rem; color: var(--muted); margin-top: 0.2rem;">
                                                <i class="fas fa-phone" style="color: var(--sage); font-size: 0.75rem;"></i> <%= provider.getContact() %> &bull; 
                                                <span class="qh-badge qh-badge-sand" style="font-size: 0.7rem; padding: 0.15rem 0.5rem;"><%= provider.getCategory() %></span>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="radio" id="sp_<%= i %>" name="selectedProvider" style="width: 20px; height: 20px; accent-color: var(--terracotta);"
                                           value="<%= provider.getName() %>,<%= provider.getContact() %>,<%= provider.getCategory() %>" required <%= i == 1 ? "checked" : "" %>>
                                </label>
                                <%
                                        }
                                    } else {
                                %>
                                <div class="qh-empty-state">
                                    <i class="fas fa-magnifying-glass-location qh-empty-icon"></i>
                                    <h3 class="qh-empty-title">Search Matching Providers in Your Area</h3>
                                    <p class="qh-empty-desc">
                                        To query verified professionals registered for your exact location, use our interactive Step-by-Step workflow.
                                    </p>
                                    <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-primary">
                                        <i class="fas fa-calendar-plus"></i> Open Step 1 Booking Flow
                                    </a>
                                </div>
                                <% } %>
                            </div>
                        </div>

                        <div style="display: flex; justify-content: space-between; margin-top: 2rem;">
                            <button type="button" class="qh-btn qh-btn-secondary prev-step">
                                <i class="fas fa-arrow-left"></i> Previous
                            </button>
                            <button type="button" class="qh-btn qh-btn-primary qh-btn-lg next-step">
                                Continue to Schedule <i class="fas fa-arrow-right"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Step 3: Job Description & Schedule -->
                    <div class="wizard-step" id="step3">
                        <div class="qh-form-group">
                            <label for="serviceTitle" class="qh-label">Service Title / Problem Summary *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-wrench qh-input-icon"></i>
                                <input type="text" name="serviceTitle" id="serviceTitle" class="qh-input"
                                       required placeholder="e.g. Kitchen tap leaking and low water pressure">
                            </div>
                        </div>

                        <div class="qh-form-group">
                            <label for="serviceDescription" class="qh-label">Detailed Description of Work *</label>
                            <textarea name="serviceDescription" id="serviceDescription" class="qh-textarea no-icon" rows="4"
                                      required placeholder="Describe the problem, parts needed, or special access instructions..."></textarea>
                        </div>

                        <div class="qh-form-grid-2">
                            <div class="qh-form-group">
                                <label for="date" class="qh-label">Preferred Date *</label>
                                <div class="qh-input-wrap">
                                    <i class="fas fa-calendar-day qh-input-icon"></i>
                                    <input type="date" name="date" id="date" class="qh-input" required>
                                </div>
                            </div>

                            <div class="qh-form-group">
                                <label for="time" class="qh-label">Preferred Time Slot *</label>
                                <div class="qh-input-wrap">
                                    <i class="fas fa-clock qh-input-icon"></i>
                                    <input type="time" name="time" id="time" class="qh-input" required>
                                </div>
                            </div>
                        </div>

                        <div style="display: flex; justify-content: space-between; margin-top: 2rem; padding-top: 1.5rem; border-top: 1px solid var(--border);">
                            <button type="button" class="qh-btn qh-btn-secondary prev-step">
                                <i class="fas fa-arrow-left"></i> Previous
                            </button>
                            <button type="submit" class="qh-btn qh-btn-primary qh-btn-lg">
                                <i class="fas fa-calendar-check"></i> Confirm Booking Request
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <%@ include file="common/footer.jsp" %>

    <script>
        let currentStep = 1;
        const totalSteps = 3;

        function showStep(step) {
            document.querySelectorAll('.wizard-step').forEach((el, index) => {
                el.classList.toggle('active', index + 1 === step);
            });
            for (let i = 1; i <= totalSteps; i++) {
                const node = document.getElementById('stepNode' + i);
                if (node) {
                    node.classList.toggle('active', i === step);
                    node.classList.toggle('completed', i < step);
                }
            }
        }

        document.querySelectorAll('.next-step').forEach(btn => {
            btn.addEventListener('click', () => {
                if (currentStep < totalSteps) {
                    currentStep++;
                    showStep(currentStep);
                }
            });
        });

        document.querySelectorAll('.prev-step').forEach(btn => {
            btn.addEventListener('click', () => {
                if (currentStep > 1) {
                    currentStep--;
                    showStep(currentStep);
                }
            });
        });

        const dateEl = document.getElementById('date');
        if (dateEl) {
            dateEl.min = new Date().toISOString().split('T')[0];
        }
    </script>
</body>
</html>
