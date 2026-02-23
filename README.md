# 🧠 Reframe – Garmin Mind Renewal App

**Reframe** es una app para relojes Garmin (Venu, Venu 2/2S, Forerunner y otros) diseñada para ayudarte a **renovar tu mente y reprogramar tus pensamientos** mediante recordatorios periódicos con vibración, colores y mensajes intencionales.

A diferencia de apps simples, Reframe está pensada para **uso pasivo durante el día**, utilizando los **servicios de background de Garmin**, respetando sus limitaciones y batería.

No es un simple recordatorio: es una **herramienta de Ingeniería Mental aplicada**, que combina fe, neurociencia y psicología para crear cambios duraderos en tu mente y hábitos.

---

## 💡 Recomendación de uso

- Escribir afirmaciones en primera persona  
- Repetir la afirmación en voz alta  
- Mantener constancia diaria durante al menos 30 días  

---

# 🎯 Objetivo de la App

- Interrumpir el piloto automático del cerebro mediante vibración y mensajes
- Entrenar la atención y la memoria emocional de forma pasiva
- Aplicar **neuroplasticidad dirigida**
- Renovar la mente mediante repetición consciente
- Fortalecer identidad, paz y coherencia interna

---

# 🧠 Presencia Consciente y Micro-Anclaje Corporal

La vibración funciona como un **micro anclaje corporal**.

Cada estímulo táctil:

- Interrumpe la inercia mental
- Trae al usuario al momento presente
- Activa conciencia somática
- Refuerza la consolidación del mensaje

La combinación de:

**Vibración + Color + Frase**

genera un estímulo multisensorial que fortalece nuevas rutas neuronales asociadas a seguridad e identidad.

---

# 🧩 Coherencia Interna e Identidad Central

Reframe no es terapia clínica ni trabajo profundo de trauma.

Sin embargo, fortalece la **identidad central** del usuario mediante repetición intencional:

- Refuerza la narrativa interna dominante
- Reduce fragmentación mental
- Disminuye reactividad automática
- Entrena respuestas más conscientes

---

# 🔀 Sistema Secuencial

1. **Identidad**
2. **Paz y confianza**
3. **Empoderamiento y acción**
4. **Sabiduría y conexión espiritual**
5. **Cierre y refuerzo**

Basado en la Ley de Hebb:
> “Las neuronas que se activan juntas, se conectan juntas.”

---

# 🎨 Colores

- 🔵 Azul → calma  
- 🟢 Verde → equilibrio  
- 🟣 Púrpura → conexión espiritual  

---

# 📳 Vibración

- Mensajes intermedios → vibración suave  
- Último mensaje → vibración reforzada  

---

# 🔬 Fundamento Científico

- Interrupción de patrón  
- Neuroplasticidad dirigida  
- Frecuencia ultradiana (60–90 min)  
- Protección del sueño  
- Anclaje multisensorial  

---

# 📖 Fundamento Bíblico de la Repetición

## 📜 Deuteronomio 6:6-7

> “Y estas palabras que yo te mando hoy, estarán sobre tu corazón;  
> y las repetirás a tus hijos, y hablarás de ellas estando en tu casa,  
> y andando por el camino, y al acostarte, y cuando te levantes.”

## 📜 Josué 1:8

> “Nunca se apartará de tu boca este libro de la ley,  
> sino que de día y de noche meditarás en él,  
> para que guardes y hagas conforme a todo lo que en él está escrito;  
> porque entonces harás prosperar tu camino, y todo te saldrá bien.”

## 📜 Romanos 10:17

> “Así que la fe es por el oír, y el oír, por la palabra de Dios.”

## 📜 Filipenses 4:8

> “Por lo demás, hermanos, todo lo verdadero, todo lo honesto,  
> todo lo justo, todo lo puro, todo lo amable, todo lo que es de buen nombre;  
> si hay virtud alguna, si algo digno de alabanza, en esto pensad.”

---

# ⚙️ Arquitectura Técnica

## ReframeApp

- Foreground + `(:background)`
- Registro de eventos temporales
- Gestión de Settings y Storage
- Cálculo dinámico de siguiente evento

## Background Service

- Activación por evento temporal
- Validación de Quiet Time
- Wake-up controlado
- `Background.exit()` para liberar recursos

---

# 📷 Capturas de pantalla

## Prompt

<p align="center">
  <img src="https://github.com/user-attachments/assets/f4f00098-b49b-4ffc-9436-0111bcc66f72" width="200"/>
  <img src="https://github.com/user-attachments/assets/f3a165da-c328-4283-96a2-137eef4208e4" width="200"/>
</p>

## Frases

<p align="center">
  <img src="https://github.com/user-attachments/assets/f1573f1d-b441-4e07-8189-2daa43296871" width="200"/>
  <img src="https://github.com/user-attachments/assets/324e12e9-9f8c-4804-9035-f5381470c854" width="200"/>
</p>

## GlanceView Widget

<p align="center">
  <img src="https://github.com/user-attachments/assets/d2ab9691-3303-46b3-aad2-3ec13ed9a2fa" width="200"/>
  <img src="https://github.com/user-attachments/assets/2b78b57c-adf2-44d2-8ade-5b7b5c791b86" width="200"/>
</p>

## Pantalla Configuración

<p align="center">
  <img src="https://github.com/user-attachments/assets/7da6a454-b6bb-48bb-99a1-4916133c6edc" width="200"/>
</p>

## Establecer Frecuencia

<p align="center">
  <img src="https://github.com/user-attachments/assets/b51f3bcf-6453-4400-94a1-6835a8f6d0d7" width="200"/>
  <img src="https://github.com/user-attachments/assets/762ee5f1-5265-4119-886d-ef41f3b358f9" width="200"/>
  <img src="https://github.com/user-attachments/assets/fa94a904-a108-4f90-8376-85d387b948f7" width="200"/>
</p>

## Cambiar Horas de Sueño

<p align="center">
  <img src="https://github.com/user-attachments/assets/0917ddbe-9a91-4b5c-99e3-8a0870cff932" width="200"/>
  <img src="https://github.com/user-attachments/assets/9dd26e00-1a27-4eed-aa46-be0e01ff7f9d" width="200"/>
  <img src="https://github.com/user-attachments/assets/0f89b492-9c0e-4315-b8f5-b7eb241cad93" width="200"/>
  <img src="https://github.com/user-attachments/assets/ea04f703-60e2-4184-81ef-c2ac29316bf4" width="200"/>
</p>

---

# 📌 Licencia

© 2026 Constanza Mallea  
Todos los derechos reservados.
