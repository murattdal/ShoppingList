

$(document).ready(function () {


    document.getElementById("searchInput").addEventListener("input", function () {
        var input, filter, table, tr, td, i, txtValue;
        input = this;
        filter = input.value.toUpperCase();
        table = document.querySelector("table");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2]; // Ürün Adý sütunu
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    });

    $("#selectedFiltering").change(function () {

        var selectedCategory = $(this).val();

        var filter, table, tr, td, i, txtValue;
        
        filter = selectedCategory.toUpperCase();;
        table = document.querySelector("table");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[3]; // Ürün Adý sütunu
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    });

    // Clear button click event
    $("#clearFilter").click(function () {
        // Reset the selected value
        $("#selectedFiltering").val("");

        // Show all table rows
        $("table tr").show();
    });

    $("#selectedCategory").change(function () {
        var selectedCategory = $(this).val();
        var productDropdown = $("#selectedProduct");

        // Burada AJAX ile veriyi çekme iþlemini yapabilirsiniz
        $.get("/Product/GetProductsByCategory", { category: selectedCategory }, function (data) {
            productDropdown.empty();

            $.each(data, function (index, product) {
                productDropdown.append("<option value='" + product.imageName + "'>" + product.imageName + "</option>");
            });

        });
    });
});

