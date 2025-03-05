<template>
  <div class="home-container">
    <h1>Bienvenue chez StudyLink</h1>
    <div class="posts-wrapper">
      <PostCard v-for="(post, index) in sortedPosts" :key="index" :post="post" />
    </div>
    <PostInput @post-created="addPost" class="post-input-fixed" />
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import PostCard from '@/components/posts/PostCard.vue';
import PostInput from '@/components/posts/PostInput.vue';
import "../assets/HomeView.css"

const posts = ref([]);

const sortedPosts = computed(() => {
  return [...posts.value].sort((a, b) => b.timestamp - a.timestamp);
});

const addPost = (post) => {
  posts.value.push(post);
};
</script>


