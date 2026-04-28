<script setup>
import { useSSRContext } from 'vue';
import { useUserStore } from '../stores/user';

    const userStore = useUserStore();
</script>

<template>
    <div class="contenido">
        <h1>{{ userStore.Usuario.username }}</h1>
    </div>
</template>

<style scoped>
    .contenido{
        color: whitesmoke;
    }
</style>