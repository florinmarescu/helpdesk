fetch('http://localhost/licenta/login.php', {
    method: 'POST',
    body: formData
})
.then(response => {
    if (response.redirected) {
        window.location.href = 'app.html';
    } else {
        showError('Invalid username');
    }
})
.catch(() => {
    showError('Login failed. Please try again.');
});

document.getElementById('username').focus();

document.getElementById('password').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        document.getElementById('loginForm').submit();
    }
});
