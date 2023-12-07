import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  static targets = ["myChart"];

  canvasContext() {
    return this.myChartTarget.getContext("2d");
  }

  connect() {
    // console.log(this.myChartTarget.dataset.purchasedHistories);

    const purchasedPricesArray = JSON.parse(
      this.myChartTarget.dataset.purchasedHistories
    );
    // console.log(purchasedPricesArray);

    const purchasedPricesData = [
      {
        label: "Price per day",
        data: JSON.parse(this.myChartTarget.dataset.prices),
        backgroundColor: "rgba(255, 99, 132, 0.2)",
        borderColor: "#98F899",
        borderWidth: 3,
      },
    ];

    purchasedPricesArray.forEach((purchase) => {
      // console.log(purchase);

      const purchasedRecord = {
        label: "Purchases",
        data: purchase,
        borderColor: "transparent",
        borderWidth: 3,
        pointStyle: "rectRot",
        pointRadius: 10,
        pointBorderColor: "rgb(0, 0, 0)",
      };

      purchasedPricesData.push(purchasedRecord);
    });

    // console.log(purchasedPricesData);

    new Chart(this.canvasContext(), {
      type: "line",
      data: {
        labels: JSON.parse(this.myChartTarget.dataset.labels),
        datasets: purchasedPricesData,
      },
      options: {
        pointBackgroundColor: ["Orange"],
        scales: {
          y: {
            beginAtZero: true,
            title: {
              display: true,
              text: "Price",
              color: "white",
            },
            ticks: {
              color: "white",
            },
          },
          x: {
            title: {
              display: true,
              text: "Date",
              color: "white",
            },
            grid: {
              display: false,
            },
            ticks: {
              color: "white",
            },
          },
        },
      },
    });
  }
}
