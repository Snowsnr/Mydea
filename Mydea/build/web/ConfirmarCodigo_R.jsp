<%-- 
    Document   : ConfirmarCodigo
    Created on : 29 nov 2023, 9:12:58
    Author     : ibarr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .cont {
            text-align: center;
            margin-top: 50px; /* Ajusta este valor según tus necesidades */
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 300px; /* Ajusta este valor según tus necesidades */
            margin: 0 auto; /* Centra el formulario horizontalmente */
        }

        h1 {
            color: #333;
            font-size: 1.2em; /* Ajusta este valor según tus necesidades */
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        span {
            color: red;
            display: block;
            margin-bottom: 16px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <body>
        <div class="cont">
        <h1>Se ha enviado un codigo a su correo electrónico</h1>
        <form action="Registro" method="POST">
            <label for="code">Código de confirmación:</label><br>
            <input type="text" id="code" name="codigo"><br>
            <span>${error_codigo}</span>
            <%-- Recuperar los datos de la sesión --%>
            <input type="hidden" name="Nom_com_reg" value="<%= session.getAttribute("nombrep") %>">
            <input type="hidden" name="Nom_usu_reg" value="<%= session.getAttribute("nombreu") %>">
            <input type="hidden" name="Email_reg" value="<%= session.getAttribute("email") %>">
            <input type="hidden" name="Num_reg" value="<%= session.getAttribute("telefono") %>">
            <input type="hidden" name="Con_reg" value="<%= session.getAttribute("password") %>">
            <input type="hidden" name="Tipo" value="<%= session.getAttribute("tipo") %>">
            <input type="submit" value="Confirmar">
        </form>
        </div>
    </body>
</html>
