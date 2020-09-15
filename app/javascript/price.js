
function str (){
  const fee = document.getElementById('add-tax-price')
  const price_field = document.getElementById('item-price')
  const gain_field = document.getElementById('profit')


  price_field.addEventListener('input', function(){
    const price = document.getElementById("item-price").value
    const tax = price*0.1
    fee.innerHTML = tax

    const gain = price - tax
    gain_field.innerHTML = gain
  })
}

window.addEventListener('load', str)
