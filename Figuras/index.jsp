<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora de Figuras</title>

     <script type="text/javascript">
        function justNumbers(e) {
            var keynum = window.event ? window.event.keyCode : e.which;
             if ( keynum == 8 ) return true;
             return /\d/.test(String.fromCharCode(keynum));
}
		</script>

</head>
<body>
<div class="container">
    <div class="containerForm">
        <h1>Calculadora de Figuras</h1>
        <form action="procesarFigura.jsp" method="post" >
            <label for="lado1" class="label.text">Lado 1:</label>
            <input type="text" id="lado1" name="lado1" required title="Ingresa solo números" inputmode="numeric" placeholder="A" onkeypress="return justNumbers(event);"><br>

            <label for="lado2" class="label.text">Lado 2:</label>
            <input type="text" id="lado2" name="lado2" required title="Ingresa solo números" inputmode="numeric" placeholder="B" onkeypress="return justNumbers(event);"><br>

            <label for="lado3" class="label.text">Lado 3:</label>
            <input type="text" id="lado3" name="lado3" required title="Ingresa solo números" inputmode="numeric" placeholder="C" onkeypress="return justNumbers(event);"><br>

            <label for="lado4" class="label.text">Lado 4:</label>
            <input type="text" id="lado4" name="lado4" required title="Ingresa solo números" inputmode="numeric" placeholder="D" onkeypress="return justNumbers(event);"><br>

            <input type="submit" value="Calcular" class="button">
        </form>
    </div>
</div>
</body>
</html>
