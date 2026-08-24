$ErrorActionPreference = 'Stop'
$path = Join-Path $PSScriptRoot 'index.html'
$html = [System.IO.File]::ReadAllText($path)

# --- Locate hero section boundaries (tag-agnostic start, section-based end) ---
$startMatch = [regex]::Match($html, '<section\b[^>]*\bid=["'']home["''][^>]*>')
$endPattern = '<section\b[^>]*\bid=["'']services["''][^>]*>'
if (-not $startMatch.Success) {
    $startMatch = [regex]::Match($html, '<div\b[^>]*\bid=["'']home["''][^>]*>')
    $endPattern = '<section\b'
}
if (-not $startMatch.Success) { Write-Output 'ERR: hero start anchor (id=home) not found'; exit 2 }
$endMatch = [regex]::Match($html.Substring($startMatch.Index), $endPattern)
if (-not $endMatch.Success) { Write-Output 'ERR: hero end anchor not found'; exit 2 }
$s = $startMatch.Index
$e = $s + $endMatch.Index

Copy-Item $path (Join-Path $PSScriptRoot 'index.backup-before-hero.html') -Force

$enDash = [string][char]8211
$heart  = [string][char]9829

# --- New hero markup ---
$newSection = @'
<section class="hero tm-hero" id="home">
  <div class="tm-container">
    <div class="tm-grid">
      <div class="tm-copy">
        <span class="tm-pill"><span class="tm-pill-dot"></span>Old Age Home Care %ENDASH% Our Primary Mission</span>
        <h1 class="tm-title"><span class="tm-navy">Compassion Today,</span><span class="tm-purple">Dignity Always.</span></h1>
        <p class="tm-lede">At Shree Vasuki Charitable Trust, we serve the elderly with love and respect, ensuring a safe, healthy, and dignified life in our Old Age Home.</p>
        <div class="tm-actions">
          <a class="tm-btn tm-btn-primary" href="#about">
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
            <span>Donate Now</span>
          </a>
          <a class="tm-btn tm-btn-ghost" href="#services">Join Our Mission</a>
        </div>
        <ul class="tm-feats">
          <li><span class="tm-feat-ico"><svg viewBox="0 0 24 24"><path d="M12 3l7 3v5c0 4.6-3 7.6-7 9-4-1.4-7-4.4-7-9V6z"/><path d="M9.2 11.8l2 2 3.6-3.8"/></svg></span>Safe & Loving Environment</li>
          <li><span class="tm-feat-ico"><svg viewBox="0 0 24 24"><path d="M4 12h16a8 8 0 0 1-16 0z"/><path d="M9.5 8.5C9.5 6.6 11 5 12.8 5"/><path d="M12 12V9.5"/></svg></span>Nutritious Food & Healthcare</li>
          <li><span class="tm-feat-ico"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="8.5"/><path d="M12 7.5V12l3 2"/></svg></span>24/7 Care & Support</li>
        </ul>
      </div>
      <div class="tm-media">
        <img class="tm-photo" src="image/1.jpeg" alt="Caregiver caring for elderly residents at Shree Vasuki Charitable Trust Old Age Home">
        <svg class="tm-wave" viewBox="0 0 720 140" preserveAspectRatio="none" aria-hidden="true">
          <path d="M0,72 C170,138 380,4 720,62 L720,140 L0,140 Z" fill="#ece4fa" opacity="0.9"/>
          <path d="M0,98 C210,152 430,34 720,88 L720,140 L0,140 Z" fill="#6d28d9"/>
        </svg>
        <div class="tm-badge" aria-hidden="true">
          <span>Serving</span>
          <span>Humanity</span>
          <span>with Heart</span>
          <span class="tm-badge-heart">%HEART%</span>
        </div>
      </div>
    </div>
  </div>
</section>

'@
$newSection = $newSection.Replace('%ENDASH%', $enDash).Replace('%HEART%', $heart)

# --- Splice section first (indices refer to original string) ---
$html = $html.Substring(0, $s) + $newSection + $html.Substring($e)

# --- Scoped hero CSS ---
$styleBlock = @'
<style id="tm-hero-style">
#home.tm-hero{position:relative;background:#fff;padding:60px 0 88px;margin:0;min-height:0;overflow:visible;}
#home .tm-container{max-width:1240px;margin:0 auto;padding:0 40px;}
#home .tm-grid{display:grid;grid-template-columns:1.02fr .98fr;gap:60px;align-items:center;}
#home .tm-pill{display:inline-flex;align-items:center;gap:10px;background:#f3eefc;color:#6d28d9;border-radius:999px;padding:10px 20px;font:700 12px/1 'Inter',system-ui,-apple-system,sans-serif;letter-spacing:.12em;text-transform:uppercase;box-shadow:0 2px 10px rgba(109,40,217,.08);}
#home .tm-pill-dot{width:9px;height:9px;border-radius:50%;background:#7c3aed;box-shadow:0 0 0 4px rgba(124,58,237,.16);flex:none;}
#home .tm-title{font-family:'Playfair Display',Georgia,'Times New Roman',serif;font-weight:800;font-size:clamp(46px,4.6vw,72px);line-height:1.07;letter-spacing:-.5px;margin:26px 0 22px;}
#home .tm-title span{display:block;}
#home .tm-navy{color:#141b33;}
#home .tm-purple{color:#6d28d9;}
#home .tm-lede{max-width:500px;color:#5d5872;font:400 17px/1.75 'Inter',system-ui,-apple-system,sans-serif;margin:0 0 34px;}
#home .tm-actions{display:flex;flex-wrap:wrap;gap:18px;margin:0 0 38px;}
#home .tm-btn{display:inline-flex;align-items:center;justify-content:center;gap:10px;height:56px;padding:0 32px;border-radius:999px;font:600 15.5px/1 'Inter',system-ui,-apple-system,sans-serif;text-decoration:none;transition:transform .25s ease,box-shadow .25s ease,background .25s ease;}
#home .tm-btn-primary{background:linear-gradient(135deg,#7c3aed,#5b21b6);color:#fff;box-shadow:0 14px 28px rgba(91,33,182,.30);}
#home .tm-btn-primary:hover{transform:translateY(-2px);box-shadow:0 18px 34px rgba(91,33,182,.36);}
#home .tm-btn-primary svg{width:19px;height:19px;fill:currentColor;flex:none;}
#home .tm-btn-ghost{background:#fff;color:#6d28d9;border:2px solid #7c3aed;}
#home .tm-btn-ghost:hover{background:#f6f1fd;transform:translateY(-2px);}
#home .tm-feats{list-style:none;display:flex;flex-wrap:wrap;gap:14px 30px;margin:0;padding:0;}
#home .tm-feats li{display:flex;align-items:center;gap:11px;font:600 14px/1.3 'Inter',system-ui,-apple-system,sans-serif;color:#37324a;}
#home .tm-feat-ico{width:36px;height:36px;flex:none;border-radius:50%;background:#f3eefc;color:#6d28d9;display:inline-flex;align-items:center;justify-content:center;}
#home .tm-feat-ico svg{width:18px;height:18px;fill:none;stroke:currentColor;stroke-width:1.8;stroke-linecap:round;stroke-linejoin:round;}
#home .tm-media{position:relative;}
#home .tm-photo{width:100%;height:540px;object-fit:cover;object-position:center;border-radius:26px 26px 0 0;display:block;box-shadow:0 30px 60px rgba(19,27,51,.16);}
#home .tm-wave{position:absolute;left:0;bottom:-1px;width:100%;height:118px;pointer-events:none;display:block;}
#home .tm-badge{position:absolute;right:-26px;bottom:46px;width:158px;height:158px;border-radius:50%;background:#fff;box-shadow:0 18px 40px rgba(19,27,51,.18);display:flex;flex-direction:column;align-items:center;justify-content:center;gap:1px;font-family:'Playfair Display',Georgia,serif;color:#5b21b6;text-align:center;z-index:2;}
#home .tm-badge span{font-size:17px;font-weight:700;line-height:1.3;}
#home .tm-badge-heart{color:#e11d48;font-size:20px;line-height:1.1;}
@media (max-width:1080px){
  #home .tm-grid{grid-template-columns:1fr;gap:52px;}
  #home .tm-photo{height:440px;}
  #home .tm-badge{right:16px;}
}
@media (max-width:640px){
  #home.tm-hero{padding:36px 0 66px;}
  #home .tm-container{padding:0 22px;}
  #home .tm-title{font-size:clamp(38px,10.5vw,46px);margin:20px 0 16px;}
  #home .tm-lede{font-size:15.5px;margin-bottom:26px;}
  #home .tm-actions{flex-direction:column;align-items:stretch;gap:14px;margin-bottom:30px;}
  #home .tm-btn{width:100%;}
  #home .tm-feats{flex-direction:column;align-items:flex-start;gap:14px;}
  #home .tm-photo{height:320px;border-radius:20px 20px 0 0;}
  #home .tm-wave{height:82px;}
  #home .tm-badge{width:122px;height:122px;right:10px;bottom:28px;}
  #home .tm-badge span{font-size:13.5px;}
  #home .tm-badge-heart{font-size:16px;}
}
</style>
'@

# --- Inject font links (only if Playfair not already loaded) + style before </head> ---
$inject = ''
if ($html -notmatch 'Playfair') {
    $inject += "<link rel=""preconnect"" href=""https://fonts.googleapis.com"">`n    <link rel=""preconnect"" href=""https://fonts.gstatic.com"" crossorigin>`n    <link href=""https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;800&family=Inter:wght@400;500;600;700&display=swap"" rel=""stylesheet"">`n    "
}
$inject += $styleBlock + "`n"

$headIdx = $html.IndexOf('</head>')
$bodyIdx = $html.IndexOf('</body>')
if ($headIdx -ge 0) {
    $html = $html.Substring(0, $headIdx) + $inject + $html.Substring($headIdx)
    $where = 'head'
} elseif ($bodyIdx -ge 0) {
    $html = $html.Substring(0, $bodyIdx) + $inject + $html.Substring($bodyIdx)
    $where = 'body'
} else {
    $html = $html + $inject
    $where = 'end'
}

$utf8 = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($path, $html, $utf8)
Write-Output ('OK hero replaced chars=[' + $s + '..' + $e + ') styleInjected=' + $where + ' newSize=' + $html.Length)