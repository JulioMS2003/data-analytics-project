# Dashboard de Ventas

## Descripción
Este dashboard muestra una visión general del desempeño de ventas, comportamiento de clientes y rendimiento de productos.

Fue desarrollado en Power BI utilizando un modelo de datos en esquema estrella construido previamente en SQL Server.

---

## Vista del Dashboard
![Dashboard](dashboard.png)

---

## Métricas Principales
- **Ingresos Totales (Total Revenue)**: Total de ventas generadas
- **Total de Órdenes (Total Orders)**: Número de pedidos únicos
- **Valor Promedio por Orden (AOV)**: Ingreso promedio por pedido

---

## Visualizaciones

### 1. Tendencia de Ingresos
- Muestra la evolución de los ingresos a lo largo del tiempo
- Permite identificar patrones de crecimiento

---

### 2. Top Clientes
- Identifica los clientes con mayor contribución en ingresos
- Útil para detectar clientes clave del negocio

---

### 3. Top Productos
- Muestra los productos con mayor nivel de ventas
- Permite identificar productos más rentables

---

### 4. Ingresos por Estado
- Presenta la distribución geográfica de los ingresos
- Permite identificar regiones con mayor desempeño

---

## Modelo de Datos
El dashboard está basado en un esquema estrella compuesto por:

- **fact_sales**
- **dim_customer**
- **dim_product**
- **dim_date**

---

## Herramientas Utilizadas
- Power BI (visualización)
- SQL Server (procesamiento y modelado de datos)

---

## Insights Principales
- Los ingresos muestran una tendencia creciente a partir de 2016
- Un grupo reducido de clientes concentra gran parte de los ingresos
- Algunos productos dominan el volumen de ventas
- Las ventas están concentradas en ciertos estados

---

## Archivo
- `sales_dashboard.pbix`: archivo del dashboard en Power BI
