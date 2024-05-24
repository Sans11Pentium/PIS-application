// // // Sample data
// // const x = ['DRDS', 'DRTC', 'Admin/Allied Officer', 'Admin/Allied staff', 'Others','Ex-Employees','Organisational flow']; // Labels for the x-axis (Employee names)
// // const h = [10, 20, 30, 40, 50,60,70]; // Heights of the bars (Number of Employees)

// // // Get the context of the canvas element we want to select
// // const ctx = document.getElementById('myChart').getContext('2d');

// // // Create the bar chart
// // const myChart = new Chart(ctx, {
// //     type: 'bar',
// //     data: {
// //         labels: x, // Use the x array for labels on the x-axis
// //         datasets: [{
// //             label: 'Height',
// //             data: h, // Use the h array for the height of the bars
// //             backgroundColor: 'rgba(75, 192, 192, 0.2)',
// //             borderColor: 'rgba(75, 192, 192, 1)',
// //             borderWidth: 1
// //         }]
// //     },
// //     options: {
// //         scales: {
// //             y: {
// //                 beginAtZero: true,
// //                 title: {
// //                     display: true,
// //                     text: 'Number of Employees' // Label for the y-axis
// //                 }
// //             },
// //             x: {
// //                 title: {
// //                     display: true,
// //                     text: 'Employee' // Label for the x-axis
// //                 },
// //                 ticks: {
// //                     maxRotation: 45, // Rotate labels to 45 degrees
// //                     minRotation: 45 // Rotate labels to 45 degrees
// //                 }
// //             }
// //         }
// //     }
// // });



// const chartData = {
//     home: {
//         labels: ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
//         data: [0, 0, 0, 0, 0, 0, 0] // Placeholder data
//     },
//     drds: {
//         labels: ['W', 'X', 'Y', 'Z', 'U', 'V', 'W'],
//         data: [0, 0, 0, 0, 0, 0, 0]
//     },
//     drtc: {
//         labels: ['L', 'M', 'N', 'O', 'P', 'Q', 'R'],
//         data: [0, 0, 0, 0, 0, 0, 0]
//     },
//     admin_officer: {
//         labels: ['D1', 'D2', 'D3', 'D4', 'D5', 'D6', 'D7'],
//         data: [0, 0, 0, 0, 0, 0, 0]
//     },
//     admin_staff: {
//         labels: ['A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7'],
//         data: [0, 0, 0, 0, 0, 0, 0]
//     },
//     others: {
//         labels: ['B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7'],
//         data: [0, 0, 0, 0, 0, 0, 0]
//     },
//     ex_employees: {
//         labels: ['C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7'],
//         data: [0, 0, 0, 0, 0, 0, 0]
//     },
//     org_flow: {
//         labels: ['E1', 'E2', 'E3', 'E4', 'E5', 'E6', 'E7'],
//         data: [0, 0, 0, 0, 0, 0, 0]
//     }
// };

// // Function to create a new chart
// function createChart(labels, data) {
//     // Destroy existing chart if it exists
//     if (window.myChart) {
//         window.myChart.destroy();
//     }
//     const ctx = document.getElementById('myChart').getContext('2d');
//     window.myChart = new Chart(ctx, {
//         type: 'bar',
//         data: {
//             labels: labels, // Use the provided labels array for the x-axis
//             datasets: [{
//                 label: 'Number of Employees',
//                 data: data, // Use the provided data array for the height of the bars
//                 backgroundColor: 'rgba(75, 192, 192, 0.2)',
//                 borderColor: 'rgba(75, 192, 192, 1)',
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true,
//                     title: {
//                         display: true,
//                         text: 'Number of Employees' // Label for the y-axis
//                     }
//                 },
//                 x: {
//                     title: {
//                         display: true,
//                         text: 'Category' // Label for the x-axis
//                     },
//                     ticks: {
//                         maxRotation: 45, // Rotate labels to 45 degrees
//                         minRotation: 45 // Rotate labels to 45 degrees
//                     }
//                 }
//             }
//         }
//     });
// }

// // Function to fetch data from the server
// function fetchData(chartType) {
//     fetch(`/chart-data/${chartType}`)
//         .then(response => response.json())
//         .then(data => {
//             const labels = chartData[chartType].labels;
//             const dataArray = data.map(item => item.count);
//             createChart(labels, dataArray);
//         })
//         .catch(error => console.error('Error fetching data:', error));
// }

// // Event listener for the list items
// document.querySelectorAll('.chart-item').forEach(item => {
//     item.addEventListener('click', (event) => {
//         const itemId = event.target.id;
//         if (chartData[itemId]) {
//             fetchData(itemId);
//         }
//     });
// });

// // Initialize with the default chart
// fetchData('home');


// Predefined data for each department
const chartData = {
    home: { labels: ['DRDS', 'DRTC', 'Admin/Allied Officer', 'Admin/Allied staff', 'Others','Ex-Employees','Organisational flow'], data: [10, 15, 20, 25, 30, 35, 40] },
    drds: { labels: ['W', 'X', 'Y', 'Z', 'U', 'V', 'W'], data: [5, 10, 15, 20, 25, 30, 35] },
    drtc: { labels: ['L', 'M', 'N', 'O', 'P', 'Q', 'R'], data: [7, 14, 21, 28, 35, 42, 49] },
    admin_officer: { labels: ['D1', 'D2', 'D3', 'D4', 'D5', 'D6', 'D7'], data: [6, 12, 18, 24, 30, 36, 42] },
    admin_staff: { labels: ['A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7'], data: [8, 16, 24, 32, 40, 48, 56] },
    others: { labels: ['B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7'], data: [9, 18, 27, 36, 45, 54, 63] },
    ex_employees: { labels: ['C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7'], data: [10, 20, 30, 40, 50, 60, 70] },
    org_flow: { labels: ['E1', 'E2', 'E3', 'E4', 'E5', 'E6', 'E7'], data: [11, 22, 33, 44, 55, 66, 77] }
};

// Variable to store the chart instance
let myChart;

// Function to create or update the chart
function createChart(labels, data) {
    // Destroy existing chart if it exists
    if (myChart) {
        myChart.destroy();
    }
    const ctx = document.getElementById('myChart').getContext('2d');
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels, // Use the provided labels array for the x-axis
            datasets: [{
                label: 'Number of Employees',
                data: data, // Use the provided data array for the height of the bars
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Number of Employees' // Label for the y-axis
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Category' // Label for the x-axis
                    },
                    ticks: {
                        maxRotation: 45, // Rotate labels to 45 degrees
                        minRotation: 45 // Rotate labels to 45 degrees
                    }
                }
            }
        }
    });
}
let hasColor = 'home';
// Event listener for the list items
function addEventListeners() {
    document.querySelectorAll('.chart-item').forEach(item => {
        item.addEventListener('click', (event) => {
            let ele=document.querySelector(`#${hasColor}`);
            ele.style.backgroundColor='transparent';
            ele.style.color='white';
            const itemId = event.target.id;
            event.target.style.backgroundColor='rgba(255, 255, 0, 0.749)';
            hasColor=itemId;
            console.log('Clicked item ID:', event.target.style.backgroundColor); // Debug log
            if (chartData[itemId]) {
                const { labels, data } = chartData[itemId];
                createChart(labels, data);
            }
        });
    });
}

// Add event listeners when the DOM is fully loaded
document.addEventListener('DOMContentLoaded', () => {
    addEventListeners();
    console.log('Event listeners added'); // Debug log

    // Initialize with the default chart
    const { labels, data } = chartData['home'];
    createChart(labels, data);
});