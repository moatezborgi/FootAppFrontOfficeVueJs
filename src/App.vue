<template>
  <NavComponent />
  <HeaderComponent />
  <NewsComponent />
  <PlayerComponent />
  <CustomCard
    :title="'ligue'"
    :listOfObj="competitions"
    :imageFolder="'competition'"
  />
  <CustomCard :title="'équipe'" :listOfObj="teams" :imageFolder="'teams'" />
  <FooterComponent />
</template>

<script>
import FooterComponent from "./components/Footer.vue";
import NavComponent from "./components/Nav.vue";
import HeaderComponent from "./components/Header.vue";
import NewsComponent from "./components/News.vue";
import PlayerComponent from "./components/Player.vue";
import CustomCard from "./components/CustomCard.vue";

export default {
  name: "App",
  data() {
    return {
      competitions: [],
      teams: [],
      loading: true,
    };
  },
  mounted() {
    fetch("http://localhost:9090/League/getAllLeagues")
      .then((res) => res.json())
      .then((data) => {
        this.competitions = data;
        console.log(this.competitions);
        this.loading = false;
      })
      .catch((err) => console.log(err));
    fetch("http://localhost:9090/Team/getAllTeams")
      .then((res) => res.json())
      .then((data) => {
        this.teams = data;
      })
      .catch((err) => console.log(err));
  },
  components: {
    FooterComponent,
    NavComponent,
    HeaderComponent,
    NewsComponent,
    PlayerComponent,
    CustomCard,
  },
};
</script>
