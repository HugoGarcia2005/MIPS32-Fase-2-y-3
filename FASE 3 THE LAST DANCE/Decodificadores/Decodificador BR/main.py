import tkinter as tk
from tkinter import messagebox, ttk
import os

class RegisterBankDecoder:
    def __init__(self, root):
        self.root = root
        self.root.title("Decodificador Banco de Registros MIPS")
        self.root.geometry("650x600")
        self.root.configure(bg="#121212")
        
        # Configuración de estilo
        self.setup_styles()
        
        # Frame principal
        self.main_frame = ttk.Frame(root)
        self.main_frame.pack(pady=20, padx=20, fill=tk.BOTH, expand=True)
        
        # Título
        ttk.Label(
            self.main_frame, 
            text="Banco de Registros MIPS", 
            font=("Consolas", 14, "bold")
        ).pack(pady=10)
        
        # Contenedor para tabla y scrollbar
        self.table_container = ttk.Frame(self.main_frame)
        self.table_container.pack(fill=tk.BOTH, expand=True)
        
        # Canvas para scrollbar
        self.canvas = tk.Canvas(
            self.table_container,
            bg="#121212",
            highlightthickness=0
        )
        self.canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        
        # Scrollbar vertical
        self.scrollbar = ttk.Scrollbar(
            self.table_container,
            orient=tk.VERTICAL,
            command=self.canvas.yview
        )
        self.scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        
        # Configurar canvas con scrollbar
        self.canvas.configure(yscrollcommand=self.scrollbar.set)
        self.canvas.bind('<Configure>', lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")))
        
        # Frame interior para la tabla
        self.inner_frame = ttk.Frame(self.canvas)
        self.canvas.create_window((0, 0), window=self.inner_frame, anchor="nw")
        
        # Tabla de registros
        self.create_register_table()
        
        # Botones (fuera del área de scroll)
        self.create_buttons()
        
        # Configurar scroll con rueda del ratón
        self.inner_frame.bind("<Enter>", self._bind_to_mousewheel)
        self.inner_frame.bind("<Leave>", self._unbind_from_mousewheel)
    
    def _bind_to_mousewheel(self, event):
        self.canvas.bind_all("<MouseWheel>", self._on_mousewheel)
    
    def _unbind_from_mousewheel(self, event):
        self.canvas.unbind_all("<MouseWheel>")
    
    def _on_mousewheel(self, event):
        self.canvas.yview_scroll(int(-1*(event.delta/120)), "units")
    
    def setup_styles(self):
        """Configura los estilos visuales"""
        self.style = ttk.Style()
        self.style.theme_use('clam')
        self.style.configure('.', background="#121212", foreground="white")
        self.style.configure('TFrame', background="#121212")
        self.style.configure('TLabel', background="#121212", foreground="white")
        self.style.configure('TButton', background="#333333", foreground="white")
        self.style.map('TButton', background=[('active', '#444444')])
        self.style.configure('Vertical.TScrollbar', background="#333333")
    
    def create_register_table(self):
        """Crea la tabla de registros con entradas"""
        # Cabeceras
        headers = ["Registro", "Valor Decimal", "Binario (16 bits)"]
        for col, text in enumerate(headers):
            ttk.Label(
                self.inner_frame, 
                text=text, 
                font=("Consolas", 10, "bold"),
                borderwidth=1, 
                relief="solid",
                padding=5
            ).grid(row=0, column=col, sticky="nsew", padx=1, pady=1)
        
        # Crear entradas para los 32 registros
        self.entries = []
        for i in range(32):
            # Etiqueta del registro ($0, $1, etc.)
            reg_label = ttk.Label(
                self.inner_frame, 
                text=f"${i}", 
                font=("Consolas", 10),
                borderwidth=1, 
                relief="solid",
                padding=5
            )
            reg_label.grid(row=i+1, column=0, sticky="nsew", padx=1, pady=1)
            
            # Entrada para el valor decimal
            entry = tk.Entry(
                self.inner_frame,
                bg="#252525",
                fg="white",
                insertbackground="white",
                relief=tk.FLAT,
                font=("Consolas", 10),
                justify="center"
            )
            entry.grid(row=i+1, column=1, sticky="nsew", padx=1, pady=1)
            
            # Etiqueta para mostrar el binario
            bin_label = ttk.Label(
                self.inner_frame, 
                text="0"*16, 
                font=("Consolas", 10),
                borderwidth=1, 
                relief="solid",
                padding=5
            )
            bin_label.grid(row=i+1, column=2, sticky="nsew", padx=1, pady=1)
            
            # Configurar evento para actualización en tiempo real
            entry.bind("<KeyRelease>", lambda e, idx=i: self.update_binary_preview(idx))
            
            self.entries.append((entry, bin_label))
        
        # Configurar peso de las columnas
        for i in range(3):
            self.inner_frame.grid_columnconfigure(i, weight=1)
    
    def create_buttons(self):
        """Crea los botones de control"""
        button_frame = ttk.Frame(self.main_frame)
        button_frame.pack(pady=20)
        
        ttk.Button(
            button_frame,
            text="Limpiar Todo",
            command=self.clear_all,
            width=15
        ).pack(side=tk.LEFT, padx=10)
        
        ttk.Button(
            button_frame,
            text="Guardar Datos",
            command=self.save_data,
            width=15
        ).pack(side=tk.LEFT, padx=10)
    
    def decimal_to_16bit_bin(self, value):
        """Convierte un valor decimal a binario de 16 bits"""
        try:
            num = int(value)
            # Manejar negativos (complemento a 2)
            if num < 0:
                return format(num & 0xFFFF, '016b')
            return f"{num:016b}"
        except ValueError:
            return "0000000000000000"
    
    def update_binary_preview(self, reg_index):
        """Actualiza la vista previa del valor binario"""
        entry, bin_label = self.entries[reg_index]
        value = entry.get().strip()
        binary = self.decimal_to_16bit_bin(value) if value else "0"*16
        bin_label.config(text=binary)
    
    def clear_all(self):
        """Limpia todas las entradas"""
        for entry, bin_label in self.entries:
            entry.delete(0, tk.END)
            bin_label.config(text="0"*16)
        # Volver al inicio del scroll
        self.canvas.yview_moveto(0)
    
    def save_data(self):
        """Guarda los datos en el archivo DatosBR.txt"""
        try:
            output_lines = []
            
            # Validar y convertir cada registro
            for i, (entry, _) in enumerate(self.entries):
                value = entry.get().strip()
                
                if value:
                    try:
                        num = int(value)
                        if not (-32768 <= num <= 32767):
                            raise ValueError(f"Valor en ${i} fuera de rango (-32768 a 32767)")
                    except ValueError:
                        raise ValueError(f"Valor inválido en ${i}: '{value}'")
                else:
                    num = 0
                
                binary = self.decimal_to_16bit_bin(num)
                output_lines.append(binary)
            
            # Guardar en el escritorio
            desktop = os.path.join(os.path.expanduser("~"), "Desktop")
            output_path = os.path.join(desktop, "DatosBR.txt")
            
            with open(output_path, 'w') as f:
                f.write("\n".join(output_lines))
            
            messagebox.showinfo(
                "Éxito", 
                f"Archivo guardado correctamente en:\n{output_path}\n\n"
                f"Formato: 32 líneas de 16 bits cada una\n"
                f"Orden: $0 a $31"
            )
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo guardar el archivo:\n{e}")

if __name__ == "__main__":
    root = tk.Tk()
    app = RegisterBankDecoder(root)
    root.mainloop()