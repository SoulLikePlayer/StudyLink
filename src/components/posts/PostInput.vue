<template>
  <div class="post-input-container">
    <button @click="toggleInput" class="toggle-button" :class="{ expanded: isExpanded }">+</button>
    <transition name="fade-slide">
      <div v-if="isExpanded" class="post-input">
        <textarea v-model="newPostText" placeholder="Quoi de neuf ?"></textarea>

        <label for="imageUpload" class="icon-button">Posté une Photo</label>
        <input id="imageUpload" type="file" accept="image/*" @change="handleImageUpload" hidden />
        <div v-if="newPostImage" class="preview-container">
          <img :src="newPostImage" alt="Preview" class="preview-image" />
        </div>
        <button @click="publishPost">Publier</button>
      </div>
    </transition>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import Author from '../data/Author';
import Post from '../data/Post';
import "../../assets/PostInput.css";

const newPostText = ref('');
const newPostImage = ref(null);
const isExpanded = ref(false);

const emit = defineEmits(['post-created']);

const toggleInput = () => {
  isExpanded.value = !isExpanded.value;
};

const handleImageUpload = (event) => {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = () => {
      newPostImage.value = reader.result;
    };
    reader.readAsDataURL(file);
  }
};

const publishPost = () => {
  if (newPostText.value.trim() || newPostImage.value) {
    const author = new Author({
      username: "Louis LAZARE",
      profilePicture: "https://e7.pngegg.com/pngimages/96/344/png-clipart-user-profile-instagram-computer-icons-insta-head-silhouette.png"
    });

    const newPost = new Post({
      text: newPostText.value,
      image: newPostImage.value,
      author: author,
    });
    emit('post-created', newPost);
    resetForm();
  }
};

const resetForm = () => {
  newPostText.value = '';
  newPostImage.value = null;
  isExpanded.value = false;
};
</script>


