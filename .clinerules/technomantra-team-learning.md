# Technomantra Team Learning (V4.8.1)

Use these as proven team references, not as instructions to copy blindly. Current user prompt and current-project conventions always win.

## Pattern 1: Responsive carousel / slider · CSST10I15-CSST10I10.html
- Category: ui.carousel
- Quality: 95 · Status: approved
Project-scoped learning extracted through the unified quality gate. Current project and explicit developer instructions always win.
```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
  <title>DaTo CSST Screw Air Compressor | Datronix Autotech</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="DAS723.css">
</head>
<body>
  <header class="site-header">
    <div class="container nav-wrap">
      <a class="brand" href="../index.html" aria-label="Datronix Autotech home">
        <img src="../photos/logo.png" alt="Datronix Autotech">
      </a>

      <button class="nav-toggle" type="button" aria-label="Open menu" aria-expanded="false" aria-controls="main-navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>

      <nav class="main-nav" id="main-navigation" aria-label="Main navigation">
        <a href="../index.html">Home</a>
        <a href="../page/about.html">About Us</a>
        <div class="nav-dropdown">
          <button type="button" class="nav-drop-toggle active" aria-expanded="false" aria-haspopup="true" aria-controls="products-submenu">Products</button>
          <div class="dropdown-menu" id="products-submenu" role="menu">
            <a role="menuitem" href="../page/categori.html">All products</a>
            <a role="menuitem" href="DAS528.html">DAS528 DaTo Diagnostic Car Scanner</a>
            <a role="menuitem" href="DAS722.html">DAS722 Da To Diagnostic Car Scanner</a>
            <a role="menuitem" href="DASXG3.html">DAS X-G3 IMMO Programming</a>
            <a role="menuitem" href="DAS701.html">DaTo DAS701 Super Scanner</a>
            <a role="menuitem" href="DAS723.html">DaTo DAS723 PRO ULTRA</a>
            <a role="menuitem" href="DASG3.html">DaTo DASG3 Key Programmer</a>
            <a role="menuitem" href="DAS1026.html">Bluetooth OBD2 Scanner DAS1026</a>
            <a role="menuitem" href="ADAS-RADAR.html">ADAS RADAR Trio Cipher Calibration</a>
            <a role="menuitem" href="DAS825.html">DAS825 PRO MAX</a>
            <a role="menuitem" href="DAS623.html">EV SCANNER DaTo DAS623</a>
            <a role="menuitem" href="DIDS-101.html">DIDS-101 Diesel Injector Testing</a>
            <a role="menuitem" href="ACMAS301%E2%80%93AC.html">ACMAS301 AC Service Station</a>
            <a role="menuitem" href="ACMAS302.html">ACMAS302 AC Service Station</a>
            <a role="menuitem" href="DIGD603.html">DaTo DIGD603 GDI &amp; Piezo Injector Cleaner</a>
            <a role="menuitem" href="PTIW1001.html">DaTo PTIW1001 Air Impact Wrench</a>
            <a role="menuitem" href="PTIW1011.html">DaTo PTIW1011 1&Prime; Heavy Duty Impact Wrench</a>
            <a role="menuitem" href="CSST10I15-CSST10I10.html">DaTo CSST Screw Air Compressor</a>
            <a role="menuitem" href="DHP2050.html">DaTo DHP 2050 Shop Press &ndash; 50 Ton</a>
          </div>
        </div>
        <a href="../page/service.html">Services</a>
        <a href="../page/contact.html">Contact Us</a>
      </
```

## Pattern 2: Responsive carousel / slider · index.html
- Category: ui.carousel
- Quality: 95 · Status: approved
Project-scoped learning extracted through the unified quality gate. Current project and explicit developer instructions always win.
```
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#051b3c" />
    <meta name="description" content="Infinity Power India — industrial automation, control panels and turnkey projects." />
    <title>Infinity Power India | Industrial Automation</title>
    <link rel="preconnect" href="https://images.unsplash.com" />
    <link rel="stylesheet" href="styles.css" />
  </head>
  <body>
    <div class="topbar">
      <div class="container topbar__inner">
        <div class="contact-mini"><a href="tel:+919979877272">☎ +91 99798 77272</a><a href="mailto:infinitypowerindia@gmail.com">✉ infinitypowerindia@gmail.com</a><span>⌖ Ahmedabad, Gujarat</span></div>
        <div class="social-mini" aria-label="Social links"><a href="#contact" aria-label="LinkedIn">in</a><a href="#contact" aria-label="Facebook">f</a><a href="#contact" aria-label="Instagram">◎</a><a href="#contact" aria-label="YouTube">▶</a></div>
      </div>
    </div>

    <header class="site-header" id="home">
      <div class="container header__inner">
        <a class="brand" href="#home" aria-label="Infinity Power India home">
          <img src="logo.png" alt="Infinity Power India Logo" class="site-logo-img" />
        </a>
        <button class="menu-toggle" type="button" aria-expanded="false" aria-controls="main-nav"><span></span><span></span><span></span><span class="sr-only">Menu</span></button>
        <nav id="main-nav" class="main-nav" aria-label="Main navigation">
          <a class="active" href="#home">Home</a><a href="#about">About Us</a><a href="#products">Products</a><a href="#services">Services</a><a href="#industries">Industries</a><a href="#projects">Projects</a><a href="#gallery">Gallery</a><a href="#footer">Downloads</a><a href="#faq">Blog</a><a href="#footer">Careers</a><a href="#contact">Contact Us</a>
          <a class="btn btn--small" href="#contact">Get an Inquiry</a>
        </nav>
      </div>
    </header>

    <main>
      <section class="hero">
        <div class="hero__image" role="img" aria-label="Advanced industrial automation control room"></div>
        <div class="hero__wash"></div>
        <div class="container hero__content">
          <h1>Powering Industrial<br />Automation with Innovation</h1>
          <p>Reliable, energy-efficient and customized automation solutions engineered for smarter industrial performance.</p>
          <div class="hero__actions"><a class="btn" href="#services">Explore Our Solutions <span>→</span></a><a class="btn btn--outline" href="#footer">Download Brochure <span>⇩</span></a></div>
          <div class="hero-pills">
            <span><svg class="feature-icon" viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="12" r="3.2" /><circle cx="12" cy="3.8" r="2.1" /><circle cx="20.2" cy="8.3" r="2.1" /><circle cx="18.5" cy="17.7" r="2.1" /><circle cx="5.5" cy="17.7" r="2.1" /><circle cx="3.8" cy="8.3" r="2.1" /><path d="M12 6v2.8m5.4 1.1-2.4 1.4m0 3.3 2.2 1.3m-10.3 0 2.2-1.3m0-3.3-2.4-1.4" /></svg>System Integrator</span>
            <span><svg class="feature-icon" viewBox="0 0 24 24" aria-h
```

## Pattern 3: Responsive carousel / slider · index.html
- Category: ui.carousel
- Quality: 95 · Status: approved
Project-scoped learning extracted through the unified quality gate. Current project and explicit developer instructions always win.
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Precise Engineering</title>
    <link rel="icon" href="images/fevicon.png" type="image/png">
    <meta name="description" content="Precise Engineering is a leading HEPA Filter Manufacturer and Supplier of high-performance ULPA, Cartridge HEPA, and Pharmaceutical Air Filtration Solutions.">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Plus+Jakarta+Sans:wght@600;700;800&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="assets/css/premium.css">
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-13ZD2ZZTMD"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'G-13ZD2ZZTMD');
    </script>
</head>
<body>

    <!-- Header -->
    <header class="header" id="header">
        <div class="container header-inner">
            <a href="#hero" class="logo">
                <img src="images/logo.png" alt="Precise Engineering">
            </a>
            <nav class="nav" id="navMenu" aria-label="Main navigation">
                <a href="#hero" class="nav-link active">Home</a>
                <a href="about.html" class="nav-link">About us</a>
                <div class="nav-dropdown">
                    <button type="button" class="nav-link nav-dropdown-toggle" aria-expanded="false" aria-haspopup="true" aria-controls="navProductsMenu">
                        Products
                        <svg class="nav-dropdown-chevron" width="12" height="12" viewBox="0 0 12 12" aria-hidden="true"><path d="M2 4l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/></svg>
                    </button>
                    <ul class="nav-dropdown-menu" id="navProductsMenu" role="menu">
                        <li role="none"><a href="products.html" class="nav-dropdown-link" role="menuitem">All Products</a></li>
                        <li role="none" class="nav-dropdown-divider" aria-hidden="true"></li>
                        <li role="none"><a href="product-detail.html?slug=hepa-filters" class="nav-dropdown-link" role="menuitem">HEPA Filters</a></li>
                        <li role="none"><a href="product-detail.html?slug=ulpa-filters" class="nav-dropdown-link" role="menuitem">ULPA Filters</a></li>
                        <li role="none"><a href="product-detail.html?slug=hot-zone-hepa-filters" class="nav-dropdown-link" role="menuitem">Hot Zone HEPA Filters</a></li>
                        <li role="none"><a href="product-detail.html?slug=pre-filters" class="nav-dropdown-link" role="menuitem">Pre-Filters</a></li>
                        <li role="none"><a href="product-detail.html?slug=cartridge-filters" class="nav-dropd
```

## Pattern 4: Validation pattern · index.html
- Category: validation
- Quality: 95 · Status: approved
Project-scoped learning extracted through the unified quality gate. Current project and explicit developer instructions always win.
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Precise Engineering</title>
    <link rel="icon" href="images/fevicon.png" type="image/png">
    <meta name="description" content="Precise Engineering is a leading HEPA Filter Manufacturer and Supplier of high-performance ULPA, Cartridge HEPA, and Pharmaceutical Air Filtration Solutions.">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Plus+Jakarta+Sans:wght@600;700;800&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="assets/css/premium.css">
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-13ZD2ZZTMD"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'G-13ZD2ZZTMD');
    </script>
</head>
<body>

    <!-- Header -->
    <header class="header" id="header">
        <div class="container header-inner">
            <a href="#hero" class="logo">
                <img src="images/logo.png" alt="Precise Engineering">
            </a>
            <nav class="nav" id="navMenu" aria-label="Main navigation">
                <a href="#hero" class="nav-link active">Home</a>
                <a href="about.html" class="nav-link">About us</a>
                <div class="nav-dropdown">
                    <button type="button" class="nav-link nav-dropdown-toggle" aria-expanded="false" aria-haspopup="true" aria-controls="navProductsMenu">
                        Products
                        <svg class="nav-dropdown-chevron" width="12" height="12" viewBox="0 0 12 12" aria-hidden="true"><path d="M2 4l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/></svg>
                    </button>
                    <ul class="nav-dropdown-menu" id="navProductsMenu" role="menu">
                        <li role="none"><a href="products.html" class="nav-dropdown-link" role="menuitem">All Products</a></li>
                        <li role="none" class="nav-dropdown-divider" aria-hidden="true"></li>
                        <li role="none"><a href="product-detail.html?slug=hepa-filters" class="nav-dropdown-link" role="menuitem">HEPA Filters</a></li>
                        <li role="none"><a href="product-detail.html?slug=ulpa-filters" class="nav-dropdown-link" role="menuitem">ULPA Filters</a></li>
                        <li role="none"><a href="product-detail.html?slug=hot-zone-hepa-filters" class="nav-dropdown-link" role="menuitem">Hot Zone HEPA Filters</a></li>
                        <li role="none"><a href="product-detail.html?slug=pre-filters" class="nav-dropdown-link" role="menuitem">Pre-Filters</a></li>
                        <li role="none"><a href="product-detail.html?slug=cartridge-filters" class="nav-dropd
```