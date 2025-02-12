<script>
export default {
  name: 'PostCard',
  data() {
    return {
      newPost: '',
      posts: [],
    }
  },
  methods: {
    publishPost() {
      if (this.newPost.trim() !== '') {
        this.posts.push(this.newPost)
        this.newPost = ''
      }
    },
  },
}
</script>

<template>
  <div class="post-container">
    <div class="posts">
      <div v-for="(post, index) in posts" :key="index" class="post-card">
        <p>{{ post }}</p>
      </div>
    </div>
    <div class="post-input">
      <textarea v-model="newPost" placeholder="Écrivez votre message..."></textarea>
      <button @click="publishPost">Publier</button>
    </div>
  </div>
</template>

<style scoped>
.post-container {
  width: 50%;
  margin: auto;
  text-align: left;
}
.posts {
  margin-bottom: 20px;
}
.post-card {
  background: #f5f5f5;
  padding: 10px;
  margin: 10px 0;
  border-radius: 5px;
}
.post-input {
  display: flex;
  flex-direction: column;
}
textarea {
  width: 100%;
  height: 80px;
  margin-bottom: 10px;
}
button {
  align-self: flex-end;
  padding: 5px 10px;
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
}
button:hover {
  background-color: #0056b3;
}
</style>
