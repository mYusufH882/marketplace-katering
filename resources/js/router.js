import { createRouter, createWebHistory } from 'vue-router';
import Home from './merchant/Home.vue';
import HomeCust from './customer/HomeCust.vue';
import Menus from './merchant/Menu/Menus.vue';
import FormMenu from './merchant/Menu/FormMenu.vue';
import EditMenu from './merchant/Menu/EditMenu.vue';
import InvoiceList from './customer/InvoiceList.vue';
import Katalog from './customer/katalogs/Katalog.vue';
import KatalogDetail from './customer/katalogs/KatalogDetail.vue';

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
            path: '/cust-dashboard',
            name: 'CustomerDashboard',
            component: HomeCust,
            meta: { requiresAuth: true, role: 'customer' }
          },
          {
            path: '/katalog-list',
            name: 'KatalogList',
            component: Katalog,
            meta: { requiresAuth: true, role: 'customer' }
          },
          {
            path: '/katalog/:id',
            name: 'KatalogDetail',
            component: KatalogDetail,
            meta: { requiresAuth: true, role: 'customer' }
          },
          {
            path: '/invoice-list',
            name: 'InvoiceList',
            component: InvoiceList,
            meta: { requiresAuth: true }
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
    const userRole = localStorage.getItem('userRole');

    if (requiresAuth && !isAuthenticated) {
      next('/login');
    } else if (requiresAuth && isAuthenticated) {
      if (to.meta.role && to.meta.role !== userRole) {
        if (userRole === 'merchant') {
          next('/dashboard');
        } else if (userRole === 'customer') {
          next('/cust-dashboard');
        }
      } else {
        next();
      }
    } else {
      next();
    }

    // if (requiresAuth && !isAuthenticated) {
    //   next('/login');
    // } else {
    //   next();
    // }
});

export default router;