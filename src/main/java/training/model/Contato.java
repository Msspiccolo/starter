package training.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Contato {

    private Integer idContato;
    private String nome;
    private String telefone;
    private String genero;
    private Boolean ativo;
    private String estadoCivil;
    private String observacoes;
}
