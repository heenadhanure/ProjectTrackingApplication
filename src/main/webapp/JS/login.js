/**
 * 
 */document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const registeredUsers = JSON.parse(localStorage.getItem('registeredUsers')) || [];

    const user = registeredUsers.find(user => user.username === username && user.password === password);
    if (user) {
        document.querySelector('.user-details').style.display = 'block';
        document.getElementById('userInfo').textContent = `Welcome, ${user.firstName} ${user.lastName}. Role: ${user.role}`;
        document.querySelector('.login-form').style.display = 'none';
    } else {
        document.querySelector('.error-message').style.display = 'block';
    }
});
