<%-- 
    Document   : procesarFigura
    Created on : 22 jun. 2024, 3:09:38 p. m.
    Author     : ricardo vidal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>Resultado de la Figura</title>
    </head>
  <body>
<div class="container">
    <div class="containerForm">
    <h1>Resultado de la Figura</h1>
            <%-- Mostrar datos específicos según la figura --%>

    <%
// Obtener los valores introducidos desde el formulario
double lado1 = Double.parseDouble(request.getParameter("lado1"));
double lado2 = Double.parseDouble(request.getParameter("lado2"));
double lado3 = Double.parseDouble(request.getParameter("lado3"));
double lado4 = Double.parseDouble(request.getParameter("lado4"));

// Contador para llevar el registro de cuántos lados tienen valor diferente de 0
int ladosConValor = 0;

// Verificar cada lado
if (lado1 != 0) {
    ladosConValor++;
}
if (lado2 != 0) {
    ladosConValor++;
}
if (lado3 != 0) {
    ladosConValor++;
}
if (lado4 != 0) {
    ladosConValor++;
}

// Determinar la figura geométrica
String figura = "";
double area = 0;
double perimetro = 0;
double diametro = 0;
double radio = 0;
double circunferencia = 0;
double areaEquilatero = 0;
 
// Determinar si solo hay un valo diferente a 0 es un ciruclo

if (ladosConValor == 1) {
    // Círculo
    figura = "Círculo";
    radio = (lado1 != 0) ? lado1 : (lado2 != 0) ? lado2 : (lado3 != 0) ? lado3 : lado4;
    diametro = 2 * radio;
    area = Math.PI * Math.pow(radio, 2);
    circunferencia = 2 * Math.PI * radio;

}

// Determinar si solo hay 3 valores diferente es un triangul0

if (ladosConValor == 3) {
        // Validamos cada uno de las combinaciones de lados
    if (
    (lado1 == lado2 && lado2 == lado3 && lado4 == 0) ||
    (lado2 == lado3 && lado3 == lado4 && lado1 == 0) ||
    (lado3 == lado4 && lado4 == lado1 && lado2 == 0) ||
    (lado4 == lado1 && lado1 == lado2 && lado3 == 0)) {
        // Es un triángulo equilátero
        // Fórmula de Herón estandar para poder contar cualquier tipo de combinacion de lados

        double s = (lado1 + lado2 + lado3 + lado4) / 2;
        area = Math.sqrt(s * (s - (lado1 == 0 ? 0 : lado1)) * (s - (lado2 == 0 ? 0 : lado2)) * (s - (lado3 == 0 ? 0 : lado3)) * (s - (lado4 == 0 ? 0 : lado4)));
        perimetro = lado1 + lado2 + lado3 + lado4;
        // Validamos con el nombre de la figura para compilar de forma dinamica cada figura
        figura = "Triángulo equilátero";
    } else if( 
        // Validamos cada uno de las combinaciones de lados
    (lado1 == lado2 && lado2 != lado3 && lado4 == 0) ||
    (lado2 == lado3 && lado3 != lado4 && lado1 == 0) ||
    (lado3 == lado4 && lado4 != lado1 && lado2 == 0) ||
    (lado2 == lado3 && lado3 != lado1 && lado3 == 0)) {
        // Es un Triángulo isósceles
        // Fórmula de Herón estandar para poder contar cualquier tipo de combinacion de lados
        double s = (lado1 + lado2 + lado3 + lado4) / 2;
        area = Math.sqrt(s * (s - (lado1 == 0 ? 0 : lado1)) * (s - (lado2 == 0 ? 0 : lado2)) * (s - (lado3 == 0 ? 0 : lado3)) * (s - (lado4 == 0 ? 0 : lado4)));
        perimetro = lado1 + lado2 + lado3 + lado4;
        // Validamos con el nombre de la figura para compilar de forma dinamica cada figura
        figura = "Triángulo isósceles";

    }else if(
    (lado1 != lado2 && lado2 != lado3 && lado4 == 0) ||
    (lado2 != lado3 && lado3 != lado4 && lado1 == 0) ||
    (lado3 != lado4 && lado4 != lado1 && lado2 == 0) ||
    (lado2 != lado3 && lado3 != lado1 && lado3 == 0)) {
        // Es un Triángulo escaleno
        // Validamos con el nombre de la figura para compilar de forma dinamica cada figura
        figura = "Triángulo escaleno";
        double s = (lado1 + lado2 + lado3 + lado4) / 2;
        if(lado3 <= (lado1 + lado2 - s) / 2){
        // Fórmula de Herón estándar
        area = Math.sqrt(s * (s - (lado1 == 0 ? 0 : lado1)) * (s - (lado2 == 0 ? 0 : lado2)) * (s - (lado3 == 0 ? 0 : lado3)) * (s - (lado4 == 0 ? 0 : lado4)));   
        }else {
        // Fórmula de Herón casos especiales

         area = s - lado3;
        }
        perimetro = lado1 + lado2 + lado3 + lado4;
    }
}

// Determinar si solo hay 4 valores diferente es un en un cuadrado o rectangulo

if (ladosConValor == 4) {
    // Determinar si los 4 lados son iguals es un cuadrado
    if (lado1 == lado2 && lado2 == lado3 && lado3 == lado4) {
        // Cuadrado
        // Validamos con el nombre de la figura para compilar de forma dinamica cada figura
        figura = "Cuadrado";
        area = Math.pow(lado1, 2);
        perimetro = 4 * lado1;
    // Determinar si los pares de cada lado son iguales es un rectangulo
    } else if (lado1 == lado3 && lado2 == lado4) {
        // Rectángulo
        // Validamos con el nombre de la figura para compilar de forma dinamica cada figura
        figura = "Rectángulo";
        area = lado1 * lado2;
        perimetro = 2 * (lado1 + lado2);
    } 
}

    %>        <%-- Mostrar datos específicos según la figura --%>
<%
if ("Círculo".equals(figura)) {
    %>
    <p>Figura: Círculo</p>
    <p>Radio: <%= radio %></p>
    <p>Diámetro: <%= diametro %></p>
    <p>Área: <%= area %></p>
    <p>Circunferencia: <%= circunferencia %></p>
    <%
} else if ("Cuadrado".equals(figura)) {
    %>
    <p>Figura: Cuadrado</p>
    <p>Área: <%= area %></p>
    <p>Perímetro: <%= perimetro %></p>
    <%
} else if ("Rectángulo".equals(figura)) {
    %>
    <p>Figura: Rectángulo</p>
    <p>Área: <%= area %></p>
    <p>Perímetro: <%= perimetro %></p>
    <%
} else if ("Triángulo equilátero".equals(figura)) {
    %>
    <p>Figura: Triángulo equilátero </p>
    <p>Perímetro: <%= perimetro %></p>
    <p>Área: <%= area %></p>
    <%
}  else if ("Triángulo isósceles".equals(figura)) {
    %>
    <p>Figura: Triángulo Isósceles</p> 
    <p>Perímetro: <%= perimetro %></p>
    <p>Área: <%= area %></p>
    <%
}   else if ("Triángulo escaleno".equals(figura)) {
    %>
    <p>Figura: <%= figura %></p>
    <p>Perímetro: <%= perimetro %></p> 
    <p>Área: <%= area %></p>

    <%
}
%>
        <form action="index.jsp" method="get">
            <input type="submit" value="Volver">
        </form>
        </div>
    </div>
</body>
</html>
