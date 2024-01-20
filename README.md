## My Personal Processing Repository

 <p>Here are some of my favourite examples:</p>
 <br>

 <a href="https://github.com/JannisElef/Processing/blob/main/sketches/minecraft_mosaic/"><strong>Minecraft-mosaic maker</strong></a>
 <br>

 <p>The sketch takes an image/ frames and displays them using minecraft block-textures by finding the closest matching texture for a given area using the average color of the area and texture.</p>

 <img src="https://github.com/JannisElef/Processing/blob/main/sketches/minecraft_mosaic/sample_image.png">
 <br>
<details>
  <summary><strong>More Examples</strong></summary>
  <br>
  <ol>
	<details>
		<summary><a href="https://github.com/JannisElef/Processing/blob/main/sketches/text_shader/?raw=true"><strong> Text shader</strong></a></summary>
		<ul>
		<br>
		<p>The sketch takes an image and draws letters with a variety of "dense-ness" according to the brightness of the image-area it replaces, furthermore the letter uses the image-area's color as fill:</p>
		<img src="https://github.com/JannisElef/Processing/blob/main/sketches/text_shader/sample_image.png">
     		</ul>
	</details>
	<details>
		<summary><a href="https://github.com/JannisElef/Processing/blob/main/sketches/procedual_bauhaus_background_generator/?raw=true"><strong> Procedual bauhaus background generator</strong></a></summary>
		<ul>
		<br>
		<p>Using pre-defined shapes and different color palettes to generate a random and unique variety of images:</p>
		<img src="https://github.com/JannisElef/Processing/blob/main/sketches/procedual_bauhaus_background_generator/sample_image.png">
     		</ul>
      	</details>
	<details>
		<summary><a href="https://github.com/JannisElef/Processing/blob/main/sketches/kNN_Visualizer/?raw=true"><strong> kNN Visualizer</strong></a></summary>
		<ul>
		<br>
		<p>My short implementation for the k-Next-Neighbour Algorithm, where the cursor is the new data point and the nearest k-neighbours are connected to it through lines (e.g. k = 5):</p>
		<img src="https://github.com/JannisElef/Processing/blob/main/sketches/kNN_Visualizer/sample_image.png">
     		</ul>
	</details>
  </ol>
</details>

## Sketch-Use-Guidance

 <p>When wanting to try out a sketch, consider the following:</p>

* Download the whole folder -> sketch needs to be inside its own folder to work
* Generally the keyboard-shortcut for saving an image is **ENTER**
* Other sketches may offer more key-functionality like in- or decreasing a sketch-cruital value with **UP** or **DOWN**
  --> more keyCodes, etc. depending on the sketch may be found in the function *keyPressed()* it's generally the last function in a sketch


 ## My Processing IDE

 <p>The Processing IDE sucks, versions 4.x did come with more theme selection but the lack of font customization or features like auto-closing brackets is annoying. </p>
 <p>Using an external editor and running the sketches from the command line is just an temporary solution, the sweet "<strong>Run</strong>" button is just too convenient to miss out on.</p>
 <br>
 
 So I've decided to dig through the `processing-4.x.x/lib/theme/theme.txt` and mark all important keyword-highlighting colors and primary UI-elements to make it more easy to edit/ customize them in the future, thereby also creating my own <a href="https://github.com/JannisElef/Processing/blob/main/theme.txt"><strong>theme.txt</strong></a>, to atleast squeeze out some customization.

 \<Inspired by the <a href="https://github.com/gaplo917/GapStyle"><strong>GapStyle</strong></a> Theme\>
 
<img src="https://github.com/JannisElef/Processing/blob/main/theme_screenshot.png">
