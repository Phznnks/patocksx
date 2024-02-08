document.getElementById("cpf").addEventListener("keyup", function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      document.getElementById("senha").focus();
    }
 });
 
document.getElementById("senha").addEventListener("keyup", function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      document.getElementById("loginForm").submit();
    }
});

document.getElementById("entrar").addEventListener("keyup", function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
    alert("teste")
  }
});
