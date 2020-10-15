function keisan() {
  const price_form = document.getElementById("item-price");
  price_form.addEventListener("input", () => {
    const price = document.getElementById("item-price").value;

    tax_value = Math.floor(price/10);
    profit_value = Math.floor(price - tax_value);

    document.getElementById("add-tax-price").innerHTML = tax_value;
    document.getElementById("profit").innerHTML = profit_value;
  });
};


window.addEventListener("load", keisan);