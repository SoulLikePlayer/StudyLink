<template>
  <div class="post-card">
    <img v-if="post.image" :src="post.image" alt="Post Image" class="post-image" />
    <p class="post-text">{{ post.text }}</p>
  </div>
  <p class="post-created-at">Publier le {{ post.createdAtDays }} à {{ post.createdAtHours }}</p>
</template>

<script>
export default {
  name: 'PostCard',
  props: {
    post: Object,
  },
}
</script>

<style scoped>
.post-card {
  background: white;
  padding: 15px;
  margin-top: 10px;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}
.post-image {
  width: 50%;
  height: 50%;
  max-height: 300px;
  object-fit: cover;
  border-radius: 10px;
  margin-bottom: 10px;
}
.post-text {
  text-align: left !important;
  font-size: 14px;
  color: #333;
}

.post-created-at {
  text-align: left !important;
  font-style: italic;
}
</style>
