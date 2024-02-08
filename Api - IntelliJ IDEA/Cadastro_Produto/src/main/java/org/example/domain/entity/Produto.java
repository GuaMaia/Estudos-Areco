package org.example.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "produto")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Produto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "DESCRICAO")
    private String descricao;

    @Column(name = "UNIDADE")
    private String unidade;

    @Column(name = "PRECO_UNITARIO")
    private BigDecimal preco;
}