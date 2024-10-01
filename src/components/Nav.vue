<template>
  <nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
      <a class="navbar-brand" href="#">FootPlayer</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 justify-content-end w-100">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="#hero">Accueil</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#news">Actualités</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#player">Joueur</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#competition">Compétitions & équipes</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>
<script>
export default {
  name: "NavComponent",
};
</script>
<style>
.navbar {
  background-color: rgb(0, 0, 91);
}
.nav-link {
  color: White;
}
.nav-link:hover {
  color: rgb(202, 202, 202);
}
.navbar-brand {
  color: white;
}
.navbar-toggler {
  background-color: white;
}
</style>
