<html>
<body>

Site:  <?php echo $_GET["sitechoice"]; ?><br>


<?php 
#echo `whoami;`
?>

<?php 
$site = fopen("site.txt", "w") or die("Unable to open file!");
$choice = $_GET["sitechoice"];
echo $choice;
fwrite($site, $_GET["sitechoice"]);
fclose($site);
?>

<p><a href=analysis.php>Go Now...</a></p>
</body>
</html>
