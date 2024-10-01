<template>
  <section id="news" class="container my-5 news">
    <h1 class="news__title">À la une</h1>
    <span class="news__subtitle">
      Les actualités et opinions les plus chaudes du monde du football
    </span>

    <div class="row my-4">
      <div
        class="col-md-4 col-sm-12 my-3 mb-sm-0"
        v-for="n in news"
        :key="n.id"
      >
        <div class="card">
          <img
            :src="require('@/assets/news/' + n.image)"
            class="card-img-top"
            alt="..."
          />

          <div class="card-body">
            <h5 class="card-title">{{ n.title }}</h5>
            <p class="card-text">
              {{ truncateDescription(n.content, 150) }}
            </p>
            <div class="news__info d-flex justify-content-between">
              <span class="news__info__date">{{ n.publish_time }}</span>
              <div class="d-flex justify-content-between w-25">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <i class="fa fa-heart-o" aria-hidden="true"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
<script>
export default {
  name: "NewsComponent",
  data() {
    return {
      news: [],
      featuredNews: {},
      loading: true,
    };
  },
  mounted() {
    fetch("http://localhost:3000/news")
      .then((res) => res.json())
      .then((data) => {
        this.news = data.slice(0, 6);
        this.featuredNews = data[0];
        this.loading = false;
        console.log(this.featuredNews);
      })
      .catch((err) => console.log(err));
  },
  methods: {
    calculateDaysUntil(dateString) {
      // Convert the input date string to a Date object
      const targetDate = new Date(dateString);

      // Get the current date
      const currentDate = new Date();

      // Calculate the time difference in milliseconds
      const timeDifference = targetDate - currentDate;

      // Convert milliseconds to days (1 day = 24 * 60 * 60 * 1000 milliseconds)
      const daysDifference = Math.ceil(timeDifference / (1000 * 60 * 60 * 24));

      return daysDifference * -1;
    },
    truncateDescription(description, maxLength) {
      // Check if the description is already within the limit
      if (description.length <= maxLength) {
        return description;
      }

      // Find the last space before the 250-character limit
      const truncated = description.slice(0, maxLength + 1).trim();

      // Return the truncated string, ensuring it doesn't cut a word
      return truncated.slice(0, truncated.lastIndexOf(" ")) + "...";
    },
  },
};
</script>
<style>
.card {
  cursor: pointer;
}
.card:hover {
  background-color: rgb(243, 243, 243);
  color: rgb(57, 57, 57);
  transition: 0.1s ease-in-out;
}
.card-img-top {
  height: 250px;
}
.news__title {
  font-size: 35px;
}
.news__subtitle {
  font-size: 15px;
  font-weight: 500;
  color: rgb(125, 125, 125);
}
.news__info__date {
  font-size: 10px;
  color: rgb(125, 125, 125);
}
.featured__image {
  /* margin-right: 30px; */
  width: 100%;
  padding: 0;
  margin: 0;
}
.news__featured {
  border: solid 1px rgb(176, 176, 176);
  border-radius: 5px;
}
</style>
