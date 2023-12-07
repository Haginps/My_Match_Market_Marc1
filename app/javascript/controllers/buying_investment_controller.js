import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buying-investment"
export default class extends Controller {
  static targets = ['btn', 'buyPrice', 'sellPrice', 'btnSell', 'totalAmount']

  connect() {
    console.log('I am connected')
    // console.log(this.buyPriceTarget)
    // console.log(this.sellPriceTarget)
    // console.log(this.btnTarget)
    // console.log(this.totalAmountTarget)
    // console.log(this.element.dataset.investmentPrice)
    // console.log(this.element.dataset.userTokens)
  }

  activeButton() {
    const buyPrice = parseInt(this.buyPriceTarget.value, 10)
    // console.log(buyPrice)
    const investmentPrice = Number(this.element.dataset.investmentPrice)
    const userTokens = Number(this.element.dataset.userTokens)
    const totalAmount = Number((buyPrice.toFixed(2) * investmentPrice.toFixed(2)).toFixed(2))
    const maxBuyShares = Math.floor(userTokens / investmentPrice)

    console.log(maxBuyShares)

    if (userTokens <= investmentPrice || buyPrice <= 0) {
      this.buyPriceTarget.value = ''
      this.btnTarget.disabled = true
      this.btnTarget.classList.add("btn-buy-disabled")
      this.btnTarget.classList.remove("btn-buy")
      this.totalAmountTarget.innerHTML = `Total Amount:`
    } else if (userTokens <= totalAmount) {
      this.buyPriceTarget.value = maxBuyShares
      this.btnTarget.disabled = false
      this.btnTarget.classList.remove("btn-buy-disabled")
      this.btnTarget.classList.add("btn-buy")
      this.totalAmountTarget.innerHTML = `Total Amount: £${(maxBuyShares * investmentPrice)}`
    } else {
      this.btnTarget.disabled = false
      this.btnTarget.classList.remove("btn-buy-disabled")
      this.btnTarget.classList.add("btn-buy")
      this.totalAmountTarget.innerHTML = `Total Amount: £${(totalAmount)}`
    }
  }

  activeSellButton() {
    const sellPrice = parseInt(this.sellPriceTarget.value, 10)
    // console.log(sellPrice)
    const investmentPrice = Number(this.element.dataset.investmentPrice)
    const userTokens = Number(this.element.dataset.userTokens)
    const totalAmount = (sellPrice.toFixed(2) * investmentPrice.toFixed(2)).toFixed(2)

    const sharesAmount = parseInt(this.element.dataset.sharesAmount, 10)
    console.log(sharesAmount)

    if (sellPrice <= 0) {
      this.sellPriceTarget.value = ''
      this.btnSellTarget.disabled = true
      this.btnSellTarget.classList.add("btn-sell-disabled")
      this.btnSellTarget.classList.remove("btn-sell")
      this.totalAmountTarget.innerHTML = `Total Amount:`
    } else if (sellPrice >= sharesAmount) {
      this.sellPriceTarget.value = sharesAmount
      this.btnSellTarget.disabled = false
      this.btnSellTarget.classList.remove("btn-sell-disabled")
      this.btnSellTarget.classList.add("btn-sell")
      this.totalAmountTarget.innerHTML = `Total Amount: £${(sharesAmount * investmentPrice)}`
    } else {
      this.btnSellTarget.disabled = false
      this.btnSellTarget.classList.remove("btn-sell-disabled")
      this.btnSellTarget.classList.add("btn-sell")
      this.totalAmountTarget.innerHTML = `Total Amount: £${(totalAmount)}`
    }
  }
}
