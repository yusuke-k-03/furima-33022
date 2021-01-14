window.addEventListener('load', function(){

  const InputPrice = document.getElementById("item-price")
  
  if (!InputPrice){
    return false;
  }

  InputPrice.addEventListener('input', function(){
    const inputValue = InputPrice.value;
    
    const addTax = document.getElementById("add-tax-price")
    addTax.innerHTML = Math.floor( inputValue / 10 )
   
    
    
    const Profit = document.getElementById("profit")
    Profit.innerHTML = Math.floor( inputValue * 0.9 )
 })
 
})