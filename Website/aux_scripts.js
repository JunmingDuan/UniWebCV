function switchAbstract(abstractid, abstract) {
  var x = document.getElementById(abstractid);
  if (x.innerHTML === "") {
    x.innerHTML = abstract;
  } else {
    x.innerHTML = "";
  }
}

//<script type="text/javascript">
//$(function(){
//$("#navplaceholder").load("https://junmingduan.github.io/navigation.html");
//});
//</script>

$(function(){
$("#navplaceholder").load("https://junmingduan.github.io/navigation.html");
});


