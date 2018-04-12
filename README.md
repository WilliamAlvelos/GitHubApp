# Criar um aplicativo de consulta a API do [GitHub](https://github.com)#

Criar um aplicativo para consultar a [API do GitHub](https://developer.github.com/v3/) e trazer os repositórios mais populares de Swift. Basear-se no mockup fornecido:

![bitbucket.png](https://bitbucket.org/repo/bApLBb/images/1070562783-bitbucket.png)

### **Deve conter** ###

- __Lista de repositórios__. Exemplo de chamada na API: `https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1`
  * Paginação na tela de lista, com endless scroll / scroll infinito (incrementando o parâmetro `page`).
  * Cada repositório deve exibir Nome do repositório, Descrição do Repositório, Nome / Foto do autor, Número de Stars, Número de Forks
  * Ao tocar em um item, deve levar a lista de Pull Requests do repositório

- __Pull Requests de um repositório__. Exemplo de chamada na API: `https://api.github.com/repos/<criador>/<repositório>/pulls`
  * Cada item da lista deve exibir Nome / Foto do autor do PR, Título do PR, Data do PR e Body do PR
  * Ao tocar em um item, deve abrir no browser a página do Pull Request em questão

### **A solução DEVE conter** ##

* Versão mínima do iOS : 9.*
* Swift 3
* Múltiplos targets (Development, Staging, Release)
* Cada target deverá ter diferentes strings, url's (pode ser a mesma em todos os targets), imagens e cores.
* Usar Autolayout (View code ou Storyboard).
* Gestão de dependências no projeto.
* Framework para Comunicação com API.
* Mapeamento json -> Objeto.

### **Ganha + pontos se contiver** ###

* Solução
* Arquitetura diferenciada. Ex. MVVM, Viper, etc. (saber defender a escolha)
* Distribuição configurada com Fastlane.
* Testes unitários no projeto. 
* Cache de Imagens.
* Utilizar RxSwift.

### **OBS** ###

A foto do mockup é meramente ilustrativa, exercite sua criatividade.