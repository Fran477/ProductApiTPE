import tkinter as tk

# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Mi primera app con Tkinter")
ventana.geometry("300x200")  # Dimensiones de la ventana

# Etiqueta (label) en la ventana
etiqueta = tk.Label(ventana, text="¡Hola, Francisco! 😄", font=("Arial", 14))
etiqueta.pack(pady=20)  # Añadir un margen vertical

# Función para el botón
def boton_click():
    etiqueta.config(text="¡Haz clickeado el botón!")

# Botón en la ventana
boton = tk.Button(ventana, text="Haz clic aquí", command=boton_click)
boton.pack(pady=10)

# Ejecutar el bucle principal de la aplicación
ventana.mainloop()
