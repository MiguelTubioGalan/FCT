<script setup>
</script>

<template>
  <div class="login-container d-flex justify-content-center align-items-center">
    
    <div class="login-card">
      <h2 class="text-center mb-4 login-title">Iniciar Sesión</h2>
      
      <form>
        <div class="mb-3">
          <label for="Nombre" class="form-label text-light">Nombre y Apellidos</label>
          <input type="text" class="form-control custom-input" id="Nombre" placeholder="Miguel Tubio Galan">
        </div>

        <div class="mb-3">
          <label for="Usuario" class="form-label text-light">Usuario</label>
          <input type="text" class="form-control custom-input" id="Usuario" placeholder="Miguel123">
        </div>

        <div class="mb-3">
          <label for="exampleInputEmail1" class="form-label text-light">Email</label>
          <input type="email" class="form-control custom-input" id="exampleInputEmail1" placeholder="tu@email.com">
        </div>
        
        <div class="mb-3">
          <label for="exampleInputPassword1" class="form-label text-light">Contraseña</label>
          <input type="password" class="form-control custom-input" id="exampleInputPassword1" placeholder="••••••••">
        </div>
        
        <button type="submit" class="btn btn-login w-100 mt-2">Registrarse</button>
      </form>
    </div>

  </div>
</template>

<style scoped>
.login-container {
  /* Ocupa todo el alto disponible debajo de la navbar */
  min-height: calc(100vh - 120px); 
}

.login-card {
  /* Tu color clave: Blanco traslúcido */
  background-color: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(12px); /* Efecto cristal */
  -webkit-backdrop-filter: blur(12px);
  
  padding: 2.5rem;
  border-radius: 20px;
  border: 1px solid rgba(255, 255, 255, 0.1);
  width: 100%;
  max-width: 400px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
}

.login-title {
  color: #f3e5ab; /* Un tono crema/dorado para el título */
  font-weight: 300;
  letter-spacing: 2px;
  text-transform: uppercase;
}

/* Estilizamos los inputs para que no desentonen */
.custom-input {
  background-color: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.2);
  color: white;
}

.custom-input:focus {
  background-color: rgba(255, 255, 255, 0.1);
  border-color: #f3e5ab;
  color: white;
  box-shadow: none;
}

/* Botón personalizado */
.btn-login {
  background-color: #5a3b3b; /* Color similar a tu navbar para coherencia */
  color: white;
  border: 1px solid rgba(255, 255, 255, 0.2);
  transition: all 0.3s ease;
}

.btn-login:hover {
  background-color: rgba(155, 5, 43, 0.8); /* El color del hover que definimos */
  transform: translateY(-2px);
}
</style>