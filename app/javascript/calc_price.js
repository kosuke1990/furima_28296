window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  itemPrice.addEventListener('keyup', function(){
    value = this.value
    addTaxPrice.innerHTML = value * 0.1
    profit.innerHTML = value * (1-0.1)
    })
})
