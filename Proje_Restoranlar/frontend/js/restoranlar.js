document.addEventListener("DOMContentLoaded", () => {

    const restaurantList =
        document.getElementById("restaurantList") ||
        document.getElementById("restoranListesi");

    const searchForm =
        document.getElementById("searchForm") ||
        document.getElementById("searchFrom") ||
        document.getElementById("searcFrom");

    const cityInput = document.getElementById("sehir");
    const categoryInput = document.getElementById("kategori");

    function fetchRestaurants(city, category) {
        if (!restaurantList) {
            console.error("Restaurant list elementi bulunamadı.");
            return;
        }

        fetch(`http://127.0.0.1:5000/restoran-liste?sehir=${encodeURIComponent(city)}&kategori=${encodeURIComponent(category)}`)
            .then(res => res.json())
            .then(data => {
                restaurantList.innerHTML = "";

                if (!Array.isArray(data) || data.length === 0) {
                    restaurantList.innerHTML =
                        "<p>Bu şehir ve kategori için restoran bulunamadı.</p>";
                    return;
                }

                data.forEach(restoran => {
                    const card = document.createElement("div");
                    card.className = "restaurant-card";
                    card.dataset.restoranId = restoran.restoran_id;

                    const ort = restoran.ortalama_puan
                        ? Number(restoran.ortalama_puan).toFixed(2)
                        : "0.00";

                    card.innerHTML = `
                        <h3>${restoran.restoran_ad}</h3>
                        <p>${restoran.adres}</p>
                        <p>Ortalama Puan: <span class="average-rating">${ort}</span></p>

                        <div class="rating-buttons" style="display:none;">
                            <button data-rating="1">1</button>
                            <button data-rating="2">2</button>
                            <button data-rating="3">3</button>
                            <button data-rating="4">4</button>
                            <button data-rating="5">5</button>
                        </div>

                        <button class="show-rating-btn">Puan Ver</button>
                    `;

                    restaurantList.appendChild(card);

                    const showBtn = card.querySelector(".show-rating-btn");
                    const ratingDiv = card.querySelector(".rating-buttons");

                    showBtn.onclick = () => {
                        ratingDiv.style.display =
                            ratingDiv.style.display === "none" ? "flex" : "none";
                    };

                    ratingDiv.querySelectorAll("button").forEach(btn => {
                        btn.onclick = () => {
                            const rating = Number(btn.dataset.rating);

                            fetch("http://127.0.0.1:5000/puan-ekle", {
                                method: "POST",
                                headers: { "Content-Type": "application/json" },
                                body: JSON.stringify({
                                    restoran_id: Number(card.dataset.restoranId),
                                    kullanici_id: 1,
                                    puan: rating
                                })
                            })
                            .then(res => res.json())
                            .then(data => {
                                if (data.ortalama_puan !== undefined) {
                                    const avgSpan = card.querySelector(".average-rating");
                                    avgSpan.textContent =
                                        Number(data.ortalama_puan).toFixed(2);
                                }

                                alert("Puan verildi!");
                                ratingDiv.style.display = "none";
                            })
                            .catch(err => {
                                console.error(err);
                                alert("Sunucu hatası oluştu.");
                            });
                        };
                    });
                });
            })
            .catch(err => {
                console.error(err);
                restaurantList.innerHTML =
                    "<p>Restoranlar yüklenirken bir hata oluştu.</p>";
            });
    }

    if (searchForm) {
        searchForm.onsubmit = (e) => {
            e.preventDefault();

            const city = cityInput?.value.trim();
            const category = categoryInput?.value.trim();

            if (city && category) {
                localStorage.setItem("city", city);
                localStorage.setItem("category", category);

                fetchRestaurants(city, category);

                history.replaceState(
                    null,
                    "",
                    `/restoranlar?sehir=${encodeURIComponent(city)}&kategori=${encodeURIComponent(category)}`
                );
            }
        };
    }

    const urlParams = new URLSearchParams(window.location.search);
    const city = urlParams.get("sehir") || localStorage.getItem("city");
    const category = urlParams.get("kategori") || localStorage.getItem("category");

    if (city && category) {
        fetchRestaurants(city, category);
    }
});
