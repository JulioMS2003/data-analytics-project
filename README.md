# 📊 End-to-End Data Analytics Project

Este proyecto simula un flujo completo de análisis de datos como en un entorno empresarial, desde datos crudos hasta insights de negocio.

## 🧠 Objetivo

Construir un sistema de análisis de ventas que permita:

* Limpiar datos inconsistentes
* Modelar datos para análisis
* Generar métricas clave
* Obtener insights de negocio

---

## 🏗️ Arquitectura del Proyecto

El flujo de datos sigue este proceso:

Raw Data → Data Cleaning → Data Modeling → Data Analysis → Dashboard

---

## 📁 Estructura del Proyecto

```
data-analytics-project/
├── 01_data_cleaning/
├── 02_data_modeling/
├── 03_data_analysis/
```

---

## ⚙️ Tecnologías Utilizadas

* SQL (MySQL)
* Excel
* GitHub

---

## 🔹 1. Data Cleaning

Se procesan datos crudos para:

* Eliminar duplicados
* Manejar valores nulos
* Corregir formatos
* Validar consistencia

Output:

* clean_orders
* clean_customers

---

## 🔹 2. Data Modeling

Se implementa un modelo tipo **Star Schema**:

* Tabla de hechos: fact_sales
* Tablas de dimensión: customers, products, date

Se construyen métricas como:

* Revenue
* Profit
* Growth %

---

## 🔹 3. Data Analysis

Se analizan los datos para responder preguntas de negocio:

* ¿Qué clientes generan más ingresos?
* ¿Qué productos tienen mejor rendimiento?
* ¿Cómo evoluciona el negocio mes a mes?

---

## 📊 Dashboard

Se construye un dashboard en Excel con:

* KPIs principales
* Análisis temporal
* Segmentación de clientes

---

## 🔍 Insights Clave

* El 20% de clientes genera la mayor parte de ingresos
* Se identifican meses con crecimiento negativo
* Algunos productos tienen baja rotación

---

## 🎯 Resultado

Este proyecto demuestra:

* Construcción de pipelines de datos
* Modelado de datos para análisis
* Generación de métricas de negocio
* Capacidad de obtener insights accionables

---

## 🚀 Autor

Julio Manchay
