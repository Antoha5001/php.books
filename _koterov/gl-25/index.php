<?php
	header("Content-type: text/html; charset = utf-8");
	require "libs.php";
//	function __autoload($methodName) {
//		require __DIR__ . "/vendor/".$methodName.".php";
//	}

	spl_autoload_register(function ($methodName){
	   require __DIR__ . "/vendor/".$methodName.".php";
	});

?>


<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Title</title>
</head>
<body>
<?php
	use webalt\core\Page;

	$a = new Page("Anton");
	$a->getName();

?>

</body>
</html>