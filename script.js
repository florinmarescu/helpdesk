document.addEventListener('DOMContentLoaded', function() {
    console.log('try to fetch agent name...');
    fetch('get_agent.php')
    .then(response => {
        console.log('Response received:', response);
        return response.json();
    })
    .then(data => {
        console.log('Data received:', data);
        document.querySelector('.agent-name').textContent = data.agent_name;
    })
    .catch(error => {
        console.error('Error fetching agent name:', error);
    });

    const profileMenu = document.querySelector('.profile-menu');
    const profileTrigger = document.querySelector('.profile-trigger');
    
    profileTrigger.addEventListener('click', function(e) {
        e.stopPropagation();
        profileMenu.classList.toggle('active');
    });
    document.addEventListener('click', function() {
        profileMenu.classList.remove('active');
    });
    document.querySelector('.sub-menu').addEventListener('click', function(e) {
        e.stopPropagation();
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const allInputs = document.querySelectorAll('input[type="text"]');
    
    allInputs.forEach(field => {
        field.addEventListener('click', function() {
            if (this.value) {
                navigator.clipboard.writeText(this.value);
                console.log('Copied:', this.value);
            }
        });
    });
});