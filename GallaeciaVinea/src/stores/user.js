import { defineStore } from "pinia";
import { reactive } from 'vue';

export const useUserStore = defineStore("usuario", () => {
    const Usuario = reactive({
        username: "",
        password: ""
    });

    const addUsuario = Usuario.push

    return {Usuario};
});