document.addEventListener('DOMContentLoaded', function() {
    const submitBtn = document.querySelector('.submit-btn');
    if (submitBtn) {
        submitBtn.addEventListener('click', function(e) {
            e.preventDefault();
            
            const ticketData = {
                title: document.getElementById('summary').value.trim(),
                script: document.querySelector('.ticket-description').value.trim(),
                customer_firstname: document.getElementById('firstName').value.trim(),
                customer_lastname: document.getElementById('lastName').value.trim(),
                customer_phone: document.getElementById('phone').value.trim(),
                customer_mobile: document.getElementById('mobile').value.trim(),
                customer_email: document.getElementById('email').value.trim(),
                ticket_type: document.getElementById('type-select').value,
                priority: document.getElementById('priority-select').value
            };
            
            if (!ticketData.title || !ticketData.script) {
                alert('Please fill in both Summary and Script fields');
                return;
            }
            
            submitBtn.disabled = true;
            const originalText = submitBtn.querySelector('.text-label').textContent;
            submitBtn.querySelector('.text-label').textContent = 'Submitting...';
            
            fetch('submit_ticket.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(ticketData)
            })
            .then(response => response.json())
            .then(data => {
                console.log('Ticket submission result:', data);
                
                if (data.success) {
                    alert(`Ticket #${data.ticket_id} created successfully!`);
                    
                    document.getElementById('summary').value = '';
                    document.querySelector('.ticket-description').value = '';
                    document.getElementById('firstName').value = '';
                    document.getElementById('lastName').value = '';
                    document.getElementById('phone').value = '';
                    document.getElementById('mobile').value = '';
                    document.getElementById('email').value = '';
                    document.getElementById('type-select').value = 'failure';
                    document.getElementById('priority-select').value = 'medium';
                    document.getElementById('status-select').value = 'open';
                    
                    if (typeof refreshTickets === 'function') {
                        refreshTickets();
                    }  
                } else {
                    alert('Error creating ticket: ' + data.error);
                }
            })
            .catch(error => {
                console.error('Error submitting ticket:', error);
                alert('Failed to submit ticket. Please try again.');
            })
            .finally(() => {
                submitBtn.disabled = false;
                submitBtn.querySelector('.text-label').textContent = originalText;
            });
        });
    }
});