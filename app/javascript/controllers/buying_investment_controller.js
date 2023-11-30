import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buying-investment"
export default class extends Controller {
  static targets = ['btn', 'buyPrice', 'sellPrice', 'btnSell']

  connect() {
    console.log('I am connected')
    // console.log(this.buyPriceTarget)
    // console.log(this.sellPriceTarget)
    // console.log(this.btnTarget)
  }

  activeButton() {
    const buyPrice = parseInt(this.buyPriceTarget.value, 10)
    // console.log(buyPrice)

    if (buyPrice > 0) {
      this.btnTarget.disabled = false
      this.btnTarget.classList.remove("btn-buy-disabled")
      this.btnTarget.classList.add("btn-buy")
    } else {
      this.buyPriceTarget.value = 0
      this.btnTarget.disabled = true
      this.btnTarget.classList.add("btn-buy-disabled")
      this.btnTarget.classList.remove("btn-buy")
    }
  }

  activeSellButton() {
    const sellPrice = parseInt(this.sellPriceTarget.value, 10)
    // console.log(sellPrice)

    const sharesAmount = parseInt(this.element.dataset.sharesAmount, 10)
    console.log(sharesAmount)

    if (sellPrice < 0 || sellPrice > sharesAmount) {
      this.sellPriceTarget.value = 0
      this.btnSellTarget.disabled = true
      this.btnSellTarget.classList.add("btn-sell-disabled")
      this.btnSellTarget.classList.remove("btn-sell")
    } else {
      this.btnSellTarget.disabled = false
      this.btnSellTarget.classList.remove("btn-sell-disabled")
      this.btnSellTarget.classList.add("btn-sell")
    }
  }
}
