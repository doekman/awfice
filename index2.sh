#!/bin/bash

DATA="$(./index.sh)"
DATA="'${DATA//'/\'}'"
#DATA="${DATA//<\/script>/<\/scr'+'ipt>}"
cat	<< EOF
<html>
<script>
// htmlpreview.github.io's loadHTML:
setTimeout(function () {
	document.open();
	document.write(${DATA}.replace(/(<[/]script\s*>)/gi, ));
	document.close();
	replaceAssets();
}, 10); //Delay updating document to have it cleared before

</script>
</html>
EOF
