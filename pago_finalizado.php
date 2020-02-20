<?php 
    include_once 'includes/templates/headers.php';
    use PayPal\Rest\APIContext;
    use PayPal\Api\PaymentExecution;
    use PayPal\Api\Payment;
    require 'includes/paypal.php';
?>

    <section class="seccion contador">
        <h2>Pagos con Paypal</h2>
        <?php 
            $id_pago = $_GET['id_pago'];
            if (isset($_GET['paymentId'])) {
                $pago = Payment::get($_GET['paymentId'], $apiContext);
                $execution = new PaymentExecution();
                $execution->setPayerId($_GET['PayerID']);
                $resultado = $pago->execute($execution, $apiContext);
                $respuesta = $resultado->transactions[0]->related_resources[0]->sale->state;
                // var_dump($respuesta);
            }
            if (isset($_GET['paymentId']) && $respuesta == "completed") {
                echo "<div class='resultado correcto'>";
                    echo "<p>El pago se realizo correctamente </br>";
                    echo "el ID es {$_GET['paymentId']}</p>";
                echo "</div>";
                require_once('includes/funciones/bd_conexion.php');
                $stmt = $conn->prepare("UPDATE registrados SET pagado = ? WHERE id_registrado = ?");
                $pagado = 1;
                $stmt->bind_param('ii', $pagado, $id_pago);
                $stmt->execute();
                $stmt->close();
                $conn->close();
            }else{
                echo "<div class='resultado error'>";
                    echo "El pago no se realizo </br>";
                echo "</div>";
            }
        ?>
    </section>
    <?php include_once 'includes/templates/footers.php'; ?>

    <script src="js/vendor/modernizr-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-3.4.1.min.js"><\/script>')</script>
    <script src="js/jquery.lettering.js"></script>
    <script src="js/main.js"></script>

    <!-- Google Analytics: change UA-XXXXX-Y to be your site's ID. -->
    <script>
        window.ga = function () { ga.q.push(arguments) }; ga.q = []; ga.l = +new Date;
        ga('create', 'UA-XXXXX-Y', 'auto'); ga('set','transport','beacon'); ga('send', 'pageview')
    </script>
    <script src="https://www.google-analytics.com/analytics.js" async></script>
</body>

</html>