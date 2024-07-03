document.getElementById('form-text').addEventListener('submit', function(event) {
    event.preventDefault();

    var formData = new FormData(this);

    fetch('/corrigir', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById('output-text').innerText = data;
    })
    .catch(error => console.error('Error:', error));
});
