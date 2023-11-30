import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  static targets = ['myChart'];

  canvasContext() {
    return this.myChartTarget.getContext('2d');
  }

  connect() {
    // console.log(this.myChartTarget.dataset.prices)
    // console.log(this.myChartTarget.dataset.purchasedPrice)

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
          label: 'Purchased History',
          data: JSON.parse(this.myChartTarget.dataset.purchasedPrice),
          borderColor: 'transparent',
          borderWidth: 3,
          pointStyle: 'rectRot',
          pointRadius: 10,
          pointBorderColor: 'rgb(0, 0, 0)'
        }
      ]
      },
      options: {
        pointBackgroundColor: ["Red"],
        scales: {
          y: {
            beginAtZero: true,
            title: {
              display: true,
              text: 'Price'
            }
          },
          x: {
            title: {
              display: true,
              text: 'Day'
            },
            grid: {
              display: false
            }
          }
        }
      }
    });
  }
}
