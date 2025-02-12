<template>
  <div>
    <h1>Bienvenue chez StudyLinks</h1>
    <PostCard />
  </div>
</template>

<script>
import PostCard from '@/components/posts/PostCard.vue'

export default {
  name: 'HomeView',
  components: {
    PostCard,
  },
}
</script>

<style scoped>
h1 {
  color: #333;
}
</style>
