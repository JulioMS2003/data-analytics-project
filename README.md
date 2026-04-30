# 📊 End-to-End Data Analytics Project

Este proyecto simula un flujo completo de análisis de datos en un entorno empresarial, desde datos crudos hasta insights de negocio.

---

## 🧠 Objetivo

Diseñar un sistema de análisis de ventas que permita:

* Procesar datos crudos
* Limpiar y validar información
* Modelar datos para análisis
* Generar métricas clave
* Obtener insights de negocio

---

## 🏗️ Arquitectura del Proyecto

El flujo de datos sigue el siguiente proceso:

Raw Data → Data Cleaning → Data Modeling → Data Analysis → Dashboard (próximamente)

---

## 📁 Estructura del Proyecto

```id="1uxjkg"
data-analytics-project/
├── 01_data_cleaning/
├── 02_data_modeling/
├── 03_data_analysis/
```

---

## ⚙️ Tecnologías Utilizadas

* SQL Server
* SQL Server Management Studio (SSMS)
* Excel / Power BI (para visualización - próximamente)
* GitHub

---

## 🔹 1. Data Cleaning

Se procesan datos crudos para mejorar su calidad:

* Eliminación de duplicados
* Conversión de fechas
* Limpieza de texto
* Manejo de valores nulos

**Output:**

* clean_orders

---

## 🔹 2. Data Modeling

Se implementa un modelo estrella (Star Schema):

* fact_sales → métricas de ventas
* dim_customer → información de clientes
* dim_product → información de productos
* dim_date → dimensión temporal

Se aplican:

* Primary Keys
* Foreign Keys
* Normalización de datos

---

## 🔹 3. Data Analysis

Se realizan análisis orientados a negocio:

* KPIs principales (Revenue, Orders, Ticket promedio)
* Análisis temporal (tendencias y crecimiento mensual)
* Segmentación de clientes
* Productos más vendidos
* Análisis geográfico

---

## 🔍 Insights Clave

* Existe variabilidad en el crecimiento mensual de ingresos
* Un grupo reducido de clientes concentra gran parte del revenue
* Algunas categorías dominan las ventas totales
* Se identifican regiones con menor desempeño

---

## 📊 Dashboard

Próxima fase del proyecto:

* Construcción de dashboard en Excel o Power BI
* Visualización de KPIs
* Análisis interactivo

---

## 🎯 Resultado

Este proyecto demuestra:

* Construcción de pipelines de datos
* Modelado de datos tipo empresarial
* Uso de SQL para análisis de negocio
* Generación de insights accionables

---

## 🚀 Autor

Julio Manchay
