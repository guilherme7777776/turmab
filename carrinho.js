// Recupera os dados do sessionStorage
let dados = sessionStorage.getItem('dadosForm');

// Se os dados existirem, converte de JSON para um objeto/array
if (dados) {
  let produtos = JSON.parse(dados);

  // Filtra os produtos que possuem quantidade maior que 0
  let produtosNoCarrinho = produtos.filter(produto => produto.qtd > 0);

  // Exibe os produtos no console (opcional, para depuração)
  console.log('Produtos no carrinho:', produtosNoCarrinho);

  // Se houver produtos no carrinho, exibe na tela
  if (produtosNoCarrinho.length > 0) {
    const carrinhoElement = document.getElementById('carrinho');
    
    // Gera o HTML para os produtos do carrinho
    produtosNoCarrinho.forEach(produto => {
      const itemCarrinho = document.createElement('div');
      itemCarrinho.classList.add('produto');
      
      itemCarrinho.innerHTML = `
        <h3>${produto.nome}</h3>
        <img src=${produto.imagem}>
        <p>Preço: R$ ${produto.preco}</p>
        <p>Quantidade: ${produto.qtd}</p>
        <p>Total: R$ ${(produto.preco * produto.qtd).toFixed(2)}</p>
      `;
      
      carrinhoElement.appendChild(itemCarrinho);
    });
  } else {
    // Se não houver produtos no carrinho
    const carrinhoElement = document.getElementById('carrinho');
    carrinhoElement.innerHTML = "<p>Seu carrinho está vazio.</p>";
  }
} else {
  console.log('Nenhum dado encontrado no sessionStorage.');
  alert('Nenhum produto encontrado no carrinho.');
}
