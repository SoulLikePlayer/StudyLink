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

const posts = ref([]);

const sortedPosts = computed(() => {
  return [...posts.value].sort((a, b) => b.timestamp - a.timestamp);
});

const addPost = (post) => {
  posts.value.push(post);
};
</script>

<style scoped>
.home-container {
  width: 50%;
  margin: auto;
  text-align: center;
  font-family: Arial, sans-serif;
  position: relative;
  padding-bottom: 80px;
}

h1 {
  color: #333;
  margin-bottom: 20px;
}

.posts-wrapper {
  padding-bottom: 100px;
}

.post-input-fixed {
  position: fixed;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 50%;
  background: white;
  padding: 15px;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
  border-top: 1px solid #ddd;
}
</style>

