<template>
  <section id="hero" class="hero section dark-background">
    <img :src="require('@/assets/background.jpg')" alt="" data-aos="fade-in" />
    <div
      class="container text-start position-relative d-flex flex-column"
      data-aos="fade-up"
      data-aos-delay="100"
    >
      <h2 class="hero__title">Découvrir L'univers Du Sport</h2>
      <p class="hero_subtitle">L'univers du Sport</p>
    </div>
  </section>
</template>
<script>
export default {
  name: "HeaderCompnent",
};
</script>
<style>
.hero {
  width: 100%;
  min-height: 90vh;
  position: relative;
  /* padding: 120px 0 60px 0; */
  display: flex;
  align-items: center;
  justify-content: center;
}

.hero:before {
  content: "";
  background: color-mix(in srgb, rgba(0, 0, 0, 0.438), transparent 30%);
  position: absolute;
  inset: 0;
  z-index: 2;
}

.hero img {
  position: absolute;
  inset: 0;
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
  z-index: 1;
}

.hero .container {
  position: relative;
  z-index: 3;
  /* left: 64px; */
}

.hero h2 {
  margin: 0;
  color: white;
  font-size: 36px;
  font-weight: 700;
  line-height: 56px;
}

.hero p {
  color: color-mix(in srgb, white, transparent 20%);
  margin: 10px 0 0 0;
  font-size: 16px;
  font-weight: 500;
  letter-spacing: 1px;
}

@media (max-width: 640px) {
  .hero h1 {
    font-size: 30px;
    line-height: 36px;
  }
}
@media (max-width: 2647px) {
  .hero__scroll-btn {
    bottom: 105px;
  }
}

/* Element: Scroll Button */
.hero__scroll-btn {
  position: absolute;
  bottom: 50px;
  left: 50%;
  transform: translateX(-50%);
  font-size: 1.75rem;
  color: white;
  background: none;
  text-decoration: none;
  transition: transform 0.3s ease, color 0.3s ease;
  z-index: 50;
  height: 40px;
  width: 40px;
  border: 1px solid black;
  border-radius: 5em;
  display: flex;
  justify-content: center;
  background-color: black;
  align-items: center;
}

.hero .btn-scroll i {
  font-size: 48px;
}

.hero .btn-scroll:hover {
  color: var(--accent-color);
}
</style>
