Category.create! name: "Do an",
  description: "Tap hop Do an.",
  parent_id: nil

Category.create! name: "Do uong",
  description: "Tap hop Do uong.",
  parent_id: nil

Category.create! name: "Hai San",
  description: "Cac mon an ve tom, cua, ca..",
  parent_id: 1

Category.create! name: "An vat",
  description: "Cac mon an nhanh, fastfood.vv..",
  parent_id: 1

Category.create! name: "Bun",
  description: "Tong hop cac mon bun.",
  parent_id: 1

Category.create! name: "Tra sua",
  description: "Tong hop cac loai tra sua.",
  parent_id: 2

Category.create! name: "Kem",
  description: "Tong hop cac loai kem.",
  parent_id: 2

Product.create! name: "Cua hap bia",
  description: "Cua hap bia la mot trong nhung mon an don gian,
    ngon va pho bien nhat khi nhac den cua bien.",
  price: 120000,
  ratinger: 20,
  quantity: 2,
  current_score: 4.5,
  category_id: 3

ProductImage.create! product_id: 1,
  remote_image_url: "http://sesan.com.vn/upload/hinh-anh/hinh-anh-thumb-1373991508.jpg"

Product.create! name: "Cua rang muoi",
  description: "Cua rang muoi la mon an kha gan gui va mang lai
    huong vi dam da kho cuong. Cua rang muoi luon lam nguoi an thuong nho boi
    vi man ngot hap dan",
  price: 150000,
  ratinger: 15,
  quantity: 4,
  current_score: 4.0,
  category_id: 3

ProductImage.create! product_id: 2,
  remote_image_url: "https://ameovat.com/wp-content/uploads/2016/04/ca1-600x400.jpg"

Product.create! name: "Rau cua",
  description: "Rau cang cua la mot loai rau troi, moc hoang va tuoi tot o nhung
  noi am uot, chua nhieu duong chat co loi cho suc khoe. Mon cua nay thanh mat.",
  price: 200000,
  ratinger: 15,
  quantity: 4,
  current_score: 4.0,
  category_id: 3

ProductImage.create! product_id: 3,
  remote_image_url: "http://legiaseafood.com/uploads/product/full_8ityi15irw1w665-539-cang-cua-tron-tom-thit.jpg"

Product.create! name: "Bun bo hue",
  description: "Bun bo hue la mot trong nhung dac san cua xu Hue. Nhac den Hue
    khong ai khong biet den mon an huyen thoai nay.",
  price: 35000,
  ratinger: 20,
  quantity: 2,
  current_score: 4,
  category_id: 5

ProductImage.create! product_id: 4,
  remote_image_url: "http://nau.vn/wp-content/uploads/2014/12/cach-lam-bun-bo-hue.jpg"

Product.create! name: "Bun cha",
  description: "Bun cha la mon an voi bun, cha thit lon nuong tren than hoa va
    bat nuoc mam chua cay man ngot. Mon an nay co xuat xu tu mien bac Viet Nam.",
  price: 25000,
  ratinger: 20,
  quantity: 2,
  current_score: 3.5,
  category_id: 5

ProductImage.create! product_id: 5,
  remote_image_url: "https://media.foody.vn/res/g17/165697/prof/s/foody-mobile-buncha2-jpg-227-635772147293009564.jpg"

Product.create! name: "Bun thang Ha Noi",
  description: "An bun thang o hang tat nhien la dat nhung thuc su la ngon.
    Bun thang lam o nha khong sao dich noi.",
  price: 25000,
  ratinger: 20,
  quantity: 2,
  current_score: 3.5,
  category_id: 5

ProductImage.create! product_id: 6,
  remote_image_url: "https://aacvanblog.files.wordpress.com/2012/01/1311738275_bun-thang.jpg"

Product.create! name: "Ding Tea",
  description: "Ding Tea la thuong hieu do uong lon nhat cua Dai Loan tai Trung Quoc,
    Ding tea dang nhu mot con bao lan rong rat nhanh chong sang cac nuoc Chau A.",
  price: 28000,
  ratinger: 20,
  quantity: 2,
  current_score: 2.5,
  category_id: 6

ProductImage.create! product_id: 7,
  remote_image_url: "http://img.yeah1.com/upload/news/06022015/1423158069_b2.jpg"

Product.create! name: "ToCo",
  description: "ToCo-Toco la tra sua thuong hieu Viet nhung trong do la su ket hop giua
    huong vi Dai Loan va chat tinh tuy trong net am thuc Viet.",
  price: 50000,
  ratinger: 20,
  quantity: 2,
  current_score: 4,
  category_id: 6

ProductImage.create! product_id: 8,
  remote_image_url: "http://channel.mediacdn.vn//prupload/166/2014/09/img20140930135507499.jpg"

Product.create! name: "Tra sua kep banh",
  description: "Ban hay thu tra sua nay, vua an vua uong, vua het doi vua het khat.",
  price: 10000,
  ratinger: 15,
  quantity: 3,
  current_score: 3.0,
  category_id: 6

ProductImage.create! product_id: 9,
  remote_image_url: "http://cuahangnguyenlieu.com.vn/upload/images/Tin-tuc/thumbnail/cung-cap-nguyen-lieu-lam-tra-sua-quan-11-Y3TF91JJIW.jpg"

Product.create! name: "Kem oc que",
  description: "Kem oc que chac han chang con xa la gi voi tat ca chung ta,
    no gan lien voi tuoi tho mot thoi ngay ngo hon nhien.",
  price: 5000,
  ratinger: 20,
  quantity: 2,
  current_score: 4.9,
  category_id: 7

ProductImage.create! product_id: 10,
  remote_image_url: "http://vuakem.com/uploads/images/Kem-ngon-vua-kem-01.jpg"

Product.create! name: "Kem dong doi",
  description: "An kem la phai co dong doi, co ban be moi vui, chu an mot minh
    thi buon lam, ban hay thu den voi chung toi, mon kem dong doi. Mua muoi tang 1,
    giam gia 20%.",
  price: 5000,
  ratinger: 10,
  quantity: 100,
  current_score: 4.0,
  category_id: 7

ProductImage.create! product_id: 11,
  remote_image_url: "http://g.vatgia.vn/gallery_img/16/lnc1400317044.png"

Product.create! name: "Kem thap cam",
  description: "Kem thap cam se dua ban den voi the gioi cua muon huong vi,
    rat nhieu the loai cho cac ban lua chon, nhanh len con chan chu gi nua.",
  price: 15000,
  ratinger: 20,
  quantity: 10,
  current_score: 4.4,
  category_id: 7

ProductImage.create! product_id: 12,
  remote_image_url: "http://img2.news.zing.vn/2012/12/21/jelly6a.jpg"

User.create! name: "Framgia",
  email: "1@gmail.com",
  address: "Ha Noi",
  password: "1",
  role: 0,
  phone: 987654321

User.create! name: "Gate",
  email: "2@gmail.com",
  address: "Ho Chi Minh city",
  password: "2",
  role: 1,
  phone: 123456789

User.create! name: "Ronadinho",
  email: "3@gmail.com",
  address: "Da Nang city",
  password: "3",
  role: 1,
  phone: 123456789

User.create! name: "Lazada",
  email: "4@gmail.com",
  address: "Can Tho city",
  password: "4",
  role: 1,
  phone: 123456789

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 2,
  product_id: 1

Comment.create! content: "Toi thich bun bo hue!",
  user_id: 1,
  product_id: 1

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 2,
  product_id: 1

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 3,
  product_id: 2

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 4,
  product_id: 2

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 1,
  product_id: 2

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 3,
  product_id: 3

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 2,
  product_id: 3

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 1,
  product_id: 4

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 4,
  product_id: 4

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 2,
  product_id: 5

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 1,
  product_id: 5

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 4,
  product_id: 6

Comment.create! content: "Mon nay rat rat ngon!",
  user_id: 2,
  product_id: 7
