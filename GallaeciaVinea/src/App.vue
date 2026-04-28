<script setup>
import BarraNavegacion from './components/BarraNavegacion.vue';
</script>

<template>
  <BarraNavegacion />
  
  <main class="main-content">
    <RouterView />
  </main>
</template>

<style>
/* Estilos globales */
html, body {
  margin: 0;
  padding: 0;
}

.main-content {
  /* IMPORTANTE: Este padding debe ser igual o mayor 
     a la altura de tu navbar (que es 80px) */
  padding-top: 100px; 
  
  min-height: 100vh;
  width: 100%;
  /* Aquí va tu fondo que elegimos antes */
  background: radial-gradient(circle at 50% 50%, #242d38 0%, #0f1216 100%);
}
</style>