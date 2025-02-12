<template>
  <div class="post-input">
    <textarea v-model="newPost" placeholder="Quoi de neuf ?"></textarea>
    <label for="imageUpload" class="icon-button">📷</label>
    <input id="imageUpload" type="file" accept="image/*" @change="handleImageUpload" hidden />

    <div v-if="newImage" class="preview-container">
      <img :src="newImage" alt="Preview" class="preview-image" />
    </div>

    <button @click="publishPost">Publier</button>
  </div>
</template>

<script>
export default {
  name: 'PostInput',
  data() {
    return {
      newPost: '',
      newImage: null,
    }
  },
  methods: {
    handleImageUpload(event) {
      const file = event.target.files[0]
      if (file) {
        const reader = new FileReader()
        reader.onload = () => {
          this.newImage = reader.result
        }
        reader.readAsDataURL(file)
      }
    },
    publishPost() {
      if (this.newPost.trim() || this.newImage) {
        this.$emit('post-created', { text: this.newPost, image: this.newImage })
        this.newPost = ''
        this.newImage = null
      }
    },
  },
}
</script>

<style scoped>
.post-input {
  background: white;
  padding: 15px;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
}
textarea {
  width: 100%;
  border: none;
  outline: none;
  resize: none;
  padding: 10px;
  border-radius: 5px;
  background: #f0f2f5;
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
  padding: 8px;
  background-color: #1da1f2;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-weight: bold;
}
button:hover {
  background-color: #0d8bec;
}
</style>
