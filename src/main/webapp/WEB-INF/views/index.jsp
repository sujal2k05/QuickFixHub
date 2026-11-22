<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickFixHub &mdash; Your Home. Our Expertise.</title>
    <%@ include file="common/styles.jsp" %>
    <style>
        .editorial-hero {
            padding: 4.5rem 0 3.5rem 0;
            display: grid;
            grid-template-columns: 1.15fr 0.85fr;
            gap: 3.5rem;
            align-items: center;
        }
        .hero-tagline {
            display: inline-flex;
            align-items: center;
            gap: 0.6rem;
            background-color: var(--sand-soft);
            border: 1px solid var(--border);
            color: var(--terracotta);
            padding: 0.4rem 1rem;
            border-radius: var(--radius-full);
            font-size: 0.82rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.12em;
            margin-bottom: 1.5rem;
        }
        .hero-heading {
            font-size: 3.8rem;
            line-height: 1.1;
            margin-bottom: 1.35rem;
            color: var(--charcoal);
            letter-spacing: -0.025em;
        }
        .hero-subheading {
            font-size: 1.15rem;
            color: var(--muted);
            line-height: 1.65;
            margin-bottom: 2.25rem;
            max-width: 520px;
        }
        .hero-image-frame {
            position: relative;
            border-radius: var(--radius-xl);
            overflow: hidden;
            border: 1px solid var(--border);
            box-shadow: var(--shadow-elevated);
            height: 480px;
            background-color: var(--sand-soft);
        }
        .hero-image-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }
        .hero-stat-floating {
            position: absolute;
            bottom: 24px;
            left: 24px;
            background: rgba(255, 255, 255, 0.94);
            backdrop-filter: blur(10px);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 1rem 1.35rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            box-shadow: var(--shadow-card);
        }
        .service-editorial-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            overflow: hidden;
            text-decoration: none;
            color: inherit;
            transition: all 0.25s ease;
            display: flex;
            flex-direction: column;
            box-shadow: var(--shadow-subtle);
        }
        .service-editorial-card:hover {
            transform: translateY(-4px);
            border-color: var(--terracotta);
            box-shadow: var(--shadow-card);
        }
        .service-card-img {
            height: 170px;
            overflow: hidden;
            background-color: var(--sand-soft);
        }
        .service-card-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }
        .service-editorial-card:hover .service-card-img img {
            transform: scale(1.05);
        }
        .service-card-content {
            padding: 1.35rem;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }
        .portal-editorial-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1.5rem;
            margin: 3.5rem 0;
        }
        .step-block {
            padding: 2rem 1.75rem;
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            position: relative;
        }
        .step-num {
            font-family: var(--font-serif);
            font-size: 2.75rem;
            color: var(--sand);
            line-height: 1;
            margin-bottom: 0.75rem;
        }
        @media (max-width: 1024px) {
            .editorial-hero { grid-template-columns: 1fr; gap: 2.5rem; }
            .hero-image-frame { height: 360px; }
            .portal-editorial-grid { grid-template-columns: 1fr; }
        }
        @media (max-width: 768px) {
            .hero-heading { font-size: 2.6rem; }
        }
    </style>
</head>
<body>

    <!-- Header Navigation -->
    <header class="qh-navbar">
        <div class="qh-navbar-inner">
            <a href="${pageContext.request.contextPath}/index" class="qh-brand">
                <div class="qh-brand-mark">
                    <i class="fas fa-hammer"></i>
                </div>
                <div>
                    <span class="qh-brand-title">QuickFixHub</span>
                    <span class="qh-brand-subtitle">Home Services</span>
                </div>
            </a>

            <ul class="qh-nav-menu">
                <li><a href="#services" class="qh-nav-link">Services</a></li>
                <li><a href="#howItWorks" class="qh-nav-link">How It Works</a></li>
                <li><a href="#whyChooseUs" class="qh-nav-link">Why Us</a></li>
                <li><a href="${pageContext.request.contextPath}/searchProvider" class="qh-nav-link">Find Providers</a></li>
            </ul>

            <div class="qh-nav-actions">
                <a href="${pageContext.request.contextPath}/userlogin" class="qh-btn qh-btn-outline qh-btn-sm">
                    Customer Sign In
                </a>
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-primary qh-btn-sm">
                    Book a Service
                </a>
            </div>
        </div>
    </header>

    <main class="qh-container">
        <!-- Hero Section -->
        <section class="editorial-hero">
            <div>
                <div class="hero-tagline">
                    <i class="fas fa-compass"></i> Trusted On-Demand Craftsmanship
                </div>
                <h1 class="hero-heading font-serif">
                    Your Home.<br>Our Expertise.
                </h1>
                <p class="hero-subheading font-sans">
                    A thoughtfully curated marketplace connecting homeowners with verified plumbers, electricians, carpenters, painters, and maintenance specialists.
                </p>

                <div style="display: flex; gap: 1rem; flex-wrap: wrap; align-items: center;">
                    <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-primary qh-btn-lg">
                        <i class="fas fa-calendar-check"></i> Book a Service
                    </a>
                    <a href="${pageContext.request.contextPath}/provider_register" class="qh-btn qh-btn-secondary qh-btn-lg">
                        <i class="fas fa-handshake"></i> Become a Partner
                    </a>
                </div>

                <div style="display: flex; align-items: center; gap: 2rem; margin-top: 2.75rem; padding-top: 1.75rem; border-top: 1px solid var(--border);">
                    <div>
                        <div style="font-family: var(--font-serif); font-size: 1.6rem; color: var(--charcoal); font-weight: 700;">100%</div>
                        <div style="font-size: 0.8rem; color: var(--muted); text-transform: uppercase; letter-spacing: 0.08em;">Vetted Pros</div>
                    </div>
                    <div style="width: 1px; height: 32px; background: var(--border);"></div>
                    <div>
                        <div style="font-family: var(--font-serif); font-size: 1.6rem; color: var(--charcoal); font-weight: 700;">4.9 / 5</div>
                        <div style="font-size: 0.8rem; color: var(--muted); text-transform: uppercase; letter-spacing: 0.08em;">Customer Rating</div>
                    </div>
                    <div style="width: 1px; height: 32px; background: var(--border);"></div>
                    <div>
                        <div style="font-family: var(--font-serif); font-size: 1.6rem; color: var(--charcoal); font-weight: 700;">Instant</div>
                        <div style="font-size: 0.8rem; color: var(--muted); text-transform: uppercase; letter-spacing: 0.08em;">Confirmation</div>
                    </div>
                </div>
            </div>

            <!-- Hero Photography Frame -->
            <div class="hero-image-frame">
                <img src="https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&w=1000&q=80" alt="Home Repair Professional" loading="eager">
                <div class="hero-stat-floating">
                    <div style="width: 44px; height: 44px; border-radius: var(--radius-md); background: var(--sage-light); color: var(--sage); display: flex; align-items: center; justify-content: center; font-size: 1.25rem;">
                        <i class="fas fa-shield-halved"></i>
                    </div>
                    <div>
                        <div style="font-weight: 700; font-size: 0.95rem; color: var(--charcoal);">Guaranteed Standard</div>
                        <div style="font-size: 0.8rem; color: var(--muted);">Fair upfront pricing on every fix</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Role Portals Switcher -->
        <section style="margin: 3.5rem 0;">
            <div style="text-align: center; max-width: 600px; margin: 0 auto 2.5rem auto;">
                <div style="font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.14em; color: var(--terracotta); margin-bottom: 0.5rem;">
                    Platform Access
                </div>
                <h2 style="font-size: 2.2rem; color: var(--charcoal);">Select Your Portal</h2>
                <p style="color: var(--muted); font-size: 0.95rem; margin-top: 0.5rem;">
                    Dedicated workspaces tailored for customers, verified partners, and administrative staff.
                </p>
            </div>

            <div class="portal-editorial-grid">
                <!-- Customer Card -->
                <a href="${pageContext.request.contextPath}/userlogin" class="qh-nav-card" style="border-top: 4px solid var(--terracotta);">
                    <div class="qh-nav-card-icon" style="background: var(--terracotta-light); color: var(--terracotta);">
                        <i class="fas fa-user"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Customer Portal</h3>
                    <p class="qh-nav-card-desc">
                        Explore local providers by trade and pincode, book appointments with vetted technicians, and monitor status.
                    </p>
                    <div class="qh-nav-card-action">
                        <span>Sign In as Customer</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <!-- Provider Card -->
                <a href="${pageContext.request.contextPath}/providerLogin" class="qh-nav-card active-sage" style="border-top: 4px solid var(--sage);">
                    <div class="qh-nav-card-icon" style="background: var(--sage-light); color: var(--sage);">
                        <i class="fas fa-briefcase"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Provider Portal</h3>
                    <p class="qh-nav-card-desc">
                        Accept incoming job requests, check daily appointments, manage weekly dispatch timelines, and grow your local client base.
                    </p>
                    <div class="qh-nav-card-action" style="color: var(--sage);">
                        <span>Sign In as Provider</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <!-- Admin Card -->
                <a href="${pageContext.request.contextPath}/adminLogin" class="qh-nav-card" style="border-top: 4px solid var(--charcoal);">
                    <div class="qh-nav-card-icon" style="background: var(--sand-soft); color: var(--charcoal);">
                        <i class="fas fa-shield-halved"></i>
                    </div>
                    <h3 class="qh-nav-card-title">Admin Console</h3>
                    <p class="qh-nav-card-desc">
                        Review and approve partner applications, inspect customer registries, monitor service quality, and govern compliance.
                    </p>
                    <div class="qh-nav-card-action" style="color: var(--charcoal);">
                        <span>Sign In as Admin</span>
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>
            </div>
        </section>

        <!-- Service Discovery / Popular Services -->
        <section id="services" style="margin: 4.5rem 0;">
            <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 2.25rem; flex-wrap: wrap; gap: 1rem;">
                <div>
                    <div style="font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.14em; color: var(--terracotta); margin-bottom: 0.4rem;">
                        Our Specializations
                    </div>
                    <h2 style="font-size: 2.2rem; color: var(--charcoal);">Curated Trade Services</h2>
                </div>
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-outline qh-btn-sm">
                    View All Services <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 1.5rem;">
                <!-- Plumbing -->
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="service-editorial-card">
                    <div class="service-card-img">
                        <img src="https://images.unsplash.com/photo-1607472586893-edb57bdc0e39?auto=format&fit=crop&w=600&q=80" alt="Plumbing Service">
                    </div>
                    <div class="service-card-content">
                        <div style="font-family: var(--font-serif); font-size: 1.25rem; color: var(--charcoal); margin-bottom: 0.35rem;">Plumbing</div>
                        <p style="font-size: 0.88rem; color: var(--muted); line-height: 1.5; margin-bottom: 1rem; flex-grow: 1;">
                            Pipe repairs, tap leakage replacements, fixture installations, and whole-house drain clearing.
                        </p>
                        <div style="font-size: 0.85rem; font-weight: 600; color: var(--terracotta); display: flex; align-items: center; justify-content: space-between;">
                            <span>Book Plumber</span>
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>

                <!-- Electrical -->
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="service-editorial-card">
                    <div class="service-card-img">
                        <img src="https://images.unsplash.com/photo-1621905251189-08b45d6a269e?auto=format&fit=crop&w=600&q=80" alt="Electrical Work">
                    </div>
                    <div class="service-card-content">
                        <div style="font-family: var(--font-serif); font-size: 1.25rem; color: var(--charcoal); margin-bottom: 0.35rem;">Electrical</div>
                        <p style="font-size: 0.88rem; color: var(--muted); line-height: 1.5; margin-bottom: 1rem; flex-grow: 1;">
                            Circuit breaker troubleshooting, switchboard repairs, ceiling fan fitting, and safety rewiring.
                        </p>
                        <div style="font-size: 0.85rem; font-weight: 600; color: var(--terracotta); display: flex; align-items: center; justify-content: space-between;">
                            <span>Book Electrician</span>
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>

                <!-- Carpentry -->
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="service-editorial-card">
                    <div class="service-card-img">
                        <img src="https://images.unsplash.com/photo-1533090161767-e6ffed986b88?auto=format&fit=crop&w=600&q=80" alt="Carpentry Services">
                    </div>
                    <div class="service-card-content">
                        <div style="font-family: var(--font-serif); font-size: 1.25rem; color: var(--charcoal); margin-bottom: 0.35rem;">Carpentry</div>
                        <p style="font-size: 0.88rem; color: var(--muted); line-height: 1.5; margin-bottom: 1rem; flex-grow: 1;">
                            Custom woodwork, door latch repairs, wardrobe hinge adjustments, and bespoke furniture repairs.
                        </p>
                        <div style="font-size: 0.85rem; font-weight: 600; color: var(--terracotta); display: flex; align-items: center; justify-content: space-between;">
                            <span>Book Carpenter</span>
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>

                <!-- Painting -->
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="service-editorial-card">
                    <div class="service-card-img">
                        <img src="https://images.unsplash.com/photo-1589939705384-5185137a7f0f?auto=format&fit=crop&w=600&q=80" alt="House Painting">
                    </div>
                    <div class="service-card-content">
                        <div style="font-family: var(--font-serif); font-size: 1.25rem; color: var(--charcoal); margin-bottom: 0.35rem;">Painting</div>
                        <p style="font-size: 0.88rem; color: var(--muted); line-height: 1.5; margin-bottom: 1rem; flex-grow: 1;">
                            Accent walls, full interior repainting, exterior waterproofing, and damage touch-up coating.
                        </p>
                        <div style="font-size: 0.85rem; font-weight: 600; color: var(--terracotta); display: flex; align-items: center; justify-content: space-between;">
                            <span>Book Painter</span>
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>

                <!-- Cleaning -->
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="service-editorial-card">
                    <div class="service-card-img">
                        <img src="https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&w=600&q=80" alt="Deep Cleaning">
                    </div>
                    <div class="service-card-content">
                        <div style="font-family: var(--font-serif); font-size: 1.25rem; color: var(--charcoal); margin-bottom: 0.35rem;">Deep Cleaning</div>
                        <p style="font-size: 0.88rem; color: var(--muted); line-height: 1.5; margin-bottom: 1rem; flex-grow: 1;">
                            Thorough sanitization of kitchens, bathrooms, sofas, and full post-renovation home cleaning.
                        </p>
                        <div style="font-size: 0.85rem; font-weight: 600; color: var(--terracotta); display: flex; align-items: center; justify-content: space-between;">
                            <span>Book Cleaning</span>
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>

                <!-- Appliance Repair -->
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="service-editorial-card">
                    <div class="service-card-img">
                        <img src="https://images.unsplash.com/photo-1584622650111-993a426fbf0a?auto=format&fit=crop&w=600&q=80" alt="Appliance Repair">
                    </div>
                    <div class="service-card-content">
                        <div style="font-family: var(--font-serif); font-size: 1.25rem; color: var(--charcoal); margin-bottom: 0.35rem;">Appliance Repair</div>
                        <p style="font-size: 0.88rem; color: var(--muted); line-height: 1.5; margin-bottom: 1rem; flex-grow: 1;">
                            AC gas refilling, refrigerator diagnostics, washing machine motor repair, and microwave maintenance.
                        </p>
                        <div style="font-size: 0.85rem; font-weight: 600; color: var(--terracotta); display: flex; align-items: center; justify-content: space-between;">
                            <span>Book Technician</span>
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>
            </div>
        </section>

        <!-- How It Works Section -->
        <section id="howItWorks" style="margin: 5rem 0; padding: 4rem 2.5rem; background-color: var(--white); border-radius: var(--radius-xl); border: 1px solid var(--border);">
            <div style="text-align: center; max-width: 600px; margin: 0 auto 3rem auto;">
                <div style="font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.14em; color: var(--terracotta); margin-bottom: 0.5rem;">
                    Simplicity & Speed
                </div>
                <h2 style="font-size: 2.3rem; color: var(--charcoal);">How QuickFixHub Works</h2>
                <p style="color: var(--muted); font-size: 0.95rem; margin-top: 0.5rem;">
                    Book your fix in three simple steps without lengthy phone calls or guesswork.
                </p>
            </div>

            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 2rem;">
                <div class="step-block">
                    <div class="step-num">01</div>
                    <h3 style="font-family: var(--font-serif); font-size: 1.35rem; margin-bottom: 0.6rem;">Choose Service & Area</h3>
                    <p style="font-size: 0.9rem; color: var(--muted); line-height: 1.6;">
                        Select your trade specialty (Plumbing, Electrical, Carpentry, etc.) and specify your 6-digit postal code.
                    </p>
                </div>

                <div class="step-block">
                    <div class="step-num">02</div>
                    <h3 style="font-family: var(--font-serif); font-size: 1.35rem; margin-bottom: 0.6rem;">Select Verified Partner</h3>
                    <p style="font-size: 0.9rem; color: var(--muted); line-height: 1.6;">
                        Review certified local professionals operating in your neighborhood, complete with credentials and contact numbers.
                    </p>
                </div>

                <div class="step-block">
                    <div class="step-num">03</div>
                    <h3 style="font-family: var(--font-serif); font-size: 1.35rem; margin-bottom: 0.6rem;">Schedule & Confirm</h3>
                    <p style="font-size: 0.9rem; color: var(--muted); line-height: 1.6;">
                        Pick your preferred appointment slot and time. Your assigned technician accepts and attends to your home.
                    </p>
                </div>
            </div>
        </section>

        <!-- Why Choose QuickFixHub Section -->
        <section id="whyChooseUs" style="margin: 5rem 0;">
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 3.5rem; align-items: center;" class="editorial-hero">
                <div>
                    <div style="font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.14em; color: var(--terracotta); margin-bottom: 0.5rem;">
                        Our Standards
                    </div>
                    <h2 style="font-size: 2.4rem; color: var(--charcoal); margin-bottom: 1.25rem;">
                        Why Homeowners Rely on QuickFixHub
                    </h2>
                    <p style="color: var(--muted); font-size: 1rem; line-height: 1.65; margin-bottom: 2rem;">
                        We believe quality repairs start with trust. That's why every trade specialist on our platform undergoes background audits and rigorous validation before ever taking on jobs.
                    </p>

                    <div style="display: flex; flex-direction: column; gap: 1.35rem;">
                        <div style="display: flex; gap: 1rem;">
                            <div style="width: 36px; height: 36px; border-radius: var(--radius-sm); background: var(--terracotta-light); color: var(--terracotta); display: flex; align-items: center; justify-content: center; flex-shrink: 0;">
                                <i class="fas fa-check"></i>
                            </div>
                            <div>
                                <h4 style="font-family: var(--font-sans); font-size: 1.05rem; font-weight: 700; margin-bottom: 0.2rem;">Rigorous Onboarding</h4>
                                <p style="font-size: 0.88rem; color: var(--muted);">Administrator verification of identification, age, and professional skills.</p>
                            </div>
                        </div>

                        <div style="display: flex; gap: 1rem;">
                            <div style="width: 36px; height: 36px; border-radius: var(--radius-sm); background: var(--sage-light); color: var(--sage); display: flex; align-items: center; justify-content: center; flex-shrink: 0;">
                                <i class="fas fa-tag"></i>
                            </div>
                            <div>
                                <h4 style="font-family: var(--font-sans); font-size: 1.05rem; font-weight: 700; margin-bottom: 0.2rem;">Transparent Pricing</h4>
                                <p style="font-size: 0.88rem; color: var(--muted);">Direct communication with technicians without inflated broker margins.</p>
                            </div>
                        </div>

                        <div style="display: flex; gap: 1rem;">
                            <div style="width: 36px; height: 36px; border-radius: var(--radius-sm); background: var(--sand-soft); color: var(--charcoal); display: flex; align-items: center; justify-content: center; flex-shrink: 0;">
                                <i class="fas fa-clock-rotate-left"></i>
                            </div>
                            <div>
                                <h4 style="font-family: var(--font-sans); font-size: 1.05rem; font-weight: 700; margin-bottom: 0.2rem;">Prompt Fulfillment</h4>
                                <p style="font-size: 0.88rem; color: var(--muted);">Same-day slots available for emergency plumbing and power cuts.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="position: relative; border-radius: var(--radius-xl); overflow: hidden; border: 1px solid var(--border); box-shadow: var(--shadow-card); height: 440px;">
                    <img src="https://images.unsplash.com/photo-1541888946425-d0fbb186f5f8?auto=format&fit=crop&w=800&q=80" alt="Quality Craftsmanship" style="width:100%; height:100%; object-fit: cover;">
                </div>
            </div>
        </section>

        <!-- Testimonial Section -->
        <section style="margin: 5rem 0; padding: 4rem 2rem; background-color: var(--sand-soft); border-radius: var(--radius-xl); border: 1px solid var(--border);">
            <div style="text-align: center; max-width: 650px; margin: 0 auto 3rem auto;">
                <div style="font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.14em; color: var(--terracotta); margin-bottom: 0.4rem;">
                    Homeowner Reviews
                </div>
                <h2 style="font-size: 2.2rem; color: var(--charcoal);">Trusted by Local Families</h2>
            </div>

            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.75rem;">
                <div style="background: var(--white); padding: 1.75rem; border-radius: var(--radius-lg); border: 1px solid var(--border);">
                    <div style="color: var(--amber); margin-bottom: 0.75rem;"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                    <p style="font-size: 0.92rem; color: var(--charcoal); font-style: italic; margin-bottom: 1.25rem; line-height: 1.6;">
                        "The plumber arrived precisely on time, diagnosed our concealed shower leak immediately, and repaired it cleanly. The 3-step booking was effortless."
                    </p>
                    <div style="font-weight: 700; font-size: 0.9rem;">Ananya Deshmukh</div>
                    <div style="font-size: 0.78rem; color: var(--muted);">Bandra West &bull; Plumbing Service</div>
                </div>

                <div style="background: var(--white); padding: 1.75rem; border-radius: var(--radius-lg); border: 1px solid var(--border);">
                    <div style="color: var(--amber); margin-bottom: 0.75rem;"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                    <p style="font-size: 0.92rem; color: var(--charcoal); font-style: italic; margin-bottom: 1.25rem; line-height: 1.6;">
                        "Booked an emergency electrician when our main fuse tripped. The provider accepted within 10 minutes and arrived fully equipped with spare parts."
                    </p>
                    <div style="font-weight: 700; font-size: 0.9rem;">Vikram Singhania</div>
                    <div style="font-size: 0.78rem; color: var(--muted);">Andheri &bull; Electrical Fix</div>
                </div>

                <div style="background: var(--white); padding: 1.75rem; border-radius: var(--radius-lg); border: 1px solid var(--border);">
                    <div style="color: var(--amber); margin-bottom: 0.75rem;"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                    <p style="font-size: 0.92rem; color: var(--charcoal); font-style: italic; margin-bottom: 1.25rem; line-height: 1.6;">
                        "As a service provider, QuickFixHub has connected me with reliable customers right in my area without agency commissions. Highly recommended!"
                    </p>
                    <div style="font-weight: 700; font-size: 0.9rem;">Ramesh Kumar</div>
                    <div style="font-size: 0.78rem; color: var(--muted);">Master Carpenter &bull; Partner</div>
                </div>
            </div>
        </section>

        <!-- Final Call to Action -->
        <section class="qh-hero-banner" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 2rem; background: linear-gradient(135deg, var(--white) 0%, var(--sand-soft) 100%);">
            <div>
                <div class="qh-hero-tag">Ready to experience quality home care?</div>
                <h2 style="font-size: 2.4rem; color: var(--charcoal); margin-bottom: 0.5rem;">
                    Schedule Your First Service Today
                </h2>
                <p style="color: var(--muted); font-size: 1rem; max-width: 500px;">
                    Join thousands of satisfied homeowners who trust QuickFixHub for all their domestic repairs.
                </p>
            </div>
            <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                <a href="${pageContext.request.contextPath}/bookServiceStep1" class="qh-btn qh-btn-primary qh-btn-lg">
                    Book Service Now
                </a>
                <a href="${pageContext.request.contextPath}/user_register" class="qh-btn qh-btn-secondary qh-btn-lg">
                    Create Free Account
                </a>
            </div>
        </section>
    </main>

    <%@ include file="common/footer.jsp" %>
</body>
</html>
