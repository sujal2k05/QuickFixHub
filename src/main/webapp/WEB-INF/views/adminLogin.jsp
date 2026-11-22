<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Console &mdash; QuickFixHub</title>
    <%@ include file="common/styles.jsp" %>
    <style>
        .qh-admin-card {
            max-width: 480px;
            margin: 4rem auto;
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: var(--radius-xl);
            box-shadow: var(--shadow-card);
            overflow: hidden;
        }
        .qh-admin-header {
            background: var(--charcoal);
            color: var(--white);
            padding: 2.5rem 2.25rem;
            text-align: center;
        }
        .qh-admin-mark {
            width: 54px;
            height: 54px;
            border-radius: var(--radius-md);
            background: var(--terracotta);
            color: var(--white);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.4rem;
            margin-bottom: 1.25rem;
            box-shadow: 0 4px 14px rgba(199, 101, 69, 0.35);
        }
    </style>
</head>
<body>
    <header class="qh-navbar">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/index" class="qh-brand">
                <div class="qh-brand-mark"><i class="fas fa-hammer"></i></div>
                <div>
                    <span class="qh-brand-title">QuickFixHub</span>
                    <span class="qh-brand-subtitle">Operations</span>
                </div>
            </a>
            <div class="qh-nav-actions">
                <a href="${pageContext.request.contextPath}/index" class="qh-btn qh-btn-secondary qh-btn-sm">
                    <i class="fas fa-arrow-left"></i> Home
                </a>
            </div>
        </div>
    </header>

    <main class="qh-container-narrow">
        <div class="qh-admin-card">
            <div class="qh-admin-header">
                <div class="qh-admin-mark">
                    <i class="fas fa-shield-halved"></i>
                </div>
                <h1 class="editorial-heading" style="color: var(--white); font-size: 1.85rem; margin-bottom: 0.35rem;">
                    Admin Console
                </h1>
                <p style="color: var(--sand); font-size: 0.9rem;">
                    Restricted operations access for platform oversight
                </p>
            </div>

            <div style="padding: 2.25rem;">
                <% if (request.getAttribute("errorMsg") != null) { %>
                    <div class="qh-alert qh-alert-error">
                        <i class="fas fa-circle-exclamation"></i>
                        <span><%= request.getAttribute("errorMsg") %></span>
                    </div>
                <% } %>

                <form action="adminLoginSubmit" method="post" id="adminLoginForm">
                    <div class="qh-form-group">
                        <label for="email" class="qh-label">Administrator Email</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-envelope qh-input-icon"></i>
                            <input type="email" id="email" name="email" class="qh-input"
                                   placeholder="admin@quickfixhub.com" required autocomplete="email">
                        </div>
                    </div>

                    <div class="qh-form-group">
                        <label for="password" class="qh-label">Master Password</label>
                        <div class="qh-input-wrap">
                            <i class="fas fa-lock qh-input-icon"></i>
                            <input type="password" id="password" name="password" class="qh-input"
                                   placeholder="Enter admin password" required autocomplete="current-password">
                            <i class="fas fa-eye qh-password-toggle" id="togglePassword"></i>
                        </div>
                    </div>

                    <button type="submit" class="qh-btn qh-btn-primary qh-btn-full qh-btn-lg" style="margin-top: 1.25rem;">
                        <i class="fas fa-key"></i> Authenticate & Enter
                    </button>
                </form>

                <div style="margin-top: 2rem; padding-top: 1.25rem; border-top: 1px solid var(--border); font-size: 0.8rem; color: var(--muted); text-align: center;">
                    QuickFixHub Platform &bull; Authorized Personnel Only
                </div>
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
