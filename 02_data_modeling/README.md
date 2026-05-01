# 🏗️ Modelado de Datos

## 📌 Descripción
En esta fase se diseñó un modelo de datos optimizado para análisis utilizando un esquema estrella (Star Schema).

---

## ⭐ Esquema Implementado

El modelo está compuesto por:

- **fact_sales**: tabla de hechos con las transacciones
- **dim_customer**: información de clientes
- **dim_product**: información de productos
- **dim_date**: dimensión de fechas

---

## ⚙️ Diseño del Modelo

### 🔹 Tabla de hechos (fact_sales)
Contiene:
- Ventas (sales)
- ID de cliente
- ID de producto
- Fecha de orden

---

### 🔹 Tablas de dimensiones
Permiten el análisis desde diferentes perspectivas:

- Clientes
- Productos
- Tiempo

---

## 🔑 Integridad de Datos

Se aplicaron:

- Primary Keys
- Foreign Keys
- Relaciones entre tablas

---

## 🧠 Objetivo
Optimizar el rendimiento de consultas analíticas y facilitar la visualización en Power BI.

---

## 🛠️ Herramientas
- SQL Server
- T-SQL
