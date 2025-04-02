$(document).ready(() => {
  let page = 0;
  loadProduct(page);
  $("#btn_view_more").click(() => {
    page++;
    loadProduct(page);
  })
  function loadProduct(pageNumber) {
    $.ajax({
      method: "GET",
      url: `http://localhost:8080/product?pageNumber=${pageNumber}&pageSize=10`,
    })
      .done((result) => { // trả kết quả của đường dẫn này
        console.log("Data Saved: ", result.data);
        for(let i = 0; i < result.data.length;i++ ){
          const item = result.data[i]
          const html = `
          <div class="col-md-6 col-lg-3 my-4">
              <div class="product-item">
                <div class="image-holder" style="width: 100%; height: 100%;">
                  <img src="${item.urlImage}" alt="Books" class="product-image img-fluid">
                </div>
                <div class="cart-concern">
                  <div class="cart-button d-flex justify-content-between align-items-center">
                    <a href="#" class="btn-wrap cart-link d-flex align-items-center text-capitalize fs-6 ">add to cart <i
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