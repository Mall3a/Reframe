# **Reframe** – Garmin Mind Renewal App

**Reframe** es una app para relojes Garmin (Venu, Venu 2/2S, Forerunner y otros) diseñada para ayudarte a **renovar tu mente y reprogramar tus pensamientos** mediante recordatorios periódicos con vibración, colores y mensajes inspiradores.

A diferencia de apps simples, Reframe está pensada para **uso pasivo durante el día**, utilizando los **servicios de background de Garmin**, respetando sus limitaciones y batería.

No es un simple recordatorio: es una **herramienta de Ingeniería Mental**, que combina fe, neurociencia y psicología para crear cambios duraderos en tu mente y hábitos.

---

## 🎯 Características principales

- 🔔 Recordatorios con vibración y mensajes en pantalla
- ⏱️ Frecuencia configurable (minutos u horas)
- 📝 Mensajes personalizados: versos bíblicos, afirmaciones, frases motivacionales **(En progreso: se pueden agregar desde garming connect, pero se estan usando algunos hardcoded)**
- 🔀 Modo de entrega: aleatorio o secuencial **(En progreso: por ahora secuencial basado en índices)**
- 📱 Configuración desde Garmin Connect (teléfono)

---

## 🎯 Objetivo de la app

- Interrumpir el piloto automático del cerebro mediante vibración y mensajes
- Entrenar la atención y la memoria emocional de forma pasiva
- Aplicar **neuroplasticidad dirigida**: unir vibración (sentido), color (vista) y frase poderosa (pensamiento) para reforzar conexiones neuronales
- Renovación de la mente y hábitos positivos mediante interrupciones conscientes
- Ayudar a crear una mentalidad de paz, poder e identidad

---

## ⚡ Arquitectura técnica

### 1️⃣ App principal (ReframeApp)

- Se ejecuta tanto en primer plano como en background gracias a `(:background)`
- Al iniciar, lee la **frecuencia** y los **mensajes** desde `Settings` o `Storage`
- Calcula el **próximo evento temporal** usando `Time` y lo registra con `Background.registerForTemporalEvent`
- Muestra un mensaje inicial y una vibración diferenciada mientras el background prepara la siguiente notificación

### 2️⃣ Background Service (ReframeBackgroundServiceDelegate)

- Se activa cuando ocurre el evento temporal
- Comprueba si es **Quiet Time** (No Molestar o modo Sueño)
- Si no es QuietTime, solicita **wake up de la app** con un prompt
- Finaliza con `Background.exit()` para liberar recursos

---

## 🔀 Modo Secuencial, Colores y Vibración

### 1️⃣ Propósito del modo secuencial

El modo secuencial ayuda a que el subconsciente reciba los mensajes como un **proceso continuo y coherente**, reforzando las conexiones neuronales según la **Ley de Hebb**: _“Las neuronas que se activan juntas se conectan juntas”_.  
Esto permite crear una **narrativa de transformación** que guía al cerebro desde la identidad personal, pasando por la paz emocional, hasta la acción y consolidación.

### 2️⃣ Estructura de la narrativa (ejemplo con 37 mensajes)

1. **Identidad (Mensajes 1–8)** – refuerza quién eres en Dios
2. **Paz y confianza (Mensajes 9–16)** – calma la mente y genera confianza
3. **Empoderamiento y acción (Mensajes 17–28)** – motiva fe práctica y resiliencia
4. **Sabiduría y conexión con Dios (Mensajes 29–36)** – refuerza discernimiento y crecimiento espiritual
5. **Cierre y refuerzo final (Mensaje 37)** – consolida el ciclo y refuerza la reprogramación mental

---

### 3️⃣ Colores y anclaje emocional

Cada mensaje se acompaña de un **color específico**: azul, verde o púrpura. Esto tiene un **propósito neurocientífico y de PNL**:

- **Procesamiento visual previo:** el cerebro percibe el color antes de procesar las palabras, preparando el terreno emocional
- **Azul:** calma y concentración
- **Verde:** equilibrio y sensación de bienestar
- **Púrpura:** creatividad y conexión espiritual

Este **anclaje de color** ayuda a que el mensaje penetre más profundamente en el subconsciente, alineando emoción y contenido.

---

### 4️⃣ Vibración diferenciada

Cada mensaje se acompaña de **vibración**, con un patrón que aprovecha el **sistema de recompensa del cerebro**:

- **Mensajes intermedios:** vibración **suave**, para mantener atención sin sobreestimulación
- **Último mensaje del ciclo:** vibración **más larga y compleja**, generando un **refuerzo emocional positivo**, reforzando la sensación de logro y aprendizaje subconsciente

Combinando **vibración + color + frase**, el cerebro recibe un estímulo multisensorial que **facilita la consolidación de nuevas rutas neuronales**.

---

### 5️⃣ Fundamento científico y espiritual

- **Interrupción de Patrón:** rompe el piloto automático del cerebro para procesar nuevas verdades
- **Neuroplasticidad dirigida:** fortalece rutas neuronales de fe y seguridad
- <img width="400" height="600" alt="image" src="https://github.com/user-attachments/assets/34ab9d8f-3ca7-4085-985f-57661823d261" />
- **Frecuencia Ultradiana (60–90 min):** respeta ciclos de atención; evita habituación y refuerza memoria a largo plazo
- **Quiet Time / Sueño:** protege la consolidación de memoria y evita aumento de cortisol que bloquea aprendizaje
- <img width="400" height="600" alt="image" src="https://github.com/user-attachments/assets/e9105483-2b9e-4702-921f-14a1df129c7d" />
- **PNL y anclaje emocional:** vibración + color prepara emocionalmente para recibir el mensaje
- **Base bíblica:** Romanos 12:2 y 2 Corintios 10:5, renovación de la mente y cautivo todo pensamiento a la obediencia a Cristo

---

## ⚡ Buenas prácticas

- 🕒 Frecuencia mínima: 30 min
- 🔋 Más recordatorios → mayor consumo de batería
- 💡 Mensajes cortos y positivos generan reprogramación de pensamiento
- 🎨 Colores (azul, verde, púrpura) preparan emocionalmente al cerebro para recibir el mensaje

---

## 📌 Licencia

MIT License © 2026 Constanza Mallea

---

## 📷 Capturas de pantalla

Prompt

<p align="center">
  <img src="https://github.com/user-attachments/assets/f4f00098-b49b-4ffc-9436-0111bcc66f72" width="300"/>
  <img src="https://github.com/user-attachments/assets/f3a165da-c328-4283-96a2-137eef4208e4" width="300"/>
</p>
Frases
<p align="center">
  <img src="https://github.com/user-attachments/assets/f1573f1d-b441-4e07-8189-2daa43296871" width="300"/>
  <img src="https://github.com/user-attachments/assets/324e12e9-9f8c-4804-9035-f5381470c854" width="300"/>
</p>
GlanceView Widget
<p align="center">
  <img src="https://github.com/user-attachments/assets/d2ab9691-3303-46b3-aad2-3ec13ed9a2fa" width="300"/>
  <img src="https://github.com/user-attachments/assets/2b78b57c-adf2-44d2-8ade-5b7b5c791b86" width="300"/>
</p>
Pantalla Configuración
<p align="center">
  <img src="https://github.com/user-attachments/assets/7da6a454-b6bb-48bb-99a1-4916133c6edc" width="300"/>
</p>
Establecer Frecuencia
  <img src="https://github.com/user-attachments/assets/b51f3bcf-6453-4400-94a1-6835a8f6d0d7" width="300"/>
  <img src="https://github.com/user-attachments/assets/762ee5f1-5265-4119-886d-ef41f3b358f9" width="300"/>
  <img src="https://github.com/user-attachments/assets/fa94a904-a108-4f90-8376-85d387b948f7" width="300"/>
</p>
Cambiar Horas de Sueño
<p align="center">
  <img src="https://github.com/user-attachments/assets/0917ddbe-9a91-4b5c-99e3-8a0870cff932" width="300"/>
  <img src="https://github.com/user-attachments/assets/9dd26e00-1a27-4eed-aa46-be0e01ff7f9d" width="300"/>
  <img src="https://github.com/user-attachments/assets/0f89b492-9c0e-4315-b8f5-b7eb241cad93" width="300"/>
  <img src="https://github.com/user-attachments/assets/ea04f703-60e2-4184-81ef-c2ac29316bf4" width="300"/>
</p>
Ver Configuración actual
<p align="center">
  <img src="https://github.com/user-attachments/assets/b332fc70-4ef1-46c3-9307-7235b0e80f85" width="300"/>
  <img src="https://github.com/user-attachments/assets/0432e1c0-cf8b-4baf-8cf4-b7a75aa57a89" width="300"/>
  <img src="https://github.com/user-attachments/assets/f683c977-089b-4535-a13c-9f87f5326380" width="300"/>
</p>
Borrar mensajes
<p align="center">
  <img src="https://github.com/user-attachments/assets/c9324645-f0fc-4b0a-9f9a-ef25df0da68b" width="300"/>
  <img src="https://github.com/user-attachments/assets/9927c574-94b2-487c-8e1d-44098943ed91" width="300"/>
  <img src="https://github.com/user-attachments/assets/fca67065-cf3b-499f-aea4-6f5c93ae7c0f" width="300"/>
</p>
Reestablecer configuración
<p align="center">
  <img src="https://github.com/user-attachments/assets/68d38b5d-0934-4de5-8c69-e332bb45e049" width="300"/>
  <img src="https://github.com/user-attachments/assets/c2776886-e1b4-485b-b019-1bfd38ad4d28" width="300"/>
</p>
Interfaz Garmin Connect IQ
<p align="center">
  <img src="https://github.com/user-attachments/assets/68e9ab04-3ab4-4787-8867-ebd8e2e15c88" width="300"/>
  <img src="https://github.com/user-attachments/assets/489fcc68-93be-4057-b4d9-d2c342440f1c" width="300"/>
  <img src="https://github.com/user-attachments/assets/47ac685a-767d-4778-b363-f0b196069975" width="300"/>
  <img src="https://github.com/user-attachments/assets/92935651-9e16-43b4-9d7b-98a9402d626a" width="300"/>
  <img src="https://github.com/user-attachments/assets/3c92e9cc-7e2b-4229-9b4e-3e2edc4aba80" width="300"/>
</p>
