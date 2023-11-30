import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buying-investment"
export default class extends Controller {
  static targets = ['btn', 'buyPrice']

  connect() {
    console.log('I am connected')
    console.log(this.buyPriceTarget)
    console.log(this.btnTarget)
  }

  activeButton() {
    const buyPrice = parseInt(this.buyPriceTarget.value, 10)
    console.log(buyPrice)

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
}
