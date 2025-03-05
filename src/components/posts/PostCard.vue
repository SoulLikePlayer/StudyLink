<template>
  <div class="post-header">
    <img v-if="post.author.profilePicture" :src="post.author.profilePicture" alt="Profile Picture" class="profile-picture" />
    <p class="post-author">{{ post.author.username }}</p>
  </div>
  <div class="post-card">
    <img v-if="post.image" :src="post.image" alt="Post Image" class="post-image" />
    <p class="post-text">{{ post.text }}</p>
  </div>
  <p class="post-created-at">Le {{ post.createdAtDays }} à {{ post.createdAtHours }}</p>
</template>

<script setup>
import "../../assets/PostCard.css"

defineProps({
  post: Object,
});
</script>
