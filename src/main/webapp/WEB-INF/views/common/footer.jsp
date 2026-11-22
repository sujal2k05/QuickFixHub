<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="qh-footer">
    <div class="qh-footer-inner">
        <div style="display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 3rem; margin-bottom: 2.5rem; flex-wrap: wrap;" class="qh-footer-grid">
            <div>
                <a href="${pageContext.request.contextPath}/index" class="qh-brand" style="margin-bottom: 1rem;">
                    <div class="qh-brand-mark">
                        <i class="fas fa-hammer"></i>
                    </div>
                    <div>
                        <span class="qh-brand-title">QuickFixHub</span>
                        <span class="qh-brand-subtitle">Home Services</span>
                    </div>
                </a>
                <p style="color: var(--muted); font-size: 0.92rem; line-height: 1.6; max-width: 340px; margin-top: 0.85rem;">
                    Your home. Our expertise. Verified, reliable trade professionals delivered to your doorstep with guaranteed craftsmanship and transparent pricing.
                </p>
            </div>

            <div>
                <div style="font-family: var(--font-sans); font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.12em; color: var(--charcoal); margin-bottom: 1.1rem;">
                    Customers
                </div>
                <div style="display: flex; flex-direction: column; gap: 0.65rem; font-size: 0.9rem;">
                    <a href="${pageContext.request.contextPath}/bookServiceStep1" style="color: var(--muted); text-decoration: none; transition: color 0.2s;" onmouseover="this.style.color='var(--terracotta)'" onmouseout="this.style.color='var(--muted)'">Book a Service</a>
                    <a href="${pageContext.request.contextPath}/userlogin" style="color: var(--muted); text-decoration: none; transition: color 0.2s;" onmouseover="this.style.color='var(--terracotta)'" onmouseout="this.style.color='var(--muted)'">Customer Login</a>
                    <a href="${pageContext.request.contextPath}/user_register" style="color: var(--muted); text-decoration: none; transition: color 0.2s;" onmouseover="this.style.color='var(--terracotta)'" onmouseout="this.style.color='var(--muted)'">Create Account</a>
                    <a href="${pageContext.request.contextPath}/searchProvider" style="color: var(--muted); text-decoration: none; transition: color 0.2s;" onmouseover="this.style.color='var(--terracotta)'" onmouseout="this.style.color='var(--muted)'">Find Providers</a>
                </div>
            </div>

            <div>
                <div style="font-family: var(--font-sans); font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.12em; color: var(--charcoal); margin-bottom: 1.1rem;">
                    Partners
                </div>
                <div style="display: flex; flex-direction: column; gap: 0.65rem; font-size: 0.9rem;">
                    <a href="${pageContext.request.contextPath}/providerLogin" style="color: var(--muted); text-decoration: none; transition: color 0.2s;" onmouseover="this.style.color='var(--terracotta)'" onmouseout="this.style.color='var(--muted)'">Provider Login</a>
                    <a href="${pageContext.request.contextPath}/provider_register" style="color: var(--muted); text-decoration: none; transition: color 0.2s;" onmouseover="this.style.color='var(--terracotta)'" onmouseout="this.style.color='var(--muted)'">Join as Partner</a>
                    <a href="${pageContext.request.contextPath}/providerDashboard" style="color: var(--muted); text-decoration: none; transition: color 0.2s;" onmouseover="this.style.color='var(--terracotta)'" onmouseout="this.style.color='var(--muted)'">Partner Dashboard</a>
                </div>
            </div>

            <div>
                <div style="font-family: var(--font-sans); font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.12em; color: var(--charcoal); margin-bottom: 1.1rem;">
                    Platform
                </div>
                <div style="display: flex; flex-direction: column; gap: 0.65rem; font-size: 0.9rem;">
                    <a href="${pageContext.request.contextPath}/adminLogin" style="color: var(--muted); text-decoration: none; transition: color 0.2s;" onmouseover="this.style.color='var(--terracotta)'" onmouseout="this.style.color='var(--muted)'">Admin Console</a>
                    <span style="color: var(--muted-light); font-size: 0.85rem;">Standard Verified Platform</span>
                    <span style="color: var(--sage); font-size: 0.85rem; font-weight: 600;"><i class="fas fa-shield-halved"></i> 100% Quality Guarantee</span>
                </div>
            </div>
        </div>

        <div style="border-top: 1px solid var(--border); padding-top: 1.75rem; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem; font-size: 0.85rem; color: var(--muted);">
            <div>&copy; <%= java.time.Year.now() %> QuickFixHub. Crafted with Warm Editorial Standards. All rights reserved.</div>
            <div style="display: flex; gap: 1.5rem;">
                <span>Privacy</span>
                <span>Terms of Service</span>
                <span>Security</span>
            </div>
        </div>
    </div>
</footer>

<style>
@media (max-width: 900px) {
    .qh-footer-grid {
        grid-template-columns: 1fr 1fr !important;
        gap: 2rem !important;
    }
}
@media (max-width: 500px) {
    .qh-footer-grid {
        grid-template-columns: 1fr !important;
    }
}
</style>
