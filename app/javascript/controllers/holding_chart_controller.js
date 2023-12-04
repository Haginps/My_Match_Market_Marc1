import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  static targets = ['myChart'];

  canvasContext() {
    return this.myChartTarget.getContext('2d');
  }

  connect() {
    const holdingChart = new Chart(this.canvasContext(), {
      type: 'line',
      data: {
        labels: JSON.parse(this.myChartTarget.dataset.labels),
        datasets: [{
          label: 'Purchased History',
          data: JSON.parse(this.myChartTarget.dataset.performance),
          borderColor: '#98F899',
          borderWidth: 1,
          pointStyle: 'rectRot',
          pointRadius: 8,
          pointBorderColor: 'rgb(0, 0, 0)'
        }]
      },
      options: {
        pointBackgroundColor: ["Orange"],
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
