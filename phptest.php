<html>


<script>
//var site = prompt("What site?!")
</script>

<body>

<p><a href=index.html>Home!</a></p>

<form action="welcome.php" method="post">
Site: <input type="text" name="site"><br>
<input type="submit">
</form>
</body>


<?php
$output = shell_exec('./analysis.bash');
#$output = shell_exec('curl www.hupy.com');
#output = shell_exec('read hey; echo $hey');
echo "<pre>$output</pre>";
?>
</html>
