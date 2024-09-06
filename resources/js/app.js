import { createApp } from 'vue';
import App from './App.vue';

import '../css/app.css';
import router from './router';
import axios from 'axios';

const app = createApp(App);

window.axios = axios

app.use(router);
app.mount('#app');