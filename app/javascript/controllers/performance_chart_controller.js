import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  static targets = ['myChart'];

  canvasContext() {
    return this.myChartTarget.getContext('2d');
  }

  connect() {

    const priceChart = new Chart(this.canvasContext(), {
      type: 'line',
      data: {
        labels: JSON.parse(this.myChartTarget.dataset.labels),
        datasets: [{
          label: 'Price per day',
          data: JSON.parse(this.myChartTarget.dataset.prices),
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          borderColor: '#98F899',
          borderWidth: 3,
        },
        {
          label: 'Purchases',
          data: JSON.parse(this.myChartTarget.dataset.purchasedPrice),
          borderColor: 'transparent',
          borderWidth: 3,
          pointStyle: 'rectRot',
          pointRadius: 10,
          pointBorderColor: 'rgb(0, 0, 0)',
        }
      ]
      },
      options: {
        pointBackgroundColor: ["Orange"],
        scales: {
          y: {
            beginAtZero: true,
            title: {
              display: true,
              text: 'Price',
              color: 'white'
            },
            ticks: {
              color: 'white'
            }
          },
          x: {
            title: {
              display: true,
              text: 'Day',
              color: 'white'
            },
            grid: {
              display: false
            },
            ticks: {
              color: 'white'
            }
          }
        }
      }
    });
  }
}
