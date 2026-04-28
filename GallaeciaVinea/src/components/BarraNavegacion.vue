<script setup>
</script>

<template>
    <nav class="navbar">
        <div class="nav-item bodegas">
            <router-link class="link" to="/bodegas"><img src="../assets/bodegas.png"></router-link>
        </div>
        <div class="nav-item vinos">
            <router-link class="link" to="/vinos"><img src="../assets/vinos.png"></router-link>
        </div>
        <div class="nav-item uvas">
            <router-link class="link" to="/uvas"><img src="../assets/uvas.png"></router-link>
        </div>
        <div class="nav-item cesta">
            <router-link class="link" to="/cesta"><img src="../assets/cesta.png"></router-link>
        </div>
        <div class="nav-item miCuenta">
            <router-link class="link" to="/miCuenta"><img src="../assets/miCuenta.png"></router-link>
        </div>
    </nav>
</template>

<style scoped>
/* Contenedor principal de la barra de navegación */
.navbar {
    display: flex;
    justify-content: space-around;
    align-items: center;
    position: fixed; /* Fixed es mejor para que siempre esté arriba aunque bajes */
    top: 0;
    left: 0;
    width: 100%; /* O 100vw */
    height: 80px; 
    background-color: rgba(163, 34, 34, 0.6); 
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    z-index: 1000; /* Aseguramos que esté por encima de todo */
    margin: 0;
    padding: 0;
}


.nav-item {
    display: flex;
    flex: 1; 
    height: 100%;
}


.link {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    text-decoration: none; 
    transition: background-color 0.3s ease;
}


.link :deep(img) {
    max-height: 50px;
    max-width: 100%;
    object-fit: contain;
    transition: transform 0.3s ease;
}




.nav-item:hover .link {
    background-color: rgba(255, 255, 255, 0.1); 
}


.nav-item:hover .link :deep(img) {
    transform: scale(1.1);
}

/* Si quieres darle un hover específico solo a bodegas, como tenías: */
.bodegas:hover .link,
.vinos:hover .link,
.uvas:hover .link,
.cesta:hover .link,
.miCuenta:hover .link {
    background-color: rgba(155, 5, 43, 0.5);
}

</style>