import {createRouter, createWebHistory} from "vue-router"
import Login from "../Vistas/Login.vue";
import Cesta from "../Vistas/Cesta.vue";
import Bodegas from "../Vistas/Bodegas.vue";
import MiCuenta from "../Vistas/MiCuenta.vue";
import Uvas from "../Vistas/Uvas.vue";
import Vinos from "../Vistas/Vinos.vue";
import Registrarse from "../Vistas/Registrarse.vue";

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: "/",
            name: "login",
            component: Login
        },
        {
            path: "/cesta",
            name: "cesta",
            component: Cesta
        },
        {
            path: "/bodegas",
            name: "bodegas",
            component: Bodegas
        },
        {
            path: "/miCuenta",
            name: "miCuenta",
            component: MiCuenta
        },
        {
            path: "/uvas",
            name: "uvas",
            component: Uvas
        },
        {
            path: "/vinos",
            name: "vinos",
            component: Vinos
        },
        {
            path: '/registrarse',
            name: 'Registrarse',
            component: Registrarse
        }
        
    ]
})

export default router;