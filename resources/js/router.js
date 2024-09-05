import { createRouter, createWebHistory } from 'vue-router';
import Menus from './merchant/Menu/Menus.vue';
import Home from './merchant/Home.vue';
import Order from './merchant/Order.vue';
import FormMenu from './merchant/Menu/FormMenu.vue';

const routes = [
  { path: '/register', component: () => import('./auth/Register.vue') },
  { path: '/login', component: () => import('./auth/Login.vue') },
  {
    path: '/', 
    component: () => import('./Layout.vue'), 
    meta: { requiresAuth: true }, 
    children: [
        {
            path: '/dashboard',
            component: Home,
            meta: { requiresAuth: true },
        },
        {
            path: '/menu',
            component: Menus,
            meta: { requiresAuth: true },
        },
        {
            path: '/form-menu',
            component: FormMenu,
            meta: { requiresAuth: true },
        },
        {
            path: '/order',
            component: Order,
            meta: { requiresAuth: true },
        },
    ]
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach(async (to, from, next) => {
    const requiresAuth = to.matched.some(record => record.meta.requiresAuth);
    const isAuthenticated = !!localStorage.getItem('authToken'); 
  
    if (requiresAuth && !isAuthenticated) {
      next('/login');
    } else {
      next();
    }
  });

export default router;