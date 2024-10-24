<?php
include 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $descripcion = $_POST['descripcion'];
    $tipo = $_POST['tipo'];
    $fechaLimite = $_POST['limiteEntrega'];
    $empleadoId = $_POST['empleado_id'];
    $pedidoId = $_POST['pedido_id'];

    $sql = "INSERT INTO Ticket (descripcion, tipo, fechaCreacion, limiteEntrega, empleado_id, pedido_id) 
            VALUES (:descripcion, :tipo, CURDATE(), :limiteEntrega, :empleado_id, :pedido_id)";

    $stmt = $conexion->prepare($sql);
    $stmt->bindParam(':descripcion', $descripcion);
    $stmt->bindParam(':tipo', $tipo);
    $stmt->bindParam(':limiteEntrega', $fechaLimite);
    $stmt->bindParam(':empleado_id', $empleadoId);
    $stmt->bindParam(':pedido_id', $pedidoId);

    if ($stmt->execute()) {
        header('Location: VisualizarPedido.html');
        exit();
    } else {
        echo "Error al crear el ticket";
    }
}
?>
