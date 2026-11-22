<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String providerName = (String) session.getAttribute("providerName");
    String providerContact = (String) session.getAttribute("providerContact");
    String providerCategory = (String) session.getAttribute("providerCategory");
    String pincode = (String) session.getAttribute("pincode");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Step 3: Confirm Booking & Schedule &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
    <style>
        .qh-provider-summary {
            background: var(--sand-soft);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 1.5rem 1.75rem;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1.25rem;
        }
        .qh-provider-lead {
            display: flex;
            align-items: center;
            gap: 1.1rem;
        }
        .qh-provider-avatar {
            width: 52px;
            height: 52px;
            border-radius: var(--radius-md);
            background: var(--terracotta);
            color: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: var(--font-serif);
            font-size: 1.45rem;
            font-weight: 700;
            flex-shrink: 0;
            box-shadow: 0 4px 12px rgba(199, 101, 69, 0.2);
        }
        .qh-provider-meta-pill {
            display: inline-flex;
            align-items: center;
            gap: 0.45rem;
            padding: 0.35rem 0.85rem;
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: var(--radius-full);
            font-size: 0.85rem;
            color: var(--charcoal);
            font-weight: 500;
        }
        .qh-guarantee-note {
            background: var(--sage-light);
            border: 1px solid rgba(132, 144, 120, 0.3);
            border-radius: var(--radius-md);
            padding: 1rem 1.25rem;
            display: flex;
            align-items: flex-start;
            gap: 0.75rem;
            font-size: 0.85rem;
            color: var(--sage-dark);
            margin-top: 1.5rem;
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
        <!-- 3-Step Stepper -->
        <div class="qh-stepper">
            <div class="qh-step-node completed">
                <div class="qh-step-circle"><i class="fas fa-check"></i></div>
                <div class="qh-step-title">Trade & Area</div>
            </div>
            <div class="qh-step-node completed">
                <div class="qh-step-circle"><i class="fas fa-check"></i></div>
                <div class="qh-step-title">Select Partner</div>
            </div>
            <div class="qh-step-node active">
                <div class="qh-step-circle">3</div>
                <div class="qh-step-title">Confirm & Schedule</div>
            </div>
        </div>

        <div class="qh-card">
            <div class="qh-card-header">
                <div>
                    <span class="qh-hero-tag" style="margin-bottom: 0.25rem;">Final Step</span>
                    <h2 class="editorial-heading" style="font-size: 1.45rem;">Appointment Schedule & Work Details</h2>
                    <p class="text-muted" style="font-size: 0.88rem; margin-top: 0.25rem;">
                        Describe your requirements and pick a preferred date and time for service arrival
                    </p>
                </div>
            </div>

            <div class="qh-card-body">
                <!-- Selected Provider Summary Box -->
                <div class="qh-provider-summary">
                    <div class="qh-provider-lead">
                        <div class="qh-provider-avatar">
                            <%= providerName != null && !providerName.isEmpty() ? providerName.substring(0, 1).toUpperCase() : "P" %>
                        </div>
                        <div>
                            <span style="font-size: 0.72rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--terracotta); font-weight: 700; display: block;">
                                Assigned Professional
                            </span>
                            <h3 class="editorial-heading" style="font-size: 1.25rem; margin-top: 0.15rem;">
                                <%= providerName != null ? providerName : "Selected Professional" %>
                            </h3>
                        </div>
                    </div>

                    <div style="display: flex; gap: 0.65rem; flex-wrap: wrap;">
                        <span class="qh-provider-meta-pill">
                            <i class="fas fa-briefcase" style="color: var(--terracotta);"></i>
                            <%= providerCategory != null ? providerCategory : "General" %>
                        </span>
                        <span class="qh-provider-meta-pill">
                            <i class="fas fa-phone" style="color: var(--sage);"></i>
                            <%= providerContact != null ? providerContact : "Verified" %>
                        </span>
                        <span class="qh-provider-meta-pill">
                            <i class="fas fa-location-dot" style="color: var(--amber);"></i>
                            <%= pincode != null ? pincode : "-" %>
                        </span>
                    </div>
                </div>

                <form action="bookService" method="post" id="bookingForm">
                    <div class="qh-form-group">
                        <label for="serviceTitle" class="qh-label">Service Request Title *</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-wrench qh-input-icon"></i>
                            <input type="text" name="serviceTitle" id="serviceTitle" class="qh-input"
                                   required placeholder="e.g. Master bathroom sink drain leakage repair">
                        </div>
                    </div>

                    <div class="qh-form-group">
                        <label for="serviceDescription" class="qh-label">Detailed Description of Work *</label>
                        <textarea name="serviceDescription" id="serviceDescription" class="qh-textarea no-icon" rows="4"
                                  required placeholder="Describe the issue in detail: symptoms, parts needing replacement, or specific instructions for the technician..."></textarea>
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
                            <label for="time" class="qh-label">Preferred Arrival Time *</label>
                            <div class="qh-input-wrap">
                                <i class="fas fa-clock qh-input-icon"></i>
                                <input type="time" name="time" id="time" class="qh-input" required>
                            </div>
                        </div>
                    </div>

                    <div class="qh-guarantee-note">
                        <i class="fas fa-shield-halved" style="font-size: 1.15rem; margin-top: 0.1rem; flex-shrink: 0;"></i>
                        <div>
                            <strong>QuickFixHub Guarantee:</strong> All partner visits follow rigorous quality and safety protocols. You only pay after work completion, with transparent pricing and standard service warranty.
                        </div>
                    </div>

                    <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 2rem; padding-top: 1.5rem; border-top: 1px solid var(--border); flex-wrap: wrap; gap: 1rem;">
                        <a href="javascript:history.back()" class="qh-btn qh-btn-secondary">
                            <i class="fas fa-arrow-left"></i> Back to Providers
                        </a>
                        <button type="submit" class="qh-btn qh-btn-primary qh-btn-lg">
                            <i class="fas fa-calendar-check"></i> Confirm & Book Appointment
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <%@ include file="common/footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const dateInput = document.getElementById('date');
            if (dateInput) {
                const today = new Date().toISOString().split('T')[0];
                dateInput.min = today;
            }
        });
    </script>
</body>
</html>
