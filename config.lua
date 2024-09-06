FiveEngine = {}

FiveEngine.ItemAlma = {
    coords = vector3(2420.29, 3967.8, 36.55),
    radius = 4.0,
    item = 'kokain', -- Verilecek item
    amount = 1 -- Verilecek item miktarı
}

FiveEngine.ItemSatma = {
    coords = vector3(2435.42, 3953.69, 36.13),
    radius = 4.0,
    item = 'afyonislenmis',
    price = 100, -- Satış fiyatı
    paraturu = "markedbills" -- Ödül türü: "cash" veya "markedbills" veyada "bank"
}

FiveEngine.ItemIsleme = {
    coords = vector3(2441.07, 3988.57, 36.92),
    radius = 4.0,
    requiredItem = 'kokain', -- İşlenecek item
    processedItem = 'afyonislenmis', -- İşleme sonucu alınacak item
}

FiveEngine.ToplamaProgresBarSaniye = '3000' --MİLİSANİYE
FiveEngine.SatmaProGBar = '3000'
FiveEngine.IslemeProGBar = '3000'
FiveEngine.maxDistance = 15.0 
FiveEngine.minDistance = 15.0

