<template>
  <section :id="imageFolder" class="competition my-5">
    <hr />
    <div class="container" v-if="title === 'ligue'">
      <h1 class="competition__title">{{ title }}</h1>
      <Carousel :items-to-show="3.1" :wrap-around="true">
        <Slide v-for="competition in listOfObj" :key="competition.leagueId">
          <div
            class="carousel__item d-flex justify-content-between align-items-center"
          >
            <img
              :src="'data:image/png;base64,' + competition.leagueLogo"
              class="carousel__item__image"
              :alt="competition.leagueLogo"
            />
            <div>
              <p class="mx-2">{{ competition.leagueName }}</p>
              <!-- <span>{{ competition.pays }}</span> -->
            </div>
          </div>
        </Slide>

        <template #addons>
          <Navigation />
        </template>
      </Carousel>
    </div>

    <div class="container" v-else-if="title === 'équipe'">
      <h1 class="competition__title">{{ title }}</h1>
      <Carousel :items-to-show="3.1" :wrap-around="true">
        <Slide v-for="competition in listOfObj" :key="competition.teamId">
          <div
            class="carousel__item d-flex justify-content-between align-items-center"
          >
            <img
              :src="'data:image/png;base64,' + competition.teamLogo"
              class="carousel__item__image"
              alt="..."
            />
            <div>
              <p class="mx-2">{{ competition.teamName }}</p>
              <!-- <span>{{ competition.pays }}</span> -->
            </div>
          </div>
        </Slide>

        <template #addons>
          <Navigation />
        </template>
      </Carousel>
    </div>
    <p v-else>lol</p>
    <hr />
  </section>
</template>
<script>
import { Carousel, Navigation, Slide } from "vue3-carousel";

import "vue3-carousel/dist/carousel.css";
export default {
  name: "CustomCard",
  props: {
    title: String,
    imageFolder: String,
    listOfObj: Array,
  },
  components: {
    Carousel,
    Slide,
    Navigation,
  },
  //   data() {
  //     return {
  //       competitions: [],
  //       loading: true,
  //     };
  //   },
  //   mounted() {
  //     fetch("http://localhost:3000/competition")
  //       .then((res) => res.json())
  //       .then((data) => {
  //         this.competitions = data;
  //         this.loading = false;
  //       })
  //       .catch((err) => console.log(err));
  //   },
};
</script>
<style>
.carousel__item {
  border: 1px solid rgb(203, 203, 203);
  border-radius: 5px;
  padding: 15px 25px;
  background-color: white;
}
.carousel__item__image {
  width: 100px;
}
.competition {
  background-color: rgba(248, 248, 248, 0.474);
}
.competition__title {
  font-size: 25px;
}
</style>
