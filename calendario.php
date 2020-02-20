<?php include_once 'includes/templates/headers.php'; ?>

    <section class="seccion contenedor2">
        <h2>Calendario de eventos</h2>
        <?php
            try {
                require_once('includes/funciones/bd_conexion.php');
                $sql = "SELECT evento_id, nombre_evento, fecha_evento, hora_evento, cat_evento, icono, nombre, apellido ";
                $sql .= "FROM eventos ";
                $sql .= "INNER JOIN categoria_evento ";
                $sql .= "ON eventos.id_cat_evento = categoria_evento.id_categoria ";
                $sql .= "INNER JOIN invitados ";
                $sql .= "ON eventos.id_inv = invitados.invitado_id ";
                $sql .= "ORDER BY evento_id ";
                $resultado = $conn -> query($sql);
            } catch (\Exception $e) {
                echo $e->getMessage();
            }
        ?>

        <div class="calendario">
            <?php
                $calendario = array(); 
                while ($eventos = $resultado->fetch_assoc()) {
                    $fecha = $eventos['fecha_evento'];
                    $evento = array(
                        'titulo' => $eventos['nombre_evento'],
                        'fecha' => $eventos['fecha_evento'],
                        'hora' => $eventos['hora_evento'],
                        'categoria' => $eventos['cat_evento'],
                        'icono' => $eventos['icono'],
                        'invitado' => $eventos['nombre']. " " . $eventos['apellido']
                    );
                    $calendario[$fecha][] = $evento;
            ?>

            <?php } ?>
            <?php
                foreach ($calendario as $dia => $lista_eventos) {
            ?>
                    <h3>
                        <i class="fas fa-calendar-alt"></i>
                        <?php
                            setlocale(LC_TIME, 'es_Es.UTF-8');
                            setlocale(LC_TIME, 'spanish');
                            echo strftime("%A, %d de %B del %Y", strtotime($dia));
                        ?>
                    </h3>
                    <?php
                        foreach ($lista_eventos as $evento) {
                    ?>
                            <div class="dia">
                                <p class="titulo"> <?php echo $evento['titulo'];?> </p>
                                <p class="hora">
                                    <i class="fas fa-clock" aria-hidden="true"></i> 
                                    <?php echo $evento['fecha']. " ". $evento['hora'];?>
                                </p>
                                <p>
                                    <i class="<?php echo $evento['icono'];?>" aria-hidden="true"></i> 
                                    <?php echo $evento['categoria'];?>
                                </p>
                                <p class="hora">
                                    <i class="fas fa-user" aria-hidden="true"></i> 
                                    <?php echo $evento['invitado'];?>
                                </p>
                            </div>
                    <?php
                        }
                    ?>
            <?php    
                }
            ?>

            
        </div>

        <?php $conn->close();?>
    </section>

    <?php include_once 'includes/templates/footers.php'; ?>

    <script src="js/vendor/modernizr-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-3.4.1.min.js"><\/script>')</script>
    <script src="js/plugins.js"></script>
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

