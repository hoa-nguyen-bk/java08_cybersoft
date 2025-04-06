$(document).ready(() => {
  let page = 0;
  loadProduct(page);
  $("#btn_view_more").click(() => {
    page++;
    loadProduct(page);
  })
  // $(".btn_cart").click(() => {
  //   alert("aa");
  // }) chạy ko được nó chỉ dựa vào lần render đầu
  $("#home_product").on('click', '.btn_cart', function () {
    // this đại diện cho class chứa btn_cart
    const stringData = $(this).attr('data-product');
    const jsonData = JSON.parse(stringData);
    jsonData.quantity = 1;
    let jsonArray = []
    const cart = localStorage.getItem('cart');
    let finded = 0;
    if (cart) {
      const stringListCartSaved = cart;
      jsonArray = JSON.parse(stringListCartSaved);
      for (let i = 0; i < jsonArray.length; i++) {
        if (jsonArray[i].id === jsonData.id) {
          jsonArray[i].quantity += 1;
          finded = 1;
        }
      }
    }
    if (finded === 0) {
      jsonArray.push(jsonData)
    }
    const stringListCart = JSON.stringify(jsonArray);
    localStorage.setItem("cart", stringListCart)
  })
  // này chỉ đc đk 1 lần duy nhất, đây là khái niệm rerender, cho nên nó ko nghe sự kiện click của button cart
  function loadProduct(pageNumber) {
    $.ajax({
      method: "GET",
      url: `http://localhost:8080/product?pageNumber=${pageNumber}&pageSize=10`,
    })
      .done((result) => { // trả kết quả của đường dẫn này
        console.log("Data Saved: ", result.data);
        for (let i = 0; i < result.data.length; i++) {
          const item = result.data[i]
          const dataJson = JSON.stringify(item)
          const html = `
          <div class="col-md-6 col-lg-3 my-4">
              <div class="product-item">
                <div class="image-holder" style="width: 100%; height: 100%;">
                  <img src="${item.urlImage}" alt="Books" class=" product-image img-fluid">
                </div>
                <div class="cart-concern">
                  <div class="cart-button d-flex justify-content-between align-items-center">
                    <a data-product='${dataJson}'  class=" btn-wrap cart-link d-flex align-items-center text-capitalize fs-6 btn_cart">add to cart <i
                        class="icon icon-arrow-io pe-1"></i>
                    </a>
                    <a href="single-product.html" class="view-btn">
                      <i class="icon icon-screen-full"></i>
                    </a>
                    <a href="#" class="wishlist-btn">
                      <i class="icon icon-heart"></i>
                    </a>
                  </div>
                </div>
                <div class="product-detail d-flex justify-content-between align-items-center mt-4">
                  <h4 class="product-title mb-0">
                    <a href="single-product.html">${item.name}</a>
                  </h4>
                  <p class="m-0 fs-5 fw-normal">$${item.price}</p>
                </div>
              </div>
            </div>
             `;
          $("#home_product").append(html)
        }
      });
  }


})
