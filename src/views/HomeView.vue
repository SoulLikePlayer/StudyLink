<template>
  <div class="home-container">
    <h1>Bienvenue chez StudyLink</h1>
    <div class="posts-wrapper">
      <template v-if="sortedPosts.length === 0">
        <p class="no-post">Aucun post n'a été créé pour l'instant. Soyez le premier à partager quelque chose !</p>
      </template>
      <PostCard v-for="(post, index) in sortedPosts" :key="index" :post="post" @delete="deletePost" @toggle-like="toggleLike"/>
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

function deletePost(postToDelete){
  posts.value = posts.value.filter(post => post.id !== postToDelete.id);
}

function toggleLike(postToLike){
  const post = posts.value.find((p) => p.id === postToLike.id);
  if (post){
    post.isLiked = !post.isLiked;
  }
}
</script>


