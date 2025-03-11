<template>
  <header class="post-header">
    <img v-if="post.author.profilePicture" :src="post.author.profilePicture" alt="Profile Picture" class="profile-picture" />
    <a class="post-author">{{ post.author.username }}</a>

    <div class="post-actions">
      <button v-on:click="toggleLike" class="action-button">
        <HeartIcon :class="{'liked': post.isLiked}" class="icon-button"/>
      </button>
      <button v-on:click="deletePost" class="action-button">
        <TrashIcon class="icon-button" />
      </button>
    </div>
  </header>
  <article class="post-card">
    <img v-if="post.image" :src="post.image" alt="Post Image" class="post-image" />
    <p class="post-text">{{ post.text }}</p>
  </article>
  <footer>
    <p class="post-created-at">Le {{ post.createdAtDays }} à {{ post.createdAtHours }}</p>
  </footer>
</template>

<script setup>
import {TrashIcon, HeartIcon } from "@heroicons/vue/24/solid";
import "../../assets/PostCard.css"

const props = defineProps({
  post: {
    type: Object,
    required: true,
  }
});

const emit = defineEmits(['delete', "toggle-like"]);


function deletePost () {
  if (confirm("Voulez-vous vraiment supprimer ce post ?")) {
    emit('delete', props.post);
  }
};

function toggleLike (){
  emit('toggle-like', props.post)
}
</script>
