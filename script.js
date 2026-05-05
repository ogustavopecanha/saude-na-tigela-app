document.addEventListener("DOMContentLoaded", () => {
  /* ── Scroll Reveal ── */
  const revealObs = new IntersectionObserver((entries, obs) => {
    entries.forEach(e => {
      if (e.isIntersecting) { e.target.classList.add("active"); obs.unobserve(e.target); }
    });
  }, { threshold: 0.12 });
  document.querySelectorAll(".reveal").forEach(el => revealObs.observe(el));

  /* ── Header Scroll State ── */
  const header = document.getElementById("header");
  window.addEventListener("scroll", () => {
    header.classList.toggle("scrolled", window.scrollY > 50);
  });

  /* ── Floating CTA ── */
  const floating = document.getElementById("floating-cta");
  if (floating) {
    const offerSection = document.getElementById("offer");
    window.addEventListener("scroll", () => {
      const show = window.scrollY > 600 && (!offerSection || offerSection.getBoundingClientRect().top > 200);
      floating.classList.toggle("visible", show);
    });
  }

  /* ── FAQ Accordion ── */
  document.querySelectorAll(".faq-question").forEach(btn => {
    btn.addEventListener("click", () => {
      const item = btn.parentElement;
      const wasOpen = item.classList.contains("open");
      document.querySelectorAll(".faq-item.open").forEach(i => {
        i.classList.remove("open");
        i.querySelector(".faq-question").setAttribute("aria-expanded", "false");
      });
      if (!wasOpen) {
        item.classList.add("open");
        btn.setAttribute("aria-expanded", "true");
      }
    });
  });

  /* ── Animated Counter (Social Proof) ── */
  const counterObs = new IntersectionObserver((entries, obs) => {
    entries.forEach(e => {
      if (!e.isIntersecting) return;
      const el = e.target;
      const target = parseInt(el.dataset.target, 10);
      const duration = 2000;
      const start = performance.now();

      const formatNumber = (n) => {
        if (n >= 1000) return n.toLocaleString("pt-BR");
        return n.toString();
      };

      const animate = (now) => {
        const progress = Math.min((now - start) / duration, 1);
        const eased = 1 - Math.pow(1 - progress, 3); // easeOutCubic
        const current = Math.floor(eased * target);
        el.textContent = formatNumber(current);
        if (progress < 1) requestAnimationFrame(animate);
        else el.textContent = formatNumber(target);
      };
      requestAnimationFrame(animate);
      obs.unobserve(el);
    });
  }, { threshold: 0.5 });

  document.querySelectorAll(".counter-number").forEach(el => counterObs.observe(el));

  /* ── Kiwify Pixel: Track InitiateCheckout ── */
  document.querySelectorAll(".cta-checkout").forEach(btn => {
    btn.addEventListener("click", () => {
      if (typeof fbq === "function") {
        fbq("track", "InitiateCheckout", {
          content_name: "Saúde na Tigela na Prática",
          content_category: "Pets & Nutrição",
          value: 297.00,
          currency: "BRL",
        });
      }
    });
  });

  /* ── Smooth scroll for anchor links ── */
  document.querySelectorAll('a[href^="#"]').forEach(a => {
    a.addEventListener("click", e => {
      e.preventDefault();
      const target = document.querySelector(a.getAttribute("href"));
      if (target) target.scrollIntoView({ behavior: "smooth", block: "start" });
    });
  });

  /* ── Subtle parallax on hero image ── */
  const heroImg = document.querySelector(".hero-image");
  if (heroImg && window.matchMedia("(min-width: 768px)").matches) {
    window.addEventListener("scroll", () => {
      const y = window.scrollY;
      if (y < 800) {
        heroImg.style.transform = `translateY(${y * 0.04}px)`;
      }
    }, { passive: true });
  }
});
