class produto{
  constructor(id, nome, preco, qtd, imagem){
      this.id = id
      this.nome = nome
      this.preco = preco
      this.qtd = qtd
      this.imagem = imagem
  }
}

let listaproduto = [
  new produto(1, "Rust in Peace - Megadeth", 50, 0, "https://preview.redd.it/the-rust-in-peace-album-cover-is-so-great-v0-9fls69h6v6od1.jpeg?width=640&crop=smart&auto=webp&s=fb8a2eff6281801eebc3f03aa8848fe2333f701d"),
  new produto(2, "Paula Fernandes - Passaro of Fire", 60, 0, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOMJm17Ni6qy2JDilmax_4G2vavqV6zXhG8g&s"),
  new produto(3, "Weezer - Weezer", 60, 0, "https://upload.wikimedia.org/wikipedia/pt/4/4f/Weezer_-_Blue_Album.jpg"),
  new produto(4, "Vida - Padre Fabio de Melo", 60, 0, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXtosl6dg0FfwKuLy50MKLKcNOGkWpCuICrg&s"),
  new produto(5, "Black Clouds & Silver Linings - Dream Theater", 60, 0, "https://m.media-amazon.com/images/I/71QVLO-+6wL._UF1000,1000_QL80_.jpg"),
  new produto(6, "Temple of Shadows - Angra", 60, 0, "https://upload.wikimedia.org/wikipedia/pt/0/05/TempleOfShadowsAngra.jpg"),
  new produto(7, "Camisa da Banda Xavlegbmaofffassssitimiwoamndutroabcwapwaeiippohfffx", 0, 0, "https://m.media-amazon.com/images/I/61SosF6VGHS._AC_SY350_QL65_.jpg"),
  new produto(8, "Camisa Megadeth - Piss Sells", 40, 0, "https://mockup-api.teespring.com/v3/image/R2aP02mOvfrFBn0QMj4vANHz11w/800/800.jpg"),
  new produto(9, "Camisa do Santos", 40, 0, "https://acdn-us.mitiendanube.com/stores/002/152/760/products/camisa-santos-2023-oficial-umbro-branca-preto1-6c52899fb15401485a16841947458043-1024-1024.jpeg"),
  new produto(10, "Blew - Nirvana", 80, 0, "https://upload.wikimedia.org/wikipedia/en/d/d1/NirvanaBlewEP.jpg"),
  new produto(11, "Seven Inches of Satanic Panic - Ghost", 90, 0, "https://upload.wikimedia.org/wikipedia/en/a/af/Ghost_-_Seven_Inches_of_Satanic_Panic.jpg")
];


function mostrar(secao) {
  const paginas = document.querySelectorAll('.pagina');
  paginas.forEach(pagina => pagina.classList.remove('ativa'));
  document.getElementById(secao).classList.add('ativa');
}
  
function alterarQuantidade(idProduto, operacao) {
  const quantidade = document.getElementById(idProduto);
  let quant = parseInt(quantidade.textContent);
  quant += operacao;
  if (quant < 0) quant = 0;
  quantidade.textContent = quant;
  for(let i = 0 ; i<listaproduto.length ; i++){
    
    if(idProduto == listaproduto[i].id){
      listaproduto[i].qtd = quant
    }
    console.log(listaproduto[i])
  }
}


function littlecar() {
  // Serializando os dados
  sessionStorage.setItem('dadosForm', JSON.stringify(listaproduto));

  // Redireciona para a página carrinho.html
  window.location.href = 'carrinho.html';
}


