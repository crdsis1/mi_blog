# create_blog.ps1 - crea la estructura mínima de un blog estático
New-Item -Path . -Name "img" -ItemType Directory -Force

"Creando index.html..."
@"
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Mi Blog Personal</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <header>
    <h1>Blog de Tecnología y Desarrollo</h1>
    <nav>
      <a href="index.html">Inicio</a>
      <a href="about.html">Sobre mí</a>
    </nav>
  </header>

  <main>
    <article>
      <h2><a href="blog1.html">Cómo funciona Internet</a></h2>
      <img src="img/entrada1.jpg" alt="Internet">
      <p>Exploramos cómo los datos viajan por la red y qué papel juegan los protocolos.</p>
    </article>

    <article>
      <h2><a href="blog2.html">Introducción a HTML y CSS</a></h2>
      <img src="img/entrada2.jpg" alt="HTML y CSS">
      <p>Aprende los fundamentos para crear tu primera página web.</p>
    </article>

    <article>
      <h2><a href="blog3.html">Qué es un servidor web</a></h2>
      <img src="img/entrada3.jpg" alt="Servidor web">
      <p>Conoce cómo los servidores entregan páginas a los navegadores.</p>
    </article>
  </main>

  <footer>
    <p>© 2025 Mi Blog | Desarrollado por [Tu Nombre]</p>
  </footer>
</body>
</html>
"@ > index.html

# Crea las otras páginas (simplificadas)
Set-Content -Path blog1.html -Value @"
<!DOCTYPE html>
<html lang='es'>
<head><meta charset='utf-8'/><meta name='viewport' content='width=device-width,initial-scale=1'/><title>Cómo funciona Internet</title><link rel='stylesheet' href='style.css'/></head>
<body><header><h1><a href='index.html'>Blog</a></h1></header><article><h2>Cómo funciona Internet</h2><img src='img/entrada1.jpg' alt='Internet'><p>Internet es una red global ...</p></article><footer><a href='index.html'>← Volver</a></footer></body></html>
"@

Set-Content -Path blog2.html -Value @"
<!DOCTYPE html><html lang='es'><head><meta charset='utf-8'/><meta name='viewport' content='width=device-width,initial-scale=1'/><title>Introducción a HTML y CSS</title><link rel='stylesheet' href='style.css'/></head><body><header><h1><a href='index.html'>Blog</a></h1></header><article><h2>Introducción a HTML y CSS</h2><img src='img/entrada2.jpg' alt='HTML'><p>HTML estructura ...</p></article><footer><a href='index.html'>← Volver</a></footer></body></html>
"@

Set-Content -Path blog3.html -Value @"
<!DOCTYPE html><html lang='es'><head><meta charset='utf-8'/><meta name='viewport' content='width=device-width,initial-scale=1'/><title>Qué es un servidor web</title><link rel='stylesheet' href='style.css'/></head><body><header><h1><a href='index.html'>Blog</a></h1></header><article><h2>Qué es un servidor web</h2><img src='img/entrada3.jpg' alt='Servidor'><p>Un servidor web es ...</p></article><footer><a href='index.html'>← Volver</a></footer></body></html>
"@

Set-Content -Path about.html -Value @"
<!DOCTYPE html><html lang='es'><head><meta charset='utf-8'/><meta name='viewport' content='width=device-width,initial-scale=1'/><title>Sobre mí</title><link rel='stylesheet' href='style.css'/></head><body><header><h1><a href='index.html'>Mi Blog</a></h1></header><main><h2>Sobre mí</h2><p>Hola, soy [Tu Nombre].</p></main><footer><a href='index.html'>← Volver</a></footer></body></html>
"@

"Creando style.css..."
@"
body {
  font-family: 'Segoe UI', Roboto, Arial, sans-serif;
  margin: 0; background: #f5f6fa; color: #222;
}
header { background: #0b5bd7; color: #fff; padding: 1rem; text-align:center;}
main { width: 90%; max-width: 1000px; margin: 1.5rem auto; display:grid; grid-template-columns: repeat(auto-fit, minmax(260px,1fr)); gap: 1rem;}
article { background: #fff; padding: 1rem; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.08);}
article img { width:100%; border-radius:6px;}
footer { background: #0b5bd7; color:white; text-align:center; padding:0.75rem; margin-top:1.5rem;}
"@ > style.css

# Crear imágenes-placeholder simples (si no quieres, puedes copiar imágenes reales a la carpeta img)
$bmp = New-Object System.Drawing.Bitmap 1200,800
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::LightGray)
$font = New-Object System.Drawing.Font 'Arial',48
$brush = [System.Drawing.Brushes]::DarkGray
$g.DrawString('Imagen 1',$font,$brush,400,380)
$bmp.Save('img\entrada1.jpg',[System.Drawing.Imaging.ImageFormat]::Jpeg)
$g.Clear([System.Drawing.Color]::LightGray)
$g.DrawString('Imagen 2',$font,$brush,400,380)
$bmp.Save('img\entrada2.jpg',[System.Drawing.Imaging.ImageFormat]::Jpeg)
$g.Clear([System.Drawing.Color]::LightGray)
$g.DrawString('Imagen 3',$font,$brush,400,380)
$bmp.Save('img\entrada3.jpg',[System.Drawing.Imaging.ImageFormat]::Jpeg)
$g.Dispose(); $bmp.Dispose()

"Todos los archivos creados. Abre index.html en tu navegador."
