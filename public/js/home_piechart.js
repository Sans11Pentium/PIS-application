const data = {
    labels: ['Male', 'Female'],
    datasets: [{
        label: 'Gender Distribution',
        data: [300, 50],  // Example data: 60% male, 40% female
        backgroundColor: ['#36A2EB', '#FF6384'],  // Colors for each segment
        hoverOffset: 4,
    }]
};

// Config for the pie chart
const config = {
    type: 'pie',
    data: data,
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'top',
            },
            tooltip: {
                callbacks: {
                    label: function(context) {
                        let label = context.label || '';
                        if (label) {
                            label += ': ';
                        }
                        label += context.raw;
                        return label;
                    }
                }
            }
        }
    }
};

// Render the pie chart
window.onload = function() {
    const ctx = document.getElementById('genderChart').getContext('2d');
    new Chart(ctx, config);
};