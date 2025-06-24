const searchField = document.querySelector('.search-field');
if (searchField) {
    searchField.addEventListener('input', function() {
        const searchValue = this.value;
        console.log('Searching solutions:', searchValue);
        
        fetch(`search_solutions.php?query=${encodeURIComponent(searchValue)}`)
        .then(response => response.json())
        .then(solutions => {
            console.log('Solution results:', solutions);
            
            const container = document.querySelector('.solution-articles');
            container.innerHTML = '';
            
            solutions.forEach(solution => {
                const div = document.createElement('div');
                div.className = 'solution-item';
                div.style.cssText = `
                    padding: 12px;
                    border: 1px solid #e1dfdd;
                    border-radius: 4px;
                    margin-bottom: 8px;
                    cursor: pointer;
                    background: white;
                    transition: background 0.2s;
                `;
                
                div.innerHTML = `
                    <div style="font-weight: 600; font-size: 13px; color: #323130; margin-bottom: 4px;">
                        ${solution.title}
                    </div>
                    <div style="font-size: 11px; color: #605e5c;">
                        Keywords: ${solution.keywords}
                    </div>
                `;

                div.addEventListener('mouseenter', function() {
                    this.style.background = '#f3f2f1';
                });

                div.addEventListener('mouseleave', function() {
                    this.style.background = 'white';
                });

                div.addEventListener('click', function() {
                    window.open(`view_solution.php?id=${solution.id}`, '_blank');
                });
                
                container.appendChild(div);
            });

            if (solutions.length === 0) {
                container.innerHTML = '<div style="padding: 12px; color: #605e5c; text-align: center;">No solutions found</div>';
            }
        })
        .catch(error => {
            console.error('Error searching solutions:', error);
        });
    });
    searchField.dispatchEvent(new Event('input'));
}
