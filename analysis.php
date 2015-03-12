<html>
<body>

<p><a href=index.html>Home!</a></p>

<?php
$output = shell_exec('./analysis.bash');
#$output = shell_exec('curl www.hupy.com');
#output = shell_exec('read hey; echo $hey');
echo "<pre>$output</pre>";
?>
</html>
