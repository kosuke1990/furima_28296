window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  itemPrice.addEventListener('keyup', function(){
    value = this.value
    addTaxPrice.innerHTML = Math.floor(value * 0.1)
    profit.innerHTML = value - Math.floor(value * 0.1)
    })
})
