studylink/
├── public/
│   └── index.html
├── src/
│   ├── assets/
│   │   └── (images, fonts, etc.)
│   ├── components/
│   │   ├── common/
│   │   │   └── (components réutilisables comme Button, Navbar, etc.)
│   │   ├── messages/
│   │   │   └── (components liés à la messagerie)
│   │   └── posts/
│   │       └── (components liés aux posts)
│   ├── views/
│   │   ├── HomeView.vue
│   │   ├── MessagesView.vue
│   │   ├── ProfileView.vue
│   │   └── PostsView.vue
│   ├── router/
│   │   └── index.js
│   ├── services/
│   │   ├── api.js
│   │   ├── authService.js
│   │   ├── messageService.js
│   │   └── postService.js
│   ├── store/
│   │   └── (futur store Vuex si nécessaire)
│   ├── utils/
│   │   └── (helpers, constants, etc.)
│   ├── App.vue
│   └── main.js
├── .env
├── .prettierrc
├── package.json
└── README.md