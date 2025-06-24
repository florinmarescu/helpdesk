const phoneField = document.getElementById('phone');
const mobileField = document.getElementById('mobile');

function lookupCustomer(searchNumber, fieldType) {
    console.log('Looking up customer by phone/mobile:', searchNumber, 'from field:', fieldType);
    
    fetch(`get_customer.php?phone=${encodeURIComponent(searchNumber)}`)
    .then(response => response.json())
    .then(data => {
        console.log('Customer lookup result:', data);
        
        if (data.success && data.customer) {
            document.getElementById('firstName').value = data.customer.firstname;
            document.getElementById('lastName').value = data.customer.lastname;
            document.getElementById('email').value = data.customer.email;
            
            document.getElementById('phone').value = data.customer.phone || '';
            document.getElementById('mobile').value = data.customer.mobile || '';
            
            console.log('Customer data filled in successfully');
            console.log('Phone set to:', data.customer.phone);
            console.log('Mobile set to:', data.customer.mobile);
        } else {
            console.log('Customer not found:', data.error);
            document.getElementById('firstName').value = '';
            document.getElementById('lastName').value = '';
            document.getElementById('email').value = '';
            
            if (fieldType === 'phone') {
                document.getElementById('mobile').value = '';
            } else {
                document.getElementById('phone').value = '';
            }
        }
    })
    .catch(error => {
        console.error('Error looking up customer:', error);
    });
}

if (phoneField) {
    phoneField.addEventListener('blur', function() {
        const phone = this.value.trim();
        if (phone) {
            lookupCustomer(phone, 'phone');
        }
    });
}

if (mobileField) {
    mobileField.addEventListener('blur', function() {
        const mobile = this.value.trim();
        if (mobile) {
            lookupCustomer(mobile, 'mobile');
        }
    });
}