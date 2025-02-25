<template>
  <div class="post-input-container">
    <button @click="toggleInput" class="toggle-button" :class="{ expanded: isExpanded }">+</button>
    <transition name="fade-slide">
      <div v-if="isExpanded" class="post-input">
        <textarea v-model="newPostText" placeholder="Quoi de neuf ?"></textarea>
        <label for="imageUpload" class="icon-button">📷</label>
        <input id="imageUpload" type="file" accept="image/*" @change="handleImageUpload" hidden />
        <div v-if="newPostImage" class="preview-container">
          <img :src="newPostImage" alt="Preview" class="preview-image" />
        </div>
        <button @click="publishPost">Publier</button>
      </div>
    </transition>
  </div>
</template>

<script>
import moment from 'moment'
import 'moment/dist/locale/fr'

moment.locale('fr')

class Post {
  constructor({ text = '', image = null, biography = null}) {
    console.log(moment.locale())
    this.id = Math.random().toString(16).slice(2)
    this.text = text
    this.image = image
    this.biography = biography
    this.createdAtDays = moment(new Date()).format('dddd D MMMM')
    this.createdAtHours = moment(new Date()).format('HH:mm')
  }
}

export default {
  name: 'PostInput',
  data() {
    return {
      newPostText: '',
      newPostImage: null,
      isExpanded: false,
    }
  },
  methods: {
    toggleInput() {
      this.isExpanded = !this.isExpanded
    },
    handleImageUpload(event) {
      const file = event.target.files[0]
      if (file) {
        const reader = new FileReader()
        reader.onload = () => {
          this.newPostImage = reader.result
        }
        reader.readAsDataURL(file)
      }
    },
    publishPost() {
      if (this.newPostText.trim() || this.newPostImage) {
        const newPost = new Post({
          text: this.newPostText,
          image: this.newPostImage,
        })
        this.$emit('post-created', newPost)
        this.resetForm()
      }
    },
    resetForm() {
      this.newPostText = ''
      this.newPostImage = null
      this.isExpanded = false
    },
  },
}
</script>

<style scoped>
.post-input-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  border: none;
}
.toggle-button {
  background-color: #1da1f2;
  color: white;
  border: none;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  font-size: 24px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition:
    transform 0.3s ease,
    background-color 0.3s ease;
}
.toggle-button.expanded {
  transform: rotate(45deg);
  background-color: #0d8bec;
}
.post-input {
  background: white;
  padding: 15px;
  border-radius: 10px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  width: 100%;
  max-width: 400px;
  margin-top: 15px;
}
textarea {
  width: 100%;
  border: none;
  outline: none;
  resize: none;
  padding: 10px;
  border-radius: 5px;
  background: #f0f2f5;
  min-height: 80px;
}
.icon-button {
  font-size: 24px;
  cursor: pointer;
  margin-top: 10px;
}
.preview-container {
  margin-top: 10px;
}
.preview-image {
  width: 100%;
  max-height: 200px;
  object-fit: cover;
  border-radius: 10px;
}
button {
  margin-top: 10px;
  padding: 10px;
  background-color: #1da1f2;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-weight: bold;
  transition: background-color 0.3s ease;
}
button:hover {
  background-color: #0d8bec;
}
.fade-slide-enter-active,
.fade-slide-leave-active {
  transition:
    opacity 0.3s ease,
    transform 0.3s ease;
}
.fade-slide-enter,
.fade-slide-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
</style>
