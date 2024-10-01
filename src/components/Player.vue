<template>
  <section id="player" class="player py-4">
    <!-- Filter Inputs -->
    <div class="container" v-if="!loading">
      <h1 class="player__title">Joueurs</h1>

      <div class="row mt-4">
        <!-- Nom du Joueur -->
        <div class="col-12 col-md-4">
          <input
            type="text"
            v-model="filters.name"
            placeholder="Nom du Joueur"
            class="form-control mr-3 mt-2"
          />
        </div>

        <!-- Nationalité Dropdown -->
        <div class="col-12 col-md-4">
          <select v-model="filters.nationality" class="form-control mr-3 mt-2">
            <option value="">Sélectionner une nationalité</option>
            <option
              v-for="nationality in nationalities"
              :key="nationality.nationalityId"
              :value="nationality.nationalityName"
            >
              {{ nationality.nationalityName }}
            </option>
          </select>
        </div>

        <!-- Position sur le terrain Dropdown -->
        <div class="col-12 col-md-4">
          <select v-model="filters.position" class="form-control mr-3 mt-2">
            <option value="">Sélectionner une position</option>
            <option
              v-for="position in positions"
              :key="position.positionId"
              :value="position.positionName"
            >
              {{ position.positionName }}
            </option>
          </select>
        </div>

        <!-- Ligue Dropdown -->
        <div class="col-12 col-md-4">
          <select v-model="filters.league" class="form-control mr-3 mt-2">
            <option value="">Sélectionner une ligue</option>
            <option
              v-for="league in leagues"
              :key="league.leagueId"
              :value="league.leagueName"
            >
              {{ league.leagueName }}
            </option>
          </select>
        </div>

        <!-- Pied de jeu Dropdown -->
        <div class="col-12 col-md-4">
          <select v-model="filters.foot" class="form-control mr-3 mt-2">
            <option value="">Sélectionner le pied de jeu</option>
            <option value="1">Pied droit</option>
            <option value="2">Pied gauche</option>
            <option value="3">Les deux</option>
          </select>
        </div>

        <!-- Statut contractuel Dropdown -->
        <div class="col-12 col-md-4">
          <select
            v-model="filters.contractStatus"
            class="form-control mr-3 mt-2"
          >
            <option value="">Sélectionner le statut contractuel</option>
            <option value="under_contract">Sous contrat</option>
            <option value="free">Libre</option>
          </select>
        </div>

        <!-- Taille du joueur -->
        <div class="col-12 col-md-4">
          <input
            type="number"
            v-model="filters.height"
            placeholder="Taille (cm)"
            class="form-control mr-3 mt-2"
            min="0"
          />
        </div>

        <!-- Poids -->
        <div class="col-12 col-md-4">
          <input
            type="number"
            v-model="filters.weight"
            placeholder="Poids (kg)"
            class="form-control mr-3 mt-2"
            min="0"
          />
        </div>

        <!-- Valeur marchande -->
        <div class="col-12 col-md-4">
          <input
            type="number"
            v-model="filters.worth"
            placeholder="Valeur marchande ($)"
            class="form-control mr-3 mt-2"
            min="0"
          />
        </div>

        <!-- Âge -->
        <div class="col-12 col-md-4">
          <input
            type="number"
            v-model="filters.age"
            placeholder="Âge"
            class="form-control mr-3 mt-2"
            min="0"
          />
        </div>

        <!-- Date d'expiration de contrat -->
        <div class="col-12 col-md-4">
          <input
            type="date"
            v-model="filters.contractEndDate"
            placeholder="Date d'expiration de contrat"
            class="form-control mr-3 mt-2"
          />
        </div>
        <!-- Reset Filters Button -->
        <div class="col-12 col-md-4">
          <button
            class="btn btn-primary form-control mr-3 mt-2"
            @click="resetFilters"
          >
            Réinitialiser les filtres
          </button>
        </div>
      </div>
      <!-- Players Cards -->
      <div class="row my-4" v-if="!loading">
        <div
          class="col-md-6 col-lg-4 col-sm-12 my-3 mb-sm-0"
          v-for="p in paginatedPlayers"
          :key="p.playerId"
        >
          <div class="card">
            <img
              :src="'data:image/png;base64,' + p.playerImage"
              class="card-img-top"
              :alt="p.playerFirstName + ' ' + p.playerLastName"
            />
            <div class="card-body">
              <h5 class="card-title">
                {{ p.playerFirstName }} {{ p.playerLastName }}
              </h5>
              <div class="d-flex justify-content-between">
                <ul class="player__information">
                  <li class="player__information__list mt-2">
                    <i class="fa fa-globe" aria-hidden="true"></i>
                    {{ p.nationalityDto.nationalityName }}
                  </li>

                  <li class="player__information__list mt-2">
                    <i class="fa fa-birthday-cake" aria-hidden="true"></i>
                    {{ p.age }}
                  </li>
                  <li class="player__information__list mt-2">
                    <i class="fa fa-usd" aria-hidden="true"></i>
                    {{ p.playerMarketValueDto.playerMarketValue }} $
                  </li>
                  <li
                    class="player__information__list mt-2 d-flex align-items-center"
                  >
                    <i class="fa-solid fa-socks"></i>
                    <div v-if="p.playerFoot === 1">Pied fort: droit</div>
                    <div v-if="p.playerFoot === 2">Pied fort: gauche</div>
                    <div v-if="p.playerFoot === 3">Pied fort: les deux</div>
                  </li>
                  <li
                    class="player__information__list mt-2 d-flex align-items-center"
                  >
                    <i class="fa-solid fa-arrows-up-down"></i>
                    {{ p.playerHeight }} Cm
                  </li>
                  <li
                    class="player__information__list mt-2 d-flex align-items-center"
                  >
                    <i class="fa-solid fa-weight-hanging"></i>
                    {{ p.playerWeight }} Kg
                  </li>
                  <li
                    class="player__information__list mt-2 d-flex align-items-center"
                  >
                    <i class="fa-solid fa-location-dot"></i>
                    {{ p.positionDto.positionName }}
                  </li>
                </ul>
                <ul>
                  <li
                    class="player__information__list mt-2 d-flex align-items-center"
                  >
                    <i class="fa-solid fa-shield-halved"></i>
                    <div
                      v-if="
                        p.playerTeamContractDto &&
                        p.playerTeamContractDto.teamDto
                      "
                    >
                      {{ p.playerTeamContractDto.teamDto.teamName }}
                    </div>
                    <div v-else>Joueur libre</div>
                  </li>
                  <li
                    v-if="p.playerTeamContractDto"
                    class="player__information__list mt-2 d-flex align-items-center"
                  >
                    <i class="fa-regular fa-calendar"></i>
                    <div>
                      {{
                        formatDate(p.playerTeamContractDto.contractStartDate)
                      }}
                      -
                      {{ formatDate(p.playerTeamContractDto.contractEndDate) }}
                    </div>
                  </li>
                  <li
                    v-if="p.playerTeamContractDto"
                    class="player__information__list mt-2 d-flex align-items-center"
                  >
                    <i class="fa-solid fa-money-check-dollar"></i>
                    <div>{{ p.playerTeamContractDto.contractValue }} $</div>
                  </li>
                  <li
                    v-if="
                      p.playerTeamContractDto &&
                      p.playerTeamContractDto.teamDto.league
                    "
                    class="player__information__list mt-2 d-flex align-items-center"
                  >
                    <i class="fa-solid fa-trophy"></i>
                    {{ p.playerTeamContractDto.teamDto.league.leagueName }}
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Pagination Controls -->
      <div class="pagination mt-4 d-flex justify-content-center">
        <button
          class="btn btn-secondary"
          @click="prevPage"
          :disabled="currentPage === 1"
        >
          Précèdent
        </button>
        <button
          class="btn btn-secondary mx-2"
          v-for="page in totalPages"
          :key="page"
          @click="goToPage(page)"
          :class="{ active: currentPage === page }"
        >
          {{ page }}
        </button>
        <button
          class="btn btn-secondary"
          @click="nextPage"
          :disabled="currentPage === totalPages"
        >
          Suivant
        </button>
      </div>
    </div>
    <p v-else>Chargement...</p>
  </section>
</template>

<script>
export default {
  name: "PlayerComponent",
  data() {
    return {
      players: [],
      nationalities: [],
      positions: [],
      leagues: [],
      filteredPlayers: [],
      loading: true,
      filters: {
        name: "",
        nationality: "",
        position: "",
        league: "",
        foot: "",
        contractStatus: "",
        height: "",
        weight: "",
        worth: "",
        age: "",
        contractEndDate: "",
      },
      // Pagination settings
      currentPage: 1,
      playersPerPage: 8,
    };
  },
  computed: {
    // Calculate paginated players based on current page and filters
    paginatedPlayers() {
      const start = (this.currentPage - 1) * this.playersPerPage;
      const end = start + this.playersPerPage;
      return this.filteredPlayers.slice(start, end);
    },
    totalPages() {
      return Math.ceil(this.filteredPlayers.length / this.playersPerPage);
    },
  },
  methods: {
    // Formate la date au format JJ/MM/AAAA
    formatDate(dateStr) {
      const date = new Date(dateStr);
      const day = String(date.getDate()).padStart(2, "0");
      const month = String(date.getMonth() + 1).padStart(2, "0");
      const year = date.getFullYear();
      return `${day}/${month}/${year}`;
    },
    // Fetch all required data from APIs
    async fetchAllData() {
      try {
        const [playersRes, nationalitiesRes, positionsRes, leaguesRes] =
          await Promise.all([
            fetch("http://localhost:9090/Player/getAllPlayers"),
            fetch("http://localhost:9090/Settings/getAllNationality"),
            fetch("http://localhost:9090/Settings/getAllPosition"),
            fetch("http://localhost:9090/League/getAllLeagues"),
          ]);

        const [playersData, nationalitiesData, positionsData, leaguesData] =
          await Promise.all([
            playersRes.json(),
            nationalitiesRes.json(),
            positionsRes.json(),
            leaguesRes.json(),
          ]);

        this.players = playersData;
        this.filteredPlayers = playersData;
        this.nationalities = nationalitiesData;
        this.positions = positionsData;
        this.leagues = leaguesData;
        this.loading = false;
      } catch (error) {
        console.error("Erreur lors du chargement des données:", error);
        this.loading = false;
      }
    },
    // Filter players based on search criteria
    filterPlayers() {
      this.filteredPlayers = this.players.filter((player) => {
        // Filtrer par nom
        const matchesName =
          player.playerFirstName
            .toLowerCase()
            .includes(this.filters.name.toLowerCase()) ||
          player.playerLastName
            .toLowerCase()
            .includes(this.filters.name.toLowerCase());

        // Filtrer par nationalité
        const matchesNationality = this.filters.nationality
          ? player.nationalityDto.nationalityName === this.filters.nationality
          : true;

        // Filtrer par position
        const matchesPosition = this.filters.position
          ? player.positionDto.positionName === this.filters.position
          : true;

        // Filtrer par ligue
        const matchesLeague = this.filters.league
          ? player.playerTeamContractDto &&
            player.playerTeamContractDto.teamDto &&
            player.playerTeamContractDto.teamDto.league &&
            player.playerTeamContractDto.teamDto.league.leagueName ===
              this.filters.league
          : true;

        // Filtrer par pied de jeu
        const matchesFoot = this.filters.foot
          ? player.playerFoot === Number(this.filters.foot)
          : true;

        // Filtrer par statut contractuel
        const matchesContractStatus =
          this.filters.contractStatus === "under_contract"
            ? player.playerTeamContractDto !== null
            : this.filters.contractStatus === "free"
            ? player.playerTeamContractDto === null
            : true;

        // Filtrer par taille
        const matchesHeight = this.filters.height
          ? Number(player.playerHeight) === Number(this.filters.height)
          : true;

        // Filtrer par poids
        const matchesWeight = this.filters.weight
          ? Number(player.playerWeight) === Number(this.filters.weight)
          : true;

        // Filtrer par valeur marchande
        const matchesWorth = this.filters.worth
          ? Number(player.playerMarketValueDto.playerMarketValue) ===
            Number(this.filters.worth)
          : true;

        // Filtrer par âge
        const matchesAge = this.filters.age
          ? Number(player.age) === Number(this.filters.age)
          : true;

        // Filtrer par date d'expiration de contrat
        const matchesContractEndDate = this.filters.contractEndDate
          ? player.playerTeamContractDto &&
            new Date(player.playerTeamContractDto.contractEndDate) <=
              new Date(this.filters.contractEndDate)
          : true;

        return (
          matchesName &&
          matchesNationality &&
          matchesPosition &&
          matchesLeague &&
          matchesFoot &&
          matchesContractStatus &&
          matchesHeight &&
          matchesWeight &&
          matchesWorth &&
          matchesAge &&
          matchesContractEndDate
        );
      });
      this.currentPage = 1; // Reset to the first page after filter change
    },
    // Pagination methods
    nextPage() {
      if (this.currentPage < this.totalPages) this.currentPage++;
    },
    prevPage() {
      if (this.currentPage > 1) this.currentPage--;
    },
    goToPage(page) {
      this.currentPage = page;
    },
    // Réinitialiser tous les filtres
    resetFilters() {
      this.filters = {
        name: "",
        nationality: "",
        position: "",
        league: "",
        foot: "",
        contractStatus: "",
        height: "",
        weight: "",
        worth: "",
        age: "",
        contractEndDate: "",
      };
      this.filteredPlayers = this.players;
      this.currentPage = 1;
    },
  },
  watch: {
    // Watchers pour un filtrage en temps réel
    "filters.name": "filterPlayers",
    "filters.nationality": "filterPlayers",
    "filters.position": "filterPlayers",
    "filters.league": "filterPlayers",
    "filters.foot": "filterPlayers",
    "filters.contractStatus": "filterPlayers",
    "filters.height": "filterPlayers",
    "filters.weight": "filterPlayers",
    "filters.worth": "filterPlayers",
    "filters.age": "filterPlayers",
    "filters.contractEndDate": "filterPlayers",
  },
  mounted() {
    this.fetchAllData();
  },
};
</script>

<style>
.player {
  background-color: rgb(250, 250, 250);
}

.player__title {
  font-size: 35px;
}

.pagination button.active {
  background-color: #003772;
  color: white;
}

.player__information {
  list-style-type: none;
  width: 70%;
}

.player__information__list i {
  margin-right: 5px;
}
ul {
  margin: 0;
  padding: 0;
}
</style>
