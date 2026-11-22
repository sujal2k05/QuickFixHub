<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300..800;1,9..40,300..800&family=DM+Serif+Display:ital@0;1&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
/* ==========================================================================
   QuickFixHub - WARM EDITORIAL (TERRACOTTA + CREAM) DESIGN SYSTEM
   ========================================================================== */
:root {
    /* Palette Tokens */
    --ivory: #F6F1E8;
    --terracotta: #C76545;
    --terracotta-hover: #B25435;
    --terracotta-light: #F7ECE8;
    --terracotta-subtle: rgba(199, 101, 69, 0.08);
    --charcoal: #252823;
    --charcoal-light: #373B34;
    --white: #FFFFFF;
    --sand: #D9C9AE;
    --sand-light: #EDE4D6;
    --sand-soft: #F9F6F0;
    --sage: #849078;
    --sage-light: #EEF1EC;
    --sage-dark: #5F6B54;
    --muted: #77776F;
    --muted-light: #A3A39B;
    --border: #E7DED1;
    --border-light: #F0EAE1;
    --amber: #B8732E;
    --amber-light: #FDF4E7;
    --brick: #B54032;
    --brick-light: #FDF0EE;

    /* Typography */
    --font-serif: 'DM Serif Display', Georgia, serif;
    --font-sans: 'DM Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;

    /* Radius Tokens */
    --radius-sm: 8px;
    --radius-md: 12px;
    --radius-lg: 16px;
    --radius-xl: 20px;
    --radius-full: 9999px;

    /* Elevation */
    --shadow-subtle: 0 2px 8px rgba(37, 40, 35, 0.04);
    --shadow-card: 0 4px 16px rgba(37, 40, 35, 0.06);
    --shadow-elevated: 0 12px 32px rgba(37, 40, 35, 0.09);
    --shadow-dropdown: 0 16px 40px rgba(37, 40, 35, 0.12);
}

*, *::before, *::after {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html, body {
    height: 100%;
}

body {
    font-family: var(--font-sans);
    background-color: var(--ivory);
    color: var(--charcoal);
    line-height: 1.55;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    display: flex;
    flex-direction: column;
}

/* Texture overlay for editorial feel */
body::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: radial-gradient(rgba(199, 101, 69, 0.02) 1px, transparent 0);
    background-size: 24px 24px;
    pointer-events: none;
    z-index: -1;
}

/* Typography Helpers */
.font-serif { font-family: var(--font-serif); }
.font-sans { font-family: var(--font-sans); }

h1, h2, h3, h4, .editorial-heading {
    font-family: var(--font-serif);
    font-weight: 400;
    color: var(--charcoal);
    letter-spacing: -0.015em;
    line-height: 1.2;
}

p, .editorial-body {
    font-family: var(--font-sans);
    color: var(--charcoal);
}

.text-muted { color: var(--muted); }
.text-terracotta { color: var(--terracotta); }
.text-sage { color: var(--sage); }

/* ==========================================================================
   Navigation Bar
   ========================================================================== */
.qh-navbar {
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(12px);
    border-bottom: 1px solid var(--border);
    position: sticky;
    top: 0;
    z-index: 100;
    transition: all 0.25s ease;
}

.qh-navbar-inner {
    max-width: 1240px;
    margin: 0 auto;
    padding: 1rem 1.75rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.qh-brand {
    display: flex;
    align-items: center;
    gap: 0.85rem;
    text-decoration: none;
    color: var(--charcoal);
}

.qh-brand-mark {
    width: 42px;
    height: 42px;
    border-radius: var(--radius-md);
    background-color: var(--terracotta);
    color: var(--white);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.15rem;
    box-shadow: 0 4px 12px rgba(199, 101, 69, 0.22);
}

.qh-brand-title {
    font-family: var(--font-serif);
    font-size: 1.45rem;
    color: var(--charcoal);
    font-weight: 400;
    letter-spacing: -0.02em;
}

.qh-brand-subtitle {
    font-size: 0.72rem;
    text-transform: uppercase;
    letter-spacing: 0.12em;
    color: var(--muted);
    font-weight: 600;
    display: block;
    margin-top: -3px;
}

.qh-nav-menu {
    display: flex;
    align-items: center;
    gap: 1.75rem;
    list-style: none;
}

.qh-nav-link {
    color: var(--charcoal);
    text-decoration: none;
    font-size: 0.92rem;
    font-weight: 500;
    padding: 0.4rem 0.2rem;
    position: relative;
    transition: color 0.2s ease;
}

.qh-nav-link:hover, .qh-nav-link.active {
    color: var(--terracotta);
}

.qh-nav-link.active::after {
    content: '';
    position: absolute;
    bottom: -6px;
    left: 0;
    width: 100%;
    height: 2px;
    background-color: var(--terracotta);
    border-radius: var(--radius-full);
}

.qh-nav-actions {
    display: flex;
    align-items: center;
    gap: 0.85rem;
}

.qh-user-badge {
    display: flex;
    align-items: center;
    gap: 0.65rem;
    padding: 0.35rem 0.85rem 0.35rem 0.45rem;
    background: var(--sand-soft);
    border: 1px solid var(--border);
    border-radius: var(--radius-full);
    font-size: 0.85rem;
    font-weight: 500;
    color: var(--charcoal);
}

.qh-avatar {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background: var(--terracotta);
    color: var(--white);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.8rem;
    font-weight: 600;
    font-family: var(--font-sans);
}

/* ==========================================================================
   Buttons & Interactive Elements
   ========================================================================== */
.qh-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 0.55rem;
    font-family: var(--font-sans);
    font-size: 0.92rem;
    font-weight: 600;
    padding: 0.65rem 1.4rem;
    border-radius: var(--radius-md);
    border: 1px solid transparent;
    cursor: pointer;
    text-decoration: none;
    transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
    line-height: 1.4;
    white-space: nowrap;
}

.qh-btn:active {
    transform: scale(0.98);
}

.qh-btn-primary {
    background-color: var(--terracotta);
    color: var(--white);
    box-shadow: 0 2px 6px rgba(199, 101, 69, 0.2);
}

.qh-btn-primary:hover {
    background-color: var(--terracotta-hover);
    color: var(--white);
    box-shadow: 0 4px 12px rgba(199, 101, 69, 0.28);
}

.qh-btn-secondary {
    background-color: var(--sand-soft);
    color: var(--charcoal);
    border-color: var(--border);
}

.qh-btn-secondary:hover {
    background-color: var(--sand-light);
    color: var(--charcoal);
    border-color: var(--sand);
}

.qh-btn-outline {
    background-color: transparent;
    color: var(--charcoal);
    border-color: var(--border);
}

.qh-btn-outline:hover {
    background-color: var(--white);
    border-color: var(--charcoal);
    color: var(--charcoal);
}

.qh-btn-sage {
    background-color: var(--sage);
    color: var(--white);
}

.qh-btn-sage:hover {
    background-color: var(--sage-dark);
    color: var(--white);
}

.qh-btn-brick {
    background-color: var(--brick);
    color: var(--white);
}

.qh-btn-brick:hover {
    background-color: #9B3428;
    color: var(--white);
}

.qh-btn-sm {
    padding: 0.4rem 0.85rem;
    font-size: 0.82rem;
    border-radius: var(--radius-sm);
}

.qh-btn-lg {
    padding: 0.85rem 1.85rem;
    font-size: 1rem;
    border-radius: var(--radius-lg);
}

.qh-btn-full {
    width: 100%;
}

/* ==========================================================================
   Layout & Cards
   ========================================================================== */
.qh-container {
    max-width: 1240px;
    margin: 0 auto;
    padding: 2.25rem 1.75rem;
    width: 100%;
    flex: 1;
}

.qh-container-narrow {
    max-width: 780px;
    margin: 0 auto;
    padding: 2.5rem 1.75rem;
    width: 100%;
    flex: 1;
}

.qh-card {
    background: var(--white);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    box-shadow: var(--shadow-subtle);
    overflow: hidden;
    transition: all 0.25s ease;
}

.qh-card-hover:hover {
    transform: translateY(-3px);
    box-shadow: var(--shadow-card);
    border-color: var(--sand);
}

.qh-card-header {
    padding: 1.5rem 1.75rem;
    border-bottom: 1px solid var(--border);
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
    background: #FCFAF6;
}

.qh-card-body {
    padding: 1.75rem;
}

.qh-card-footer {
    padding: 1.25rem 1.75rem;
    border-top: 1px solid var(--border);
    background: var(--sand-soft);
}

/* Warm Hero Banner */
.qh-hero-banner {
    background: var(--white);
    border: 1px solid var(--border);
    border-radius: var(--radius-xl);
    padding: 3rem 2.5rem;
    margin-bottom: 2.25rem;
    position: relative;
    overflow: hidden;
    box-shadow: var(--shadow-card);
}

.qh-hero-banner::after {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    width: 320px;
    height: 100%;
    background: linear-gradient(135deg, transparent 40%, rgba(217, 201, 174, 0.25) 100%);
    pointer-events: none;
}

.qh-hero-tag {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.8rem;
    text-transform: uppercase;
    letter-spacing: 0.14em;
    color: var(--terracotta);
    font-weight: 700;
    margin-bottom: 0.75rem;
}

.qh-hero-title {
    font-size: 2.4rem;
    line-height: 1.18;
    color: var(--charcoal);
    margin-bottom: 0.85rem;
}

.qh-hero-desc {
    color: var(--muted);
    font-size: 1.05rem;
    max-width: 620px;
    line-height: 1.6;
}

/* ==========================================================================
   Dashboard Shell Layout
   ========================================================================== */
.qh-dashboard-shell {
    display: grid;
    grid-template-columns: 260px 1fr;
    min-height: calc(100vh - 72px);
    width: 100%;
}

.qh-sidebar {
    background: var(--white);
    border-right: 1px solid var(--border);
    padding: 2rem 1.25rem;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.qh-sidebar-nav {
    display: flex;
    flex-direction: column;
    gap: 0.35rem;
    list-style: none;
}

.qh-sidebar-heading {
    font-size: 0.72rem;
    text-transform: uppercase;
    letter-spacing: 0.12em;
    color: var(--muted);
    font-weight: 700;
    padding: 0.5rem 0.85rem 0.35rem 0.85rem;
    margin-top: 1rem;
}

.qh-sidebar-heading:first-child {
    margin-top: 0;
}

.qh-sidebar-link {
    display: flex;
    align-items: center;
    gap: 0.85rem;
    padding: 0.75rem 1rem;
    border-radius: var(--radius-md);
    color: var(--charcoal);
    text-decoration: none;
    font-size: 0.9rem;
    font-weight: 500;
    transition: all 0.2s ease;
}

.qh-sidebar-link i {
    font-size: 1.05rem;
    width: 20px;
    text-align: center;
    color: var(--muted);
    transition: color 0.2s ease;
}

.qh-sidebar-link:hover {
    background-color: var(--sand-soft);
    color: var(--terracotta);
}

.qh-sidebar-link:hover i {
    color: var(--terracotta);
}

.qh-sidebar-link.active {
    background-color: var(--terracotta-light);
    color: var(--terracotta);
    font-weight: 600;
}

.qh-sidebar-link.active i {
    color: var(--terracotta);
}

.qh-dashboard-content {
    padding: 2.25rem 2.5rem;
    overflow-y: auto;
    background-color: var(--ivory);
}

/* ==========================================================================
   Stat & Navigation Grids
   ========================================================================== */
.qh-stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 1.25rem;
    margin-bottom: 2rem;
}

.qh-stat-card {
    background: var(--white);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: 1.5rem;
    box-shadow: var(--shadow-subtle);
    display: flex;
    align-items: center;
    gap: 1.25rem;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.qh-stat-card:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-card);
}

.qh-stat-icon {
    width: 50px;
    height: 50px;
    border-radius: var(--radius-md);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.35rem;
    flex-shrink: 0;
}

.icon-terracotta { background: var(--terracotta-light); color: var(--terracotta); }
.icon-sage { background: var(--sage-light); color: var(--sage); }
.icon-sand { background: var(--sand-light); color: var(--charcoal); }
.icon-amber { background: var(--amber-light); color: var(--amber); }
.icon-brick { background: var(--brick-light); color: var(--brick); }

.qh-stat-value {
    font-family: var(--font-serif);
    font-size: 1.85rem;
    line-height: 1.1;
    color: var(--charcoal);
}

.qh-stat-label {
    font-size: 0.82rem;
    color: var(--muted);
    font-weight: 500;
    margin-top: 0.25rem;
}

.qh-nav-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2.25rem;
}

.qh-nav-card {
    background: var(--white);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: 1.85rem 1.65rem;
    text-decoration: none;
    color: inherit;
    display: flex;
    flex-direction: column;
    box-shadow: var(--shadow-subtle);
    transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
    position: relative;
    overflow: hidden;
}

.qh-nav-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: transparent;
    transition: background 0.2s ease;
}

.qh-nav-card:hover {
    transform: translateY(-4px);
    box-shadow: var(--shadow-card);
    border-color: var(--sand);
}

.qh-nav-card:hover::before {
    background-color: var(--terracotta);
}

.qh-nav-card.active-sage:hover::before { background-color: var(--sage); }
.qh-nav-card.active-amber:hover::before { background-color: var(--amber); }
.qh-nav-card.active-brick:hover::before { background-color: var(--brick); }

.qh-nav-card-icon {
    width: 46px;
    height: 46px;
    border-radius: var(--radius-md);
    background: var(--sand-soft);
    color: var(--charcoal);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.25rem;
    margin-bottom: 1.25rem;
}

.qh-nav-card-title {
    font-family: var(--font-serif);
    font-size: 1.35rem;
    color: var(--charcoal);
    margin-bottom: 0.45rem;
}

.qh-nav-card-desc {
    font-size: 0.9rem;
    color: var(--muted);
    margin-bottom: 1.25rem;
    line-height: 1.55;
    flex-grow: 1;
}

.qh-nav-card-action {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.88rem;
    font-weight: 600;
    color: var(--terracotta);
}

.qh-nav-card:hover .qh-nav-card-action i {
    transform: translateX(4px);
    transition: transform 0.2s ease;
}

/* ==========================================================================
   Editorial Data Tables
   ========================================================================== */
.qh-table-container {
    width: 100%;
    overflow-x: auto;
}

.qh-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    font-size: 0.9rem;
}

.qh-table th {
    background-color: var(--sand-soft);
    color: var(--muted);
    font-weight: 600;
    padding: 0.85rem 1.25rem;
    font-size: 0.75rem;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    border-bottom: 1px solid var(--border);
    white-space: nowrap;
}

.qh-table td {
    padding: 1.1rem 1.25rem;
    border-bottom: 1px solid var(--border-light);
    color: var(--charcoal);
    background-color: var(--white);
    vertical-align: middle;
}

.qh-table tbody tr:last-child td {
    border-bottom: none;
}

.qh-table tbody tr {
    transition: background-color 0.15s ease;
}

.qh-table tbody tr:hover td {
    background-color: #FAF7F2;
}

/* ==========================================================================
   Badges
   ========================================================================== */
.qh-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    padding: 0.3rem 0.75rem;
    border-radius: var(--radius-full);
    font-size: 0.75rem;
    font-weight: 600;
    letter-spacing: 0.04em;
    text-transform: uppercase;
}

.qh-badge-sage {
    background-color: var(--sage-light);
    color: var(--sage-dark);
    border: 1px solid rgba(132, 144, 120, 0.3);
}

.qh-badge-amber {
    background-color: var(--amber-light);
    color: var(--amber);
    border: 1px solid rgba(184, 115, 46, 0.3);
}

.qh-badge-brick {
    background-color: var(--brick-light);
    color: var(--brick);
    border: 1px solid rgba(181, 64, 50, 0.3);
}

.qh-badge-sand {
    background-color: var(--sand-soft);
    color: var(--charcoal);
    border: 1px solid var(--border);
}

/* ==========================================================================
   Forms & Inputs
   ========================================================================== */
.qh-form-group {
    margin-bottom: 1.35rem;
    position: relative;
}

.qh-label {
    display: block;
    font-size: 0.88rem;
    font-weight: 600;
    color: var(--charcoal);
    margin-bottom: 0.45rem;
}

.qh-input-wrap {
    position: relative;
    display: flex;
    align-items: center;
}

.qh-input-icon {
    position: absolute;
    left: 1.1rem;
    color: var(--muted-light);
    font-size: 1rem;
    pointer-events: none;
    transition: color 0.2s ease;
}

.qh-input, .qh-select, .qh-textarea {
    width: 100%;
    padding: 0.78rem 1.1rem 0.78rem 2.75rem;
    font-family: var(--font-sans);
    font-size: 0.95rem;
    color: var(--charcoal);
    background-color: var(--white);
    border: 1.5px solid var(--border);
    border-radius: var(--radius-md);
    transition: all 0.2s ease;
    outline: none;
}

.qh-input.no-icon, .qh-select.no-icon, .qh-textarea.no-icon {
    padding-left: 1.1rem;
}

.qh-input:focus, .qh-select:focus, .qh-textarea:focus {
    border-color: var(--terracotta);
    box-shadow: 0 0 0 3px rgba(199, 101, 69, 0.12);
}

.qh-input-wrap:focus-within .qh-input-icon {
    color: var(--terracotta);
}

.qh-password-toggle {
    position: absolute;
    right: 1.1rem;
    color: var(--muted-light);
    cursor: pointer;
    padding: 0.25rem;
    font-size: 0.95rem;
}

.qh-password-toggle:hover {
    color: var(--charcoal);
}

.qh-form-grid-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1.25rem;
}

.qh-form-grid-3 {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.25rem;
}

/* ==========================================================================
   Split Authentication Layout (Warm Editorial)
   ========================================================================== */
.qh-auth-page {
    min-height: 100vh;
    display: flex;
    background-color: var(--ivory);
}

.qh-auth-form-side {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 3rem 4rem;
    max-width: 580px;
    background: var(--white);
    border-right: 1px solid var(--border);
}

.qh-auth-visual-side {
    flex: 1.2;
    background-color: #2D302B;
    background-size: cover;
    background-position: center;
    position: relative;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 4rem;
    color: var(--white);
}

.qh-auth-visual-side::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(180deg, rgba(37, 40, 35, 0.4) 0%, rgba(37, 40, 35, 0.85) 100%);
    pointer-events: none;
}

.qh-auth-visual-content {
    position: relative;
    z-index: 2;
}

/* ==========================================================================
   Multi-step Stepper Component
   ========================================================================== */
.qh-stepper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    margin-bottom: 2.5rem;
}

.qh-stepper::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 0;
    width: 100%;
    height: 2px;
    background-color: var(--border);
    z-index: 1;
    transform: translateY(-50%);
}

.qh-step-node {
    position: relative;
    z-index: 2;
    background: var(--ivory);
    padding: 0 1rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.45rem;
}

.qh-step-circle {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: var(--white);
    border: 2px solid var(--border);
    color: var(--muted);
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    font-size: 0.95rem;
    transition: all 0.25s ease;
}

.qh-step-node.active .qh-step-circle {
    border-color: var(--terracotta);
    background-color: var(--terracotta);
    color: var(--white);
    box-shadow: 0 0 0 4px rgba(199, 101, 69, 0.16);
}

.qh-step-node.completed .qh-step-circle {
    border-color: var(--sage);
    background-color: var(--sage);
    color: var(--white);
}

.qh-step-title {
    font-size: 0.82rem;
    font-weight: 600;
    color: var(--muted);
    letter-spacing: 0.02em;
}

.qh-step-node.active .qh-step-title {
    color: var(--terracotta);
}

/* ==========================================================================
   Alerts & Notifications
   ========================================================================== */
.qh-alert {
    padding: 1rem 1.35rem;
    border-radius: var(--radius-md);
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.85rem;
    font-size: 0.92rem;
    line-height: 1.45;
}

.qh-alert-error {
    background-color: var(--brick-light);
    border: 1px solid rgba(181, 64, 50, 0.25);
    color: var(--brick);
}

.qh-alert-success {
    background-color: var(--sage-light);
    border: 1px solid rgba(132, 144, 120, 0.35);
    color: var(--sage-dark);
}

/* Empty State */
.qh-empty-state {
    text-align: center;
    padding: 4rem 1.5rem;
}

.qh-empty-icon {
    font-size: 3.25rem;
    color: var(--sand);
    margin-bottom: 1.25rem;
}

.qh-empty-title {
    font-family: var(--font-serif);
    font-size: 1.45rem;
    color: var(--charcoal);
    margin-bottom: 0.4rem;
}

.qh-empty-desc {
    color: var(--muted);
    font-size: 0.92rem;
    max-width: 440px;
    margin: 0 auto 1.75rem auto;
}

/* ==========================================================================
   Footer
   ========================================================================== */
.qh-footer {
    background-color: var(--white);
    border-top: 1px solid var(--border);
    padding: 3.5rem 1.75rem 2rem 1.75rem;
    margin-top: auto;
}

.qh-footer-inner {
    max-width: 1240px;
    margin: 0 auto;
}

/* ==========================================================================
   Responsive Overrides
   ========================================================================== */
@media (max-width: 1024px) {
    .qh-dashboard-shell {
        grid-template-columns: 1fr;
    }
    .qh-sidebar {
        border-right: none;
        border-bottom: 1px solid var(--border);
        padding: 1.5rem 1.75rem;
    }
    .qh-sidebar-nav {
        flex-direction: row;
        flex-wrap: wrap;
    }
    .qh-auth-page {
        flex-direction: column;
    }
    .qh-auth-visual-side {
        display: none;
    }
    .qh-auth-form-side {
        max-width: 100%;
        border-right: none;
        padding: 3rem 2rem;
    }
}

@media (max-width: 768px) {
    .qh-navbar-inner { padding: 0.85rem 1.25rem; }
    .qh-nav-menu { display: none; }
    .qh-container, .qh-container-narrow, .qh-dashboard-content { padding: 1.75rem 1.25rem; }
    .qh-hero-banner { padding: 2rem 1.5rem; }
    .qh-hero-title { font-size: 1.85rem; }
    .qh-form-grid-2, .qh-form-grid-3 { grid-template-columns: 1fr; }
}
</style>
