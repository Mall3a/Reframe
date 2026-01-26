
**Reframe** – Garmin Mind Renewal App

Reframe es una app para relojes Garmin (Venu, Venu 2/2S, Forerunner y otros) diseñada para ayudarte a renovar tu mente y reprogramar tus pensamientos mediante recordatorios periódicos con vibración y mensajes inspiradores.
A diferencia de apps simples, Reframe está pensada para uso pasivo durante el día, utilizando los servicios de background de Garmin, respetando sus limitaciones y batería.
No es un simple recordatorio: es una herramienta de Ingeniería Mental, que combina fe, neurociencia y psicología para crear cambios duraderos en tu mente y hábitos.

🎯 Características principales

🔔 Recordatorios con vibración y mensajes en pantalla
⏱️ Frecuencia configurable (minutos u horas)
📝 Mensajes personalizados: versos bíblicos, afirmaciones, frases motivacionales **(En progreso.. )**
🔀 Modo de entrega: aleatorio o secuencial **(En progreso.. por ahora secuencial basado en índices)**
📱 Configuración desde Garmin Connect (teléfono) **(En progreso.. por ahora está hardcoded)**

🎯 Objetivo de la app: 

Interrumpir el piloto automático del cerebro mediante vibración y mensajes
Entrenar la atención y la memoria emocional de forma pasiva
Aplicar neuroplasticidad dirigida: unir vibración (sentido), color (vista) y frase poderosa (pensamiento) para reforzar conexiones neuronales
Renovación de la mente y hábitos positivos mediante interrupciones conscientes
Ayudar a crear una mentalidad de paz, poder y identidad

⚡ Arquitectura técnica

1️⃣ App principal (ReframeApp)

Se ejecuta tanto en primer plano como en background gracias a (:background)
Al iniciar, lee la frecuencia y los mensajes desde Settings o Storage
Calcula el próximo evento temporal usando Time y lo registra con Background.registerForTemporalEvent
Muestra un mensaje inicial y una vibración diferenciada mientras el background prepara la siguiente notificación

2️⃣ Background Service (ReframeBackgroundServiceDelegate)

Se activa cuando ocurre el evento temporal
Comprueba si es Quiet Time (No Molestar o modo Sueño)
Si no es QuietTime, solicita wake up de la app con un prompt
Finaliza con Background.exit() para liberar recursos

3️⃣ Mensajes y vibración

Mensajes guardados en la app y persistentes con Storage

Modo aleatorio o secuencial (para crear narrativa de transformación)
Vibración diferenciada: suave para mensajes intermedios, más larga y compleja para el final del ciclo, (para beneficiar al sistema de recompensa del cerebro)

4️⃣ Colores

Cada mensaje se acompaña de un color: azul, verde o púrpura

Fundamento PNL: el cerebro procesa el color antes que las palabras, preparando el terreno emocional para que el mensaje penetre sin resistencia consciente

💡 Por qué funciona

Interrupción de Patrón: rompe el piloto automático del cerebro para procesar nuevas verdades
Modo Secuencial (37 frases): el cerebro busca orden; seguir un camino de identidad → paz → poder crea narrativa de transformación
Frecuencia Ultradiana (60–90 min): respeta ciclos de atención; evita habituación y refuerza memoria a largo plazo
Quiet Time / Sueño: protege la consolidación de memoria y evita aumento de cortisol que bloquea aprendizaje
Ley de Hebb aplicada: vibración + color + frase dispara neuronas en sincronía, formando nuevas conexiones duraderas

⚡ Buenas prácticas

🕒 Frecuencia mínima: 30 min
🔋 Más recordatorios → mayor consumo de batería
💡 Mensajes cortos y positivos generan reprogramación de pensamiento
🎨 Colores (azul, verde, púrpura) preparan emocionalmente al cerebro para recibir el mensaje

📌 Licencia

MIT License © 2026 [Constanza Mallea]

![IMG_20260126_172945](https://github.com/user-attachments/assets/f4f00098-b49b-4ffc-9436-0111bcc66f72)
![IMG_20260126_172443](https://github.com/user-attachments/assets/f9654b57-5dca-47ef-9368-73cc22bb73c0)
![IMG_20260126_172419](https://github.com/user-attachments/assets/f1573f1d-b441-4e07-8189-2daa43296871)

