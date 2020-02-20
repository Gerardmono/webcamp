<?php include_once 'includes/templates/headers.php'; ?>
    <section class="seccion contenedor2">
        <h2>La mejor conferencia de diseño web en español</h2>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae modi ipsum aspernatur tempore ipsa incidunt sit voluptates, explicabo vitae illo id qui quisquam asperiores eveniet? Asperiores quaerat laborum necessitatibus fugiat. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Velit ab a est, corrupti repellendus officiis, autem esse culpa similique, eveniet eum! Officiis quam repudiandae, optio doloremque voluptate adipisci delectus ullam!</p>
    </section>
    <section class="programa">
        <div class="contenedor-video">
            <video autoplay loop poster="img/bg-talleres.jpg" >
                <source src="video/video.mp4" type="video/mp4">
                <source src="video/video.webm" type="video/webm">
                <source src="video/video.ogv" type="video/ogg">
            </video>
        </div>
        <div class="contenido-programa">
            <div class="contenedor2">
                <div class="programa-evento">
                    <h2>Programa del evento</h2>
                    <?php
                        try {
                            require_once('includes/funciones/bd_conexion.php');
                            $sql = "SELECT * FROM categoria_evento;";
                            $resultado = $conn -> query($sql);
                        } catch (\Exception $e) {
                            echo $e->getMessage();
                        }
                    ?>
                    <nav class="menu-programa">
                        <?php while ($cat = $resultado->fetch_array(MYSQLI_ASSOC)) {?>
                            <?php $categoria = strtolower($cat['cat_evento']);?>
                            <a href="#<?php echo $categoria;?>"><i class="<?php echo $cat['icono'];?>"></i> <?php echo $cat['cat_evento'];?></a>
                        <?php }?>
                    </nav>
                    <?php
                        try {
                            require_once('includes/funciones/bd_conexion.php');
                            $sql = "SELECT evento_id, nombre_evento, fecha_evento, hora_evento, cat_evento, icono, nombre, apellido ";
                            $sql .= "FROM eventos ";
                            $sql .= "INNER JOIN categoria_evento ";
                            $sql .= "ON eventos.id_cat_evento = categoria_evento.id_categoria ";
                            $sql .= "INNER JOIN invitados ";
                            $sql .= "ON eventos.id_inv = invitados.invitado_id ";
                            $sql .= "AND eventos.id_cat_evento=1 ";
                            $sql .= "ORDER BY evento_id LIMIT 2; ";
                            $sql .= "SELECT evento_id, nombre_evento, fecha_evento, hora_evento, cat_evento, icono, nombre, apellido ";
                            $sql .= "FROM eventos ";
                            $sql .= "INNER JOIN categoria_evento ";
                            $sql .= "ON eventos.id_cat_evento = categoria_evento.id_categoria ";
                            $sql .= "INNER JOIN invitados ";
                            $sql .= "ON eventos.id_inv = invitados.invitado_id ";
                            $sql .= "AND eventos.id_cat_evento=2 ";
                            $sql .= "ORDER BY evento_id LIMIT 2; ";
                            $sql .= "SELECT evento_id, nombre_evento, fecha_evento, hora_evento, cat_evento, icono, nombre, apellido ";
                            $sql .= "FROM eventos ";
                            $sql .= "INNER JOIN categoria_evento ";
                            $sql .= "ON eventos.id_cat_evento = categoria_evento.id_categoria ";
                            $sql .= "INNER JOIN invitados ";
                            $sql .= "ON eventos.id_inv = invitados.invitado_id ";
                            $sql .= "AND eventos.id_cat_evento=3 ";
                            $sql .= "ORDER BY evento_id LIMIT 2; ";
                        } catch (\Exception $e) {
                            echo $e->getMessage();
                        }
                        $conn->multi_query($sql);
                        
                        do {
                            $resultado = $conn->store_result();
                            $row = $resultado->fetch_all(MYSQLI_ASSOC);
                            $i = 0;
                            foreach ($row as $evento) {
                                if ($i%2==0) {
                    ?>
                                    <div id="<?php echo strtolower($evento['cat_evento']);?>" class="info-curso ocultar clearfix">
                    <?php 
                                }
                    ?>
                                    <div class="detalle-evento">
                                        <h3><?php echo $evento['nombre_evento'];?></h3>
                                        <p><i class="fas fa-clock"></i><?php echo $evento['hora_evento'];?></p>
                                        <p><i class="fas fa-calendar"></i><?php echo $evento['fecha_evento'];?></p>
                                        <p><i class="fas fa-user"></i><?php echo $evento['nombre']. " ". $evento['apellido'];?></p>
                                    </div>
                                    
                    <?php
                                $i++;
                            }
                    ?>
                                    <a href="calendario.php" class="boton float-right">Ver todos</a>
                                </div>
                    <?php
                            $resultado->free();
                        } while ($conn->more_results() && $conn->next_result());
                    ?>

                    
                </div>
            </div>
        </div>
    </section>
    
    <?php include_once 'includes/templates/invitado.php'; ?>

    <div class="contador parallax">
        <div class="contenedor2 clearfix">
            <ul class="resumen-evento">
                <li><p class="numero"></p>Dias</li>
                <li><p class="numero"></p>Invitados</li>
                <li><p class="numero"></p>Conferencias</li>
                <li><p class="numero"></p>Talleres</li>
            </ul>
        </div>
    </div>
    <section class="precios seccion">
        <h2>Precios</h2>
        <div class="contenedor2">
            <ul class="lista-precios clearfix">
                <li>
                    <div class="tabla-precio">
                        <h3>Pase por día</h3>
                        <p class="numero">$30</p>
                        <ul>
                            <li>Bocadillos gratis</li>
                            <li>Todas las Conferencias</li>
                            <li>Todos los talleres</li>
                        </ul>
                        <a href="#" class="boton hollow">Comprar</a>
                    </div>
                </li>
                <li>
                    <div class="tabla-precio">
                        <h3>Todos los dias</h3>
                        <p class="numero">$50</p>
                        <ul>
                            <li>Bocadillos gratis</li>
                            <li>Todas las Conferencias</li>
                            <li>Todos los talleres</li>
                        </ul>
                        <a href="#" class="boton ">Comprar</a>
                    </div>
                </li>
                <li>
                    <div class="tabla-precio">
                        <h3>Pase por 2 días</h3>
                        <p class="numero">$45</p>
                        <ul>
                            <li>Bocadillos gratis</li>
                            <li>Todas las Conferencias</li>
                            <li>Todos los talleres</li>
                        </ul>
                        <a href="#" class="boton hollow">Comprar</a>
                    </div>
                </li>
            </ul>
        </div>
    </section>

    <div class="mapa" id="mapa"></div>

    <section class="seccion">
        <h2>testimoniales</h2>
        <div class="testimoniales contenedor2 clearfix">
            <div class="testimonial">
                <blockquote>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Cupiditate facere quos incidunt soluta voluptatem modi recusandae asperiores dolorem, ipsam nisi explicabo ut sunt? Temporibus nihil eius reprehenderit itaque maxime officia!</p>
                    <footer class="info-testimonial clearfix">
                        <img src="img/testimonial.jpg" alt="Imagen testimonial">
                        <cite>Oswaldo Aponte Escobedo <span>Diseñador en @prisma</span></cite>
                    </footer>
                </blockquote>
            </div>
            <div class="testimonial">
                <blockquote>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Cupiditate facere quos incidunt soluta voluptatem modi recusandae asperiores dolorem, ipsam nisi explicabo ut sunt? Temporibus nihil eius reprehenderit itaque maxime officia!</p>
                    <footer class="info-testimonial clearfix">
                        <img src="img/testimonial.jpg" alt="Imagen testimonial">
                        <cite>Oswaldo Aponte Escobedo <span>Diseñador en @prisma</span></cite>
                    </footer>
                </blockquote>
            </div>
            <div class="testimonial">
                <blockquote>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Cupiditate facere quos incidunt soluta voluptatem modi recusandae asperiores dolorem, ipsam nisi explicabo ut sunt? Temporibus nihil eius reprehenderit itaque maxime officia!</p>
                    <footer class="info-testimonial clearfix">
                        <img src="img/testimonial.jpg" alt="Imagen testimonial">
                        <cite>Oswaldo Aponte Escobedo <span>Diseñador en @prisma</span></cite>
                    </footer>
                </blockquote>
            </div>
        </div>
    </section>

    <div class="newsletter parallax">
        <div class="contenido contenedor2">
            <p>Registrate al newsletter</p>
            <h3>Webcamp</h3>
            <a href="#mc_embed_signup" class="boton transparente boton_newsletter">Registro</a>
        </div>
    </div>


    <section class="seccion">
        <h2>Faltan</h2>
        <div class="cuenta-regresiva contenedor2">
            <ul class="clearfix">
                <li><p class="numero" id="dias"></p>Días</li>
                <li><p class="numero" id="horas"></p>Horas</li>
                <li><p class="numero" id="min"></p>Minutos</li>
                <li><p class="numero" id="seg"></p>Segundos</li>
            </ul>
        </div>
        
    </section>
    
    <?php include_once 'includes/templates/footers.php'; ?>


    <script src="js/vendor/modernizr-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-3.4.1.min.js"><\/script>')</script>
    <script src="js/plugins.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/invitados.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/jquery.colorbox-min.js"></script>
    <script src="js/jquery.lettering.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"></script>
    <script src="js/index.js"></script>
    <script src="js/main.js"></script>

    <!-- Google Analytics: change UA-XXXXX-Y to be your site's ID. -->
    <script>
        window.ga = function () { ga.q.push(arguments) }; ga.q = []; ga.l = +new Date;
        ga('create', 'UA-XXXXX-Y', 'auto'); ga('set','transport','beacon'); ga('send', 'pageview')
    </script>
    <script src="https://www.google-analytics.com/analytics.js" async></script>
    <script type="text/javascript" src="//downloads.mailchimp.com/js/signup-forms/popup/unique-methods/embed.js" data-dojo-config="usePlainJson: true, isDebug: false"></script><script type="text/javascript">window.dojoRequire(["mojo/signup-forms/Loader"], function(L) { L.start({"baseUrl":"mc.us4.list-manage.com","uuid":"274d36a17a57fce216edc7aa0","lid":"f9e4a0af97","uniqueMethods":true}) })</script>
</body>

</html>
<!-- Begin Mailchimp Signup Form -->
<link href="//cdn-images.mailchimp.com/embedcode/classic-10_7.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#mc_embed_signup{background:#fff; clear:left; font:14px Helvetica,Arial,sans-serif; }
	/* Add your own Mailchimp form style overrides in your site stylesheet or in this style block.
	   We recommend moving this block and the preceding CSS link to the HEAD of your HTML file. */
</style>

    <div style="display: none;">
        <div id="mc_embed_signup">
        <form action="https://hotmail.us4.list-manage.com/subscribe/post?u=274d36a17a57fce216edc7aa0&amp;id=f9e4a0af97" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
            <div id="mc_embed_signup_scroll">
            <h2>Suscribete a nuestro newsletter</h2>
        <div class="indicates-required"><span class="asterisk">*</span> Campos requeridos</div>
        <div class="mc-field-group">
            <label for="mce-EMAIL">E-mail <span class="asterisk">*</span>
        </label>
            <input type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL">
        </div>
        <div class="mc-field-group">
            <label for="mce-FNAME">Nombre </label>
            <input type="text" value="" name="FNAME" class="" id="mce-FNAME">
        </div>
        <div class="mc-field-group">
            <label for="mce-LNAME">Apellidos </label>
            <input type="text" value="" name="LNAME" class="" id="mce-LNAME">
        </div>
            <div id="mce-responses" class="clear">
                <div class="response" id="mce-error-response" style="display:none"></div>
                <div class="response" id="mce-success-response" style="display:none"></div>
            </div>    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
            <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_274d36a17a57fce216edc7aa0_f9e4a0af97" tabindex="-1" value=""></div>
            <div class="clear"><input type="submit" value="Suscribir" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
            </div>
        </form>
        </div>
    </div>


<script type='text/javascript' src='//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js'></script><script type='text/javascript'>(function($) {window.fnames = new Array(); window.ftypes = new Array();fnames[0]='EMAIL';ftypes[0]='email';fnames[1]='FNAME';ftypes[1]='text';fnames[2]='LNAME';ftypes[2]='text';}(jQuery));var $mcj = jQuery.noConflict(true);</script>
<!--End mc_embed_signup-->
