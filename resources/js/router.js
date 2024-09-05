import { createRouter, createWebHistory } from 'vue-router';

const routes = [
  { path: '/register', component: () => import('./auth/Register.vue') },
  { path: '/login', component: () => import('./auth/Login.vue') },
  { path: '/dashboard', component: () => import('./Dashboard.vue') }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;