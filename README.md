# AUY1105 - Infraestructura Como Código II

<p align="left" style="text-align:left;">
  <a href="https://www.duoc.cl/">
    <img alt="Github Universe" src="img/logo.png" width="1040"/>
  </a>
</p>

## Descripción General

Este repositorio reúne material práctico para la asignatura AUY1105 - Infraestructura Como Código II. El contenido está organizado por evaluaciones y actividades, con ejercicios enfocados en aprovisionamiento de infraestructura en AWS usando Terraform, modularización, versionamiento de cambios, documentación técnica y revisión de código mediante GitHub.

El proyecto combina actividades introductorias y progresivas. En las primeras experiencias se trabajan recursos base como VPC, subredes, EC2, tablas de rutas, NAT Gateway y claves SSH. En actividades posteriores se incorporan módulos reutilizables, variables, salidas, entornos con archivos tfvars, validaciones, documentación generada y cambios orientados a seguridad y mantenibilidad.

## Estructura del Repositorio

- EA1: actividades iniciales centradas en recursos Terraform definidos directamente sobre archivos como vpc.tf, ec2.tf y provider.tf.
- EA2: actividades basadas en módulos reutilizables, separación de responsabilidades, variables de entrada, outputs y escenarios más cercanos a una estructura de proyecto real.
- EA3: espacio destinado a actividades posteriores del curso; actualmente incluye material inicial y carpetas reservadas para futuras implementaciones.
- docs: documentación complementaria del repositorio, incluyendo guía de contribución y código de conducta.
- img: recursos visuales utilizados por la documentación.

## Contenidos Relevantes

Dentro del repositorio se pueden encontrar ejemplos y ejercicios relacionados con:

- Creación y configuración de VPC, subredes públicas y privadas, Internet Gateway, NAT Gateway y rutas.
- Aprovisionamiento de instancias EC2 con llaves SSH, security groups y configuraciones de red.
- Uso de módulos Terraform para separar la capa de red y la capa de cómputo.
- Definición de variables, outputs y archivos tfvars para distintos entornos.
- Ajustes de seguridad, como restricción de tráfico SSH, endurecimiento de instancias y uso de grupos por defecto cuando corresponde.
- Integración de documentación y validaciones asociadas al ciclo de trabajo con Terraform.

## Requisitos Sugeridos

Para trabajar con este material se recomienda contar con:

- Terraform instalado localmente.
- Una cuenta o laboratorio de AWS con credenciales temporales o de práctica.
- AWS CLI configurado, o variables de entorno exportadas para autenticación.
- Conocimientos básicos de Git y GitHub para clonar, versionar cambios y enviar pull requests.
- Herramientas opcionales como terraform-docs y OPA/Conftest si se desea ejecutar ejercicios asociados a documentación o políticas.

## Forma de Trabajo Recomendada

1. Clona el repositorio y ubícate en la actividad que corresponda.
2. Revisa el README específico de la actividad cuando exista.
3. Inicializa Terraform con terraform init.
4. Revisa los cambios planificados con terraform plan.
5. Aplica la infraestructura solo en un entorno de laboratorio o práctica con terraform apply.
6. Documenta o propone mejoras mediante ramas y pull requests.

## Organización por Actividades

La progresión del curso muestra una evolución clara:

- EA1 introduce fundamentos de infraestructura como código sobre AWS.
- EA2 profundiza en reutilización mediante módulos y parametrización.
- EA3 deja preparada la base para actividades más avanzadas y ampliaciones futuras.

Esta organización facilita revisar cambios por nivel de complejidad y comparar distintas soluciones o versiones de una misma idea de infraestructura.

## CONTRIBUCIONES

Las contribuciones son bienvenidas, especialmente para mejorar documentación, claridad de instrucciones, estructura de módulos y buenas prácticas de infraestructura como código. Antes de contribuir, revisa la [Guía de Contribuciones](./docs/contributors.md).

## CÓDIGO DE CONDUCTA

Por favor, contribuye con respeto y criterio técnico. Revisa el [Código de Conducta](./docs/CODE_OF_CONDUCT.md).
