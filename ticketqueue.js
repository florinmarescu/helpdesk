let ticketContainer = null;
let currentTicketId = null;

document.addEventListener('DOMContentLoaded', function() {
    console.log('Ticket queue script loaded');
    
    ticketContainer = document.querySelector('.tickets-queue') || 
                     document.querySelector('.queue-container') ||
                     document.querySelector('.ticket-list') ||
                     document.querySelector('.left-content') ||
                     document.querySelector('.sidebar-content');
    
    console.log('Tickets queue container found:', ticketContainer);
    
    if (!ticketContainer) {
        const leftSidebar = document.querySelector('.left-sidebar');
        console.log('Left sidebar found:', leftSidebar);
        if (leftSidebar) {
            ticketContainer = document.createElement('div');
            ticketContainer.className = 'tickets-queue';
            ticketContainer.style.cssText = 'flex: 1; overflow-y: auto; background: white; border: 1px solid #e1dfdd; border-radius: 4px; margin: 10px;';
            leftSidebar.appendChild(ticketContainer);
            console.log('Created new tickets container');
        }
    }
    
    loadTickets('all');
    
    const queueItems = document.querySelectorAll('.queue-item');
    console.log('Queue navigation items found:', queueItems.length);
    
    queueItems.forEach(function(item) {
        item.addEventListener('click', function() {
            console.log('Queue item clicked:', this.textContent);
            
            queueItems.forEach(function(q) {
                q.classList.remove('active');
            });
            this.classList.add('active');
            
            const filter = this.textContent.toLowerCase().replace(' tickets', '').replace(' ', '');
            console.log('Loading tickets with filter:', filter);
            
            loadTickets(filter);
        });
    });
    
    setupStatusChangeHandlers();
});

function setupStatusChangeHandlers() {
    const statusSelect = document.getElementById('status-select');
    const prioritySelect = document.getElementById('priority-select');
    const typeSelect = document.getElementById('type-select');
    
    if (statusSelect) {
        statusSelect.addEventListener('change', function() {
            if (currentTicketId) {
                updateTicketField('ticket_status', this.value);
            }
        });
    }
    
    if (prioritySelect) {
        prioritySelect.addEventListener('change', function() {
            if (currentTicketId) {
                updateTicketField('priority', this.value);
            }
        });
    }
    
    if (typeSelect) {
        typeSelect.addEventListener('change', function() {
            if (currentTicketId) {
                updateTicketField('ticket_type', this.value);
            }
        });
    }
}

function updateTicketField(fieldName, value) {
    if (!currentTicketId) {
        console.error('No ticket selected');
        return;
    }
    
    const updateData = {
        ticket_id: currentTicketId
    };
    updateData[fieldName] = value;
    
    fetch('update_ticket.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(updateData)
    })
    .then(response => response.json())
    .then(data => {
        console.log('Update result:', data);
        
        if (data.success) {
            refreshTickets();
            console.log('Ticket updated successfully');
        } else {
            alert('Error updating ticket: ' + data.error);
        }
    })
    .catch(error => {
        console.error('Error updating ticket:', error);
        alert('Failed to update ticket. Please try again.');
    });
}

function loadTickets(filter) {
    console.log('Loading tickets with filter:', filter);
    
    fetch('http://localhost/licenta/get_tickets.php?filter=' + filter)
    .then(function(response) {
        console.log('Response status:', response.status);
        return response.json();
    })
    .then(function(data) {
        console.log('Tickets loaded:', data);
        
        if (data.success) {
            displayTickets(data.tickets);
            updateTicketCounts(data.count, filter);
        } else {
            console.error('Error loading tickets:', data.error);
            alert('Error loading tickets: ' + data.error);
        }
    })
    .catch(function(error) {
        console.error('Error fetching tickets:', error);
        alert('Error fetching tickets: ' + error.message);
    });
}

function displayTickets(tickets) {
    console.log('Display tickets called, container:', ticketContainer);
    console.log('Number of tickets to display:', tickets.length);
    
    if (!ticketContainer) {
        console.error('No container available to display tickets');
        return;
    }
    
    ticketContainer.innerHTML = '';
    
    if (tickets.length === 0) {
        ticketContainer.innerHTML = '<div style="padding: 20px; text-align: center; color: #605e5c;">No tickets found</div>';
        return;
    }
    
    tickets.forEach(function(ticket) {
        console.log('Creating ticket item for:', ticket.ticket_id);
        
        const ticketDiv = document.createElement('div');
        ticketDiv.className = 'ticket-item';
        ticketDiv.style.cssText = 'padding: 12px; border-bottom: 1px solid #e1dfdd; cursor: pointer; background: white; transition: background 0.2s;';
        
        const priorityColor = getPriorityColor(ticket.priority);
        
        ticketDiv.innerHTML = '<div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 6px;">' +
            '<div style="font-weight: 600; font-size: 13px; color: #323130;">#' + ticket.ticket_id + '</div>' +
            '<div style="background: ' + priorityColor + '; color: white; padding: 2px 6px; border-radius: 3px; font-size: 10px; text-transform: uppercase;">' +
                ticket.priority +
            '</div>' +
        '</div>' +
        '<div style="font-size: 12px; color: #323130; margin-bottom: 4px; font-weight: 500;">' +
            (ticket.title || 'No Title') +
        '</div>' +
        '<div style="font-size: 11px; color: #605e5c; margin-bottom: 4px;">' +
            ticket.customer_firstname + ' ' + ticket.customer_lastname +
        '</div>' +
        '<div style="font-size: 10px; color: #605e5c;">' +
            'Status: ' + ticket.ticket_status + ' | Type: ' + ticket.ticket_type +
        '</div>';
        
        ticketDiv.addEventListener('mouseenter', function() {
            this.style.background = '#f3f2f1';
        });
        
        ticketDiv.addEventListener('mouseleave', function() {
            this.style.background = 'white';
        });
        
        ticketDiv.addEventListener('click', function() {
            document.querySelectorAll('.ticket-item').forEach(item => {
                item.classList.remove('active');
            });
            this.classList.add('active');
            currentTicketId = ticket.ticket_id;
            viewTicketDetails(ticket);
        });
        
        ticketContainer.appendChild(ticketDiv);
    });
    
    console.log('Tickets displayed in container');
}

function getPriorityColor(priority) {
    if (!priority) return '#605e5c';
    
    switch (priority.toLowerCase()) {
        case 'high': return '#d13438';
        case 'medium': return '#ff8c00';
        case 'low': return '#107c10';
        default: return '#605e5c';
    }
}

function updateTicketCounts(count, filter) {
    console.log(filter + ' tickets: ' + count);
}

function formatDateTime(dateString) {
    if (!dateString) return 'Unknown';
    
    try {
        const date = new Date(dateString);
        const options = {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit',
            hour12: true
        };
        return date.toLocaleDateString('en-US', options);
    } catch (error) {
        console.error('Error formatting date:', error);
        return dateString;
    }
}

function viewTicketDetails(ticket) {
    console.log('Viewing ticket:', ticket);
    const ticketInfoItems = document.querySelectorAll('.ticket-info-grid .info-item');
    if (ticketInfoItems.length >= 6) {
        const typeSpan = ticketInfoItems[0].querySelector('.info-value span');
        if (typeSpan) {
            typeSpan.textContent = ticket.ticket_type || 'failure';
            typeSpan.className = `ticket-priority type-${ticket.ticket_type || 'failure'}`;
        }
        ticketInfoItems[1].querySelector('.info-value').textContent = `#${ticket.ticket_id}`;
        const statusSpan = ticketInfoItems[2].querySelector('.info-value span');
        if (statusSpan) {
            statusSpan.textContent = ticket.ticket_status || 'open';
            statusSpan.className = `status-badge status-${ticket.ticket_status || 'open'}`;
        }
        const prioritySpan = ticketInfoItems[3].querySelector('.info-value span');
        if (prioritySpan) {
            prioritySpan.textContent = ticket.priority || 'medium';
            prioritySpan.className = `ticket-priority priority-${ticket.priority || 'medium'}`;
        }
        ticketInfoItems[4].querySelector('.info-value').textContent = formatDateTime(ticket.created);
        ticketInfoItems[5].querySelector('.info-value').textContent = ticket.agent_name || 'Unassigned';
    }
    
    const summaryField = document.getElementById('summary');
    const scriptField = document.querySelector('.ticket-description');
    
    if (summaryField) {
        summaryField.value = ticket.title || '';
    }
    
    if (scriptField) {
        scriptField.value = ticket.script || '';
    }
    
    const customerFields = {
        'firstName': ticket.customer_firstname || '',
        'lastName': ticket.customer_lastname || '',
        'email': ticket.customer_email || '',
        'phone': ticket.customer_phone || '',
        'mobile': ticket.customer_mobile || ''
    };
    
    Object.keys(customerFields).forEach(fieldId => {
        const field = document.getElementById(fieldId);
        if (field) {
            field.value = customerFields[fieldId];
        }
    });
    
    const statusSelect = document.getElementById('status-select');
    const prioritySelect = document.getElementById('priority-select');
    const typeSelect = document.getElementById('type-select');
    
    if (statusSelect) statusSelect.value = ticket.ticket_status || 'open';
    if (prioritySelect) prioritySelect.value = ticket.priority || 'medium';
    if (typeSelect) typeSelect.value = ticket.ticket_type || 'failure';
}

function refreshTickets() {
    console.log('Refresh tickets called');
    const activeFilter = document.querySelector('.queue-item.active');
    if (activeFilter) {
        const filter = activeFilter.textContent.toLowerCase().replace(' tickets', '').replace(' ', '');
        loadTickets(filter);
    } else {
        loadTickets('all');
    }
}