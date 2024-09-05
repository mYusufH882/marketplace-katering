import { createRouter, createWebHistory } from 'vue-router';
import Home from './merchant/Home.vue';
import HomeCust from './customer/HomeCust.vue';
import Menus from './merchant/Menu/Menus.vue';
import FormMenu from './merchant/Menu/FormMenu.vue';
import EditMenu from './merchant/Menu/EditMenu.vue';
import Order from './merchant/Order.vue';

const routes = [
    { 
      path: '/register', 
      name: 'Register',
      component: () => import('./auth/Register.vue') 
    },
    { 
      path: '/login',
      name: 'Login', 
      component: () => import('./auth/Login.vue') 
    },
    {
      path: '/', 
      component: () => import('./Layout.vue'), 
      meta: { requiresAuth: true }, 
      children: [
          {
              path: '/dashboard',
              name: 'MerchantDashboard',
              component: Home,
              meta: { requiresAuth: true, role: 'merchant' },
          },
          {
              path: '/cust-dashboard',
              name: 'CustomerDashboard',
              component: HomeCust,
              meta: { requiresAuth: true, role: 'customer' }
          },
          {
              path: '/menu',
              component: Menus,
              meta: { requiresAuth: true, role: 'merchant' },
          },
          {
              path: '/form-menu',
              component: FormMenu,
              meta: { requiresAuth: true, role: 'merchant' },
          },
          {
              path: '/edit-menu/:id',
              name: 'EditMenu',
              component: EditMenu,
              meta: { requiresAuth: true, role: 'merchant' },
              props: route => ({ id: Number(route.params.id) }),
          },
          {
              path: '/order',
              component: Order,
              meta: { requiresAuth: true, role: 'merchant' },
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