class produto{
  constructor(id, nome, preco, qtd){
      this.id = id
      this.nome = nome
      this.preco = preco
      this.qtd = qtd
  }
}

let listaproduto = [
  new produto(1, "Rust in Peace - Megadeth", 50, 0),
  new produto(2, "Paula Fernandes - Passaro of Fire", 60, 0),
  new produto(3, "Weezer - Weezer", 60, 0),
  new produto(4, "Vida - Padre Fabio de Melo", 60, 0),
  new produto(5, "Black Clouds & Silver Linings - Dream Theater", 60, 0),
  new produto(6, "Temple of Shadows - Angra", 60, 0),
  new produto(7, "Camisa da Banda Xavlegbmaofffassssitimiwoamndutroabcwapwaeiippohfffx", 0, 0),
  new produto(8, "Camisa Megadeth - Piss Sells", 40, 0),
  new produto(9, "Camisa do Santos", 40, 0),
  new produto(10, "Blew - Nirvana", 80, 0),
  new produto(11, "Seven Inches of Satanic Panic - Ghost", 90, 0)
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
    console.log(listaproduto[1].qtd)
  }
}
  
