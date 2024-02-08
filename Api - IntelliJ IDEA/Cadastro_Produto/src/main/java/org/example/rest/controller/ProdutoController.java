package org.example.rest.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.example.domain.entity.Produto;
import org.example.domain.repository.Produtos;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import java.util.List;
@RestController
@RequestMapping("/api/produtos")
@Api("Api Produto")
public class ProdutoController {

    private Produtos produtos;
    public ProdutoController(Produtos produtos) {
        this.produtos = produtos;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    @ApiOperation("Salvando um novo produto")
    public Produto save (@RequestBody @ApiParam("Id do Produto")  Produto produto) {
        return produtos.save(produto);
    }

    // delete
    //O método DELETE requer o ID exclusivo do recurso.
    @DeleteMapping("{id}")
    @ApiOperation("Deletar o por Id Produto")
    public void delete (@PathVariable @ApiParam("Id do Produto")  Integer id) {
        produtos.findById(id)
                .map( produto -> {
                    produtos.delete(produto);
                    return produto;
                }).orElseThrow(() ->
                        new ResponseStatusException(HttpStatus.NOT_FOUND,
                                "Produto não encontrado "));
    }

    // put (atualizar)
    //Use o método PUT para atualizar ou inserir um recurso. Uma solicitação de atualização deve
    // fornecer o ID exclusivo do recurso.
    // Para atualizar um recurso da estrutura de objeto, o ID do objeto principal é necessário.
    @PutMapping("{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @ApiOperation("Editar Produto")
    public void update (@PathVariable @ApiParam("Id do Produto")  Integer id,
                        @RequestBody  Produto produto){
        produtos.findById(id)
                .map( produtoExiste -> {
                    produto.setId(produtoExiste.getId());
                    produtos.save(produto);
                    return produtoExiste;

                }).orElseThrow(() ->
                        new ResponseStatusException(HttpStatus.NOT_FOUND,
                                "Produto não encontrado "));
    }

    /// filtro
    @GetMapping
    public List<Produtos> find ( Produto filtro) {
        ExampleMatcher matcher = ExampleMatcher
                .matching()
                .withIgnoreCase()
                .withStringMatcher(
                        ExampleMatcher.StringMatcher.CONTAINING);

        Example example = Example.of(filtro, matcher);
        return produtos.findAll(example);
    }

    // Comando Get
    @GetMapping("{id}")
    @ApiOperation("Obter detalhes de um produto")
    public  Produto getProdutoById(@PathVariable @ApiParam("Id do Produto") Integer id) {
        return produtos.findById(id)
                .orElseThrow(() ->
                        new ResponseStatusException(HttpStatus.NOT_FOUND,
                                "Produto não encontrado "));
    }

}
